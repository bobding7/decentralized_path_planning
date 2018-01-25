import rospy
from geometry_msgs.msg import Twist
from math import radians
import numpy as np
import od_mstar
import math
import tf
import geometry_msgs.msg
import getModelStates
import sys
from PIL import Image
from mstar_driver import png_to_obs_map
import single_closed_loop_tracking


class multiagent_path_tracking():
	"""docstring for multiagent_path_tracking"""
	def __init__(self):
	# Find paths given the goal position
		obs_map = png_to_obs_map('walls_conservative.png')
		path_map = np.uint8((np.matrix(obs_map) == 0) * 255)

		m = od_mstar.Od_Mstar(obs_map, ((25,25), (20,100)), False)
		self.path = m.find_path(((15,16), (30,30)))
		# print(path)

	# What to do if you press ctrl + c    
		rospy.on_shutdown(self.shutdown)

	def multi_agent_move (self):
		agent_controller = single_closed_loop_tracking.singleagent_path_tracking()
		agent_controller.single_agent_motion(1, self.path)
		# m.single_agent_motion(2)

	def shutdown(self):
	    # stop agent
		rospy.loginfo("Stop Moving")
		self.cmd_vel.publish(Twist())
		rospy.sleep(1)
 
if __name__ == '__main__':
	try:
		multiagent_path_tracking()
	except:
		rospy.loginfo("node terminated.")