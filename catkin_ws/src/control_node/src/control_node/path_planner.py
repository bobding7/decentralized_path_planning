import numpy as np
from scipy.spatial import KDTree as kdtree 
import os
import pickle
import getModelStates
import rospy
import tf

from control_node.msg import Path2D
from control_node.msg import Pose2D
from control_node.msg import Belief
from control_node.srv import Planner
from control_node.srv import QueryDB

from mstar_pkg import od_mstar
# from mstar_pkg import hexagon_workspace
# from mstar.msg import Pose2D
# from mstar.msg import Pose2DList
# from mstar.msg import Path2D
# from mstar.msg import Path2DList
# from mstar.srv import PlanPath

class pathPlanner:
	def __init__(self, selfID):
		self.selfID = selfID
		rospy.init_node('agent' + str(self.selfID) + '/Planner', anonymous=True)

		current_dir = os.path.dirname(__file__)
		node_data = pickle.load(open(current_dir + "/../../data/nodes.p"))
		edge_data = pickle.load(open(current_dir + "/../../data/edges.p"))
		self.node_list = {node_id: (x, y) for (node_id, x, y) in node_data}
		self.world = [node_data, edge_data]

		self.service = rospy.Service("/Planner", Planner, self.path_plan)
		# self.path_pub = rospy.Publisher("/mstar_path", Path2DList, queue_size=1)
		# self.goal_sub = rospy.Subscriber('Husky_' + 'agent' + str(self.selfID) + '/goalPosition', Pose2D, self.Callback, queue_size=5000)
		self.listener = tf.TransformListener()

		queryDB_srv_name = 'agent' + str(self.selfID) + '/QueryDB'
		rospy.wait_for_service(queryDB_srv_name)
		self.queryDB = rospy.ServiceProxy(queryDB_srv_name, QueryDB)
		
		rospy.loginfo("Planner initialized")

	# def Callback(self, ros_data):
	# 	for agent in self.agentIDList:
	# 		(trans,~) = 
	# 		listener.lookupTransform('agent' + str(self.agent) + 'goalPosition',
	# 		 '/World', rospy.Time(0))


	def make_pose_item(self, pose):
		index = self.find_closest_node_index(pose)
		return (self.node_list.keys()[index], (self.node_list.values()[index][0], self.node_list.values()[index][1], self.norm_yaw(pose.yaw)))

	def find_closest_node_index(self, pose):
		pt = [pose.x, pose.y]
		node_array = np.asarray(self.node_list.values())
		return kdtree(node_array).query(pt)[1]

	def norm_yaw(self, input_yaw):
		return input_yaw

	def generate_path(self, pathAsTuple):
		result = Path2D()
		for path in path_list:
			pose = Pose2D()
			pose.x = path[1][0]
			pose.y = path[1][1]
			pose.yaw = path[1][2]
			result.poses.append(pose)
		return result


	def path_plan(self, robotIDs):
		"""
		M* planner service

		:param Pose2DList current_poses: the list of current robot poses in order
		:param Pose2DList target_poses: the list of target robot poses in order
		:return: Path2DList planned path for all robot in order
		"""
		# current_poses = req.current
		# target_poses = req.target

		# Get the current position from simulation
		startPosition = ()
		for currentAgent in robotIDs:
			# agentState = getModelStates.gms_client('Husky_' + 'agent' + str(self.currentAgent),'world')
			# startPosition+=(([agentState.pose.position.x, agentState.pose.position.y, 
                                    # math.copysign(2*math.acos(agentState.pose.orientation.w),agentState.pose.orientation.z)]),)
			
			
			# Get the goal positions from rostopics "agent#/goalPosition"
			(trans,~) = listener.lookupTransform('agent' + str(self.agent) + 'goalPosition',
			 'world', rospy.Time(0))
			goalPosition+=((trans[0], trans[1], trans[2]),)

		if len(current_poses.poses) != len(target_poses.poses):
			rospy.loginfo("current and target pose length does not match!")
			return

		rospy.loginfo("Start planning...")
		# rospy.loginfo("current pose: ")
		# rospy.loginfo(current_poses)
		# rospy.loginfo("target pose: ")
		# rospy.loginfo(target_poses)

		# current_group = tuple([(self.make_pose_item(pose)) for pose in current_poses.poses])
		# target_group = tuple([(self.make_pose_item(pose)) for pose in target_poses.poses])

		# m = od_mstar.Od_Mstar(self.world, goalPosition, True, 
		# 	sub_search = {(i,): hexagon_workspace.Astar_Graph(self.world, goalPosition[i]) for i in xrange(len(target_group))},
		# 	col_checker = hexagon_workspace.Edge_Checker())
		m = od_mstar.Od_Mstar(obs_map, goal_pos, False)
		pathAsTuple = m.find_path(startPosition)

		# resultPathList = Path2DList()
		resultPathList = []
		for path in pathAsTuple:
			resultPath = self.generate_path(path)
			resultPathList.append(resultPath)

		return resultPathList


	def start(self):
		rospy.loginfo("Planner started")
		rate = rospy.Rate(10)

		while not rospy.is_shutdown():
			rate.sleep()