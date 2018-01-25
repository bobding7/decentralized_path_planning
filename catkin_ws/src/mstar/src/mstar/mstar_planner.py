#!/usr/bin/env python
import numpy as np
from scipy.spatial import KDTree as kdtree 
import os
import pickle

import rospy

from mstar_pkg import od_mstar_headings
from mstar_pkg import workspace_graph_headings
from priority_plan import priority_planner
from mstar.msg import Pose2D
# from mstar.srv import PlanPath
from mstar.msg import Path2D
from mstar.msg import Belief
from mstar.srv import Planner
from mstar.srv import PriorityPlan

class MStarPlanner:
	def __init__(self, selfID):
		self.selfID = selfID
		rospy.init_node("mstar", anonymous=False)

		current_dir = os.path.dirname(__file__)
		with open(current_dir + "/../../data/highbay_obs_map_obs.txt") as inputFile:
			self.world = [[int(i) for i in line.strip().split('\t')] for line in inputFile]

		self.service = rospy.Service("Planner", Planner, self.path_plan)
		self.priority_srv = rospy.Service("priority_plan", PriorityPlan, self.priority_plan)
		rospy.loginfo("Planner initialized")

	def make_pose_item(self, pose): 
		return (int(round(pose.x)), int(round(pose.y)), self.norm_yaw(pose.yaw))

	def norm_yaw(self, input_yaw):
		return input_yaw

	def generate_path(self, path_list, robotIDs):
		result_path_list = Belief()
		for i in robotIDs:
			path = Path2D()
			path.id = i
			path.timestamp = rospy.Time.now().secs
			result_path_list.belief.append(path)

		for poses in path_list:
			for i in range(len(robotIDs)):
				pose = Pose2D()
				pose.x = poses[i][0]
				pose.y = poses[i][1]
				pose.yaw = poses[i][2]
				# pose.timeStamp = poses[i][3]
				result_path_list.belief[i].poses.append(pose)
			# timeStamp+=1

		return result_path_list

	def belief_space(self, path):
		mu, sigma = 0, 0.1
		s = np.random.normal(mu, sigma, len(path))

	def priority_plan(self, req):
		# print(req)
		req_paths = req.fix_paths
		current_poses = req.current
		target_poses = req.target
		robotIDs = req.robotIDs
		num_robot = len(current_poses.poses)

		if num_robot != len(target_poses.poses):
			rospy.loginfo("current and target pose length does not match!")
			return
		
		rospy.loginfo("Start priority planner...")

		current_group = tuple([(self.make_pose_item(pose)) for pose in current_poses.poses])
		target_group = tuple([(self.make_pose_item(pose)) for pose in target_poses.poses])

		if len(req_paths.belief) > 0:
			fix = [[(self.make_pose_item(pose)) for pose in path.poses] for path in req_paths.belief]
		else:
			fix = []
		
		p = priority_planner.PriorityPlanner(self.world, fix, 2)
		result = p.find_path(current_group, target_group)
		
		result_list = Belief()
		i = 0
		for r_path in result:
			path = Path2D()
			path.id = robotIDs[i]
			path.timestamp = rospy.Time.now().secs
			for r_pose in r_path:
				pose = Pose2D()
				pose.x = r_pose[0]
				pose.y = r_pose[1]
				pose.yaw = r_pose[2]
				path.poses.append(pose)
			result_list.belief.append(path)
			i += 1

		return result_list

	def path_plan(self, req):
		"""
		M* planner service

		:param Pose2DList current_poses: the list of current robot poses in order
		:param Pose2DList target_poses: the list of target robot poses in order
		:return: Belief planned path for all robot in order
		"""
		# print("reached inside planner service")
		# print(req)
		current_poses = req.startPosition
		target_poses = req.goalPosition
		# print(current_poses, target_poses)
		if len(current_poses.poses) != len(target_poses.poses):
			rospy.loginfo("current and target pose length does not match!")
			return

		rospy.loginfo("Start planning...")

		# rospy.loginfo("current pose: ")
		# rospy.loginfo(current_poses)
		# rospy.loginfo("target pose: ")
		# rospy.loginfo(target_poses)

		current_group = tuple([(self.make_pose_item(pose)) for pose in current_poses.poses])
		target_group = tuple([(self.make_pose_item(pose)) for pose in target_poses.poses])

		m = od_mstar_headings.Od_Mstar(self.world, 
			target_group, False)
		path_list = m.find_path(current_group, time_limit=420*60)
		# print(path_list)

		rospy.loginfo(path_list)

		result_path_list = self.generate_path(path_list, req.robotIDs) 
		#  rospy.loginfo(result_path_list)
		# print(result_path_list)
		return result_path_list


	def start(self):
		rospy.loginfo("Planner started")
		rate = rospy.Rate(10)

		while not rospy.is_shutdown():
			rate.sleep()
