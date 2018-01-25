#! /usr/bin/env python

import rospy
from collision_checker.ColChecker import CollisionChecker

if __name__ == "__main__":
	try:
		selfID = rospy.get_param('Checker/agent_identity')
		col_checker = CollisionChecker(selfID)
		col_checker.start()
	except rospy.ROSInterruptException:
		pass