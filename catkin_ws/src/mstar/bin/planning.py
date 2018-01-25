#! /usr/bin/env python

import rospy
from mstar.mstar_planner import MStarPlanner

if __name__ == "__main__":
	try:
		selfID = rospy.get_param('Planner/agent_identity')
		m_planner = MStarPlanner(selfID)
		m_planner.start()
	except rospy.ROSInterruptException:
		pass