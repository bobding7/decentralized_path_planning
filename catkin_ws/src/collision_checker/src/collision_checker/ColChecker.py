#!/usr/bin/env python
import os
import math
import rospy

from collision_checker.msg import CollisionIDs
import getModelStates
from std_msgs.msg import String

class CollisionChecker:
	def __init__(self, selfID):
		self.selfID = selfID
		rospy.init_node("", anonymous=False)
		self.IDpub  = rospy.Publisher("has_collision", CollisionIDs, queue_size = 1)

		# self.service = rospy.Service("checker", Checker, self.check_collision)
		rospy.loginfo("Planner initialized")
		rospy.Subscriber('/agentsNames', String, self.IDcallback)

		self.rangeChecker = 4.8	
		self.allRobotIDs = []

	def IDcallback(self, data):
		self.allRobotIDs = [int(s) for s in data.data.split(',')]

	def distance(self, selfAgentState, otherAgentState):
		distance = math.sqrt((selfAgentState.pose.position.x - otherAgentState.pose.position.x)**2 + 
			(selfAgentState.pose.position.y - otherAgentState.pose.position.y)**2)
		return distance

	def getYawInt(self, orientation):
		return ((int(2.0*
			math.copysign(2*math.acos(orientation.w),orientation.z)/math.pi) + 3)%4)+1
	
	def check_collision(self):
		selfAgentState = getModelStates.gms_client('Husky_' + 'agent' + str(self.selfID),'world')
		colAgentIDs = CollisionIDs()
		colAgentIDs.colAgents.append(self.selfID)

		if len(self.allRobotIDs) < 1:
			return

		otherAgentStates = []
		for agent in self.allRobotIDs:
			if not (agent==self.selfID):
				otherAgentState = getModelStates.gms_client('Husky_' + 'agent' + str(agent),'world')
				if (self.distance(selfAgentState, otherAgentState) < self.rangeChecker):
					colAgentIDs.colAgents.append(agent)
					otherAgentStates.append(otherAgentState)

		if(len(colAgentIDs.colAgents)>1):
			# result = Pose2DList()

			# self_pos = Pose2D(selfAgentState.pose.position.x, 
			# 	selfAgentState.pose.position.y, 
			# 	self.getYawInt(selfAgentState.pose.orientation))
			# result.poses.append(self_pos)

			# for otherAgentState in otherAgentStates:
			# 	other_pos = Pose2D(otherAgentState.pose.position.x, 
			# 		otherAgentState.pose.position.y, 
			# 		self.getYawInt(otherAgentState.pose.orientation))
			# 	result.poses.append(other_pos)

			# colAgentIDs.poses = result
			self.IDpub.publish(colAgentIDs)
			rospy.sleep(10)

		# return colAgentIDs

	def start(self):
		rospy.loginfo("Checker started")
		rate = rospy.Rate(10)

		while not rospy.is_shutdown():
			self.check_collision()
			rate.sleep()
