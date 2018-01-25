#!/usr/bin/env python
"""
This is a small code to define the controller for one of the agent. 

"""

import os
import sys
import rospy
import numpy
from mstar.msg import Belief
from mstar.msg import Path2D
from mstar.msg import Pose2D 
from mstar.msg import Pose2DList
from mstar.srv import Planner
from mstar.srv import PriorityPlan

from collision_checker.msg import CollisionIDs	
from path_db.srv import QueryDB
from collision_checker.srv import Checker

from std_msgs.msg import String
from geometry_msgs.msg import Twist
import tf
import pickle
from math import radians
from copy import copy
import math
from IPython import embed
import getModelStates
from gazebo_msgs.msg import ModelState
from geometry_msgs.msg import Pose


class coordinator():
	'''
	Is the main brain of a single agent. 
	 1 - Initializes the information of the agent, 
	 2 - signals for the plannar to find a path plan for a single agent all multiple agents,
	 3 - and contacts the controllers of others agents when necessary...    
	
	Inputs: agent_id: the ID of a sinle agent, specified in "Dmstar.launch" in "control_node" pkg.
	'''
	
	def __init__(self, agent_id):

		self.selfID = agent_id		
		rospy.init_node('agent' + str(self.selfID) + '_controller', anonymous=False)
		
		self.frequency = 30
		self.rate = rospy.Rate(self.frequency);
		
		self.path = None
		self.moveFlag = False ## to make sure that self.move is not executed when the collision_callback is called (wait for the new updated plan and them resume path execution)
		self.collisionChecker = rospy.Subscriber("has_collision", CollisionIDs, self.collision_callback)
		self.pathsPub = rospy.Publisher('pathsPub', Belief, queue_size=1)
		self.global_path_pub = rospy.Publisher('/global_path', Belief, queue_size=1)
		self.selfPathPub = rospy.Publisher('selfPathPub', Path2D, queue_size=1)
		self.modelStatePub = rospy.Publisher('/gazebo/set_model_state', ModelState, queue_size=1)

		self.global_path_sub = rospy.Subscriber('/global_path', Belief, self.global_cb)
		self.path1 = rospy.Subscriber('/agent1/selfPathPub', Path2D, self.pathCallback1)
		self.path2 = rospy.Subscriber('/agent2/selfPathPub', Path2D, self.pathCallback2)
		self.path3 = rospy.Subscriber('/agent3/selfPathPub', Path2D, self.pathCallback3)
		# self.path4 = rospy.Subscriber('/agent4/selfPathPub', Path2D, self.pathCallback4)
		# self.path5 = rospy.Subscriber('/agent5/selfPathPub', Path2D, self.pathCallback5)
		
		self.listener = tf.TransformListener()

		planner_srv_name = '/agent' + str(self.selfID) + '/Planner'
		rospy.wait_for_service(planner_srv_name)
		self.plan = rospy.ServiceProxy(planner_srv_name, Planner)
		
		priority_srv_name = '/agent' + str(self.selfID) + '/priority_plan'
		rospy.wait_for_service(priority_srv_name)
		self.priority_plan = rospy.ServiceProxy(priority_srv_name, PriorityPlan)
		
		queryDB_srv_name = '/agent' + str(self.selfID) + '/query_db'
		rospy.wait_for_service(queryDB_srv_name)
		self.query_db = rospy.ServiceProxy(queryDB_srv_name, QueryDB)

		# checker_srv_name = '/agent' + str(self.selfID) + '/checker'
		# rospy.wait_for_service(checker_srv_name)
		# self.checker = rospy.ServiceProxy(checker_srv_name, Checker)

		self.counter = 0
		self.has_global = False

		self.goalPoses = [[10,5,1], [5,10,1], [1,5,1], [20,1,1], [20,10,1]]
		self.cmd_vel = rospy.Publisher('husky_velocity_controller/cmd_vel', Twist, queue_size=10)
		rospy.loginfo("coordinator initialized")

	def initialize(self):
		'''
		1 - publishes a static topic for the goal position of the agent
		2 - Calls planner with only the id of the current agent as arguement to run Astar for this agent 
		'''	

		## call planner to generate an Astart search plan for the current agent
		startPositionList = Pose2DList()
		goalPositionList = Pose2DList()
		startPose = Pose2D()
		goalPose = Pose2D()

		# rate = rospy.Rate(10.0)
		rospy.sleep(1.)
		agentState = getModelStates.gms_client('Husky_' + 'agent' + str(self.selfID),'world')
		# startPosition+=(([agentState.(pose.position.x, agentState.pose.position.y, 
		#                             math.copysign(2*math.acos(agentState.pose.orientation.w),agentState.pose.orientation.z)]),)
			
		startPose.x = int(1.0*agentState.pose.position.x/1.2 + 0.1) 
		startPose.y = -int(1.0*agentState.pose.position.y/1.2 - 0.1) 
		startPose.yaw = ((int(2.0*
			math.copysign(2*math.acos(agentState.pose.orientation.w),agentState.pose.orientation.z)/math.pi) + 3)%4)+1
		# startPose.timeStamp = 0
		startPositionList.poses.append(startPose)

		# Get the goal positions from rostopics "agent#/goalPosition"
		# (trans,_) = self.listener.lookupTransform('/world', '/agent' + str(self.selfID) + '_goalPose', rospy.Time(0))
		trans = self.goalPoses[self.selfID-1]
		goalPose.x = trans[0]
		goalPose.y = trans[1]
		goalPose.yaw = trans[2]
		goalPositionList.poses.append(goalPose)

		planner_srv_name = '/agent' + str(self.selfID) + '/Planner'
		rospy.wait_for_service(planner_srv_name)
		
		plannerReturnedPath = self.plan([self.selfID], startPositionList, goalPositionList)
		# resp = self.query_db('update', plannerReturnedPath.path)
		self.pathsPub.publish(plannerReturnedPath.path)
		for p in plannerReturnedPath.path.belief:
			if (p.id==self.selfID):
				self.path = p
				break
		self.selfPathPub.publish(self.path)

		rospy.loginfo('Agent-{} successfully initialized !'.format(self.selfID))
		self.moveFlag = True
		## TODO: execute path (shall call localTrajTracking service which converts paths to cmd_velocities)

	def getPositions(self, id_colliding_agent):
		# Get the current position from simulation
		startPositionList = Pose2DList()
		goalPositionList = Pose2DList()
		# startPose = Pose2D()
		# goalPose = Pose2D()

		# print "colliding agent:"
		# print id_colliding_agent

		for currentAgent in id_colliding_agent:
			goalPose = Pose2D()
			# if not (currentAgent == self.selfID):
				
			# 	self.has_sub = False
			# 	# self.something = rospy.Subscriber('/agent' + str(currentAgent) + '/selfPathPub', Path2D, self.pathCallback)
			# 	# while not self.has_sub:
			# 	# 	# print "other agent: %d" % currentAgent
			# 	# 	n = 1
			# 	rospy.sleep(0.5)
			# else:
			# 	self.startPose = self.path.poses[1]
			# 	# print("my path")
			# 	# print self.startPose
			if(currentAgent==1):
				startPositionList.poses.append(self.startPose1)
				trans = self.goalPoses[0]
			if(currentAgent==2):
				startPositionList.poses.append(self.startPose2)
				trans = self.goalPoses[1]
			if(currentAgent==3):
				startPositionList.poses.append(self.startPose3)
				trans = self.goalPoses[2]
			# if(currentAgent==4):
			# 	startPositionList.poses.append(self.startPose4)
			# 	trans = self.goalPoses[3]
			# if(currentAgent==5):
			# 	startPositionList.poses.append(self.startPose5)
			# 	trans = self.goalPoses[4]
				
			# print("all path")
			# print startPositionList.poses
			# Get the goal positions from rostopics "agent#/goalPosition"
			# (trans,_) = self.listener.lookupTransform('/world', '/agent' + str(currentAgent) + '_goalPose', rospy.Time(0))
			goalPose.x = trans[0]
			goalPose.y = trans[1]
			goalPose.yaw = trans[2]

			goalPositionList.poses.append(goalPose)

		return startPositionList, goalPositionList

	def pathCallback1(self, data):
		if len(data.poses) < 2:
			return
		self.startPose1 = data.poses[0]
		# print("others path")
		# print self.startPose1
		# self.has_sub = True

	def pathCallback2(self, data):
		if len(data.poses) < 2:
			return
		self.startPose2 = data.poses[0]

	def pathCallback3(self, data):
		if len(data.poses) < 2:
			return
		self.startPose3 = data.poses[0]

	def pathCallback4(self, data):
		if len(data.poses) < 2:
			return
		self.startPose4 = data.poses[0]

	def pathCallback5(self, data):
		if len(data.poses) < 2:
			return
		self.startPose5 = data.poses[0]

	def collision_callback(self, data):
		# self.has_global = False
		if(self.path == None):
			return
		self.moveFlag = False
		self.counter = 0 ## reinitialize the counter to loop on the path. Used in self.move

		id_colliding_agent = data.colAgents ## The id of the robot to be colliding with. (assuming one robot for simplicity) 
		# id_colliding_agent = CollisionIDs()
		# id_colliding_agent = self.checker()
		rospy.loginfo('Collision detected between agents {}'.format(id_colliding_agent) )
		startPositionList, goalPositionList = self.getPositions(id_colliding_agent)

		# resp = self.query_db('query', Belief())
		# temp_belief = Belief()
		# temp_belief = resp.out_belief 

		flag = 0 ## 0 for normal plan, and 1 for priority plan
		fix_paths = Belief()

		# for agent_idx in range(0, len(temp_belief.belief)):
		# 	if (agent_idx != self.selfID) and (agent_idx in id_colliding_agent == False):
		# 		if len(temp_belief.belief[agent_idx].poses) > 0 :
		# 			fix_paths.belief.append(temp_belief.belief[agent_idx].poses)
		# 			Falseg = 1
		# print(type(id_colliding_agent))
		if flag == 0:
			plannerReturnedPath = self.plan(list(id_colliding_agent), startPositionList	, goalPositionList) ## the number of returned paths is inferred from the number of agents_ids requested by the Planner service
		else:
			plannerReturnedPath = self.priority_plan(id_colliding_agent, fix_paths, startPositionList, goalPositionList)		
		
		# update database
		# resp = self.query_db('update', plannerReturnedPath.paths)

		if not self.has_global:
			print("agent %d: no global" % self.selfID)
			self.global_path_pub.publish(plannerReturnedPath.path)
			for p in plannerReturnedPath.path.belief:
				if (p.id==self.selfID):
					self.path.poses[:]=[]
					self.path.poses = p.poses
					break
			# self.path = paths.belief[self.selfID-1]
			
		else:
			print("agent %d: is global" % self.selfID)
			for p in self.global_path:
				if (p.id==self.selfID):
					self.path.poses[:]=[]
					self.path.poses = p.poses
					break			
			# self.path = paths[str(self.agent_id)] ## assuming the returned path are stored in a dictionary with the agent_id as the key. 		
		self.selfPathPub.publish(self.path)
		self.moveFlag = True

	def global_cb(self, cb):
		self.has_global = True
		self.global_path = cb.belief

	def directMove(self):
		# initiliaze
		# note: the name tag in the Dmstar launch file will overwrite the name of this
		# take the next waypoint, delete previous waypoint and publish the path
		if not self.moveFlag:
			return

		if len(self.path.poses) == 1:
			self.path.poses.append(self.path.poses[0])
		current_pose = self.path.poses[0]
		
		next_pose = self.path.poses[1]
		# current_pose = self.path.poses[self.counter]
		# next_pose = self.path.poses[self.counter + 1]
		# print("agent %d" % self.selfID)
		# print(next_pose)
		if(len(self.path.poses) >= 2):
			del(self.path.poses[0])
		self.selfPathPub.publish(self.path)

		# loop till the next point is reached
		yaw_diff = next_pose.yaw - current_pose.yaw
		# wrap up to 0 - pi/2
		if yaw_diff >= 2:
			yaw_diff -= 4
		elif yaw_diff <= -2:
			yaw_diff += 4

		step = ((next_pose.x - current_pose.x) / self.frequency, 
				(next_pose.y - current_pose.y) / self.frequency,
				(yaw_diff) / self.frequency)

		# start looping
		for i in range(self.frequency):
			pose = Pose()
			pose.position.x = 1.2*(current_pose.x + i*step[0]) + 0.6
			pose.position.y = -(1.2*(current_pose.y + i*step[1]) + 0.6)
			pose.position.z =  0.1
			pose.orientation.x = 0
			pose.orientation.y = 0
			pose.orientation.z = math.sin(-(current_pose.yaw + i*step[2] +2)/2*math.pi/2)
			pose.orientation.w = math.cos(-(current_pose.yaw + i*step[2] +2)/2*math.pi/2)

			state = ModelState()

			state.model_name = 'Husky_' + 'agent' + str(self.selfID)
			state.pose = pose
			self.modelStatePub.publish(state)
			self.rate.sleep()
		self.counter += 1

	def run(self):
		rospy.on_shutdown(self.shutdown)
		
		rospy.loginfo('Planner started for agent {}'.format(self.selfID))
		while not rospy.is_shutdown():
			# print("agent %d, moveflag: %d" % (self.selfID, self.moveFlag))
			if self.moveFlag:
			# if self.moveFlag and self.counter < len(self.path.poses):
				# if self.selfID==1:
				# 	print("agent {} position: ".format(self.selfID))
				# 	print(self.path.poses[0])
				# self.move()
				self.directMove()
				#  self.rate.sleep()
			else:
				self.cmd_vel.publish(Twist())

	def shutdown(self):
		# stop agent
		rospy.loginfo("Stop Moving")
		self.cmd_vel.publish(Twist())
		rospy.sleep(1)


if __name__ == '__main__':

	agentId = rospy.get_param('coordinator/agent_identity')
	coord = coordinator(agentId)

	coord.initialize()
	coord.run()
	
