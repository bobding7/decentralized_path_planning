#!/usr/bin/env python

import sys
import rospy
from mstar.msg import Pose2D
from mstar.msg import Pose2DList
from mstar.msg import Path2D
from mstar.msg import Belief
from mstar.srv import PriorityPlan 

if __name__ == "__main__":
    rospy.wait_for_service('agent1/priority_plan')
    try:
        s = rospy.ServiceProxy('agent1/priority_plan', PriorityPlan)
        # fix_paths = [[(0, 0, 1), (1, 0, 1), (2, 0, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1)], [(5, 5, 2), (5, 6, 2)], [(5, 2, 3), (5, 2, 3), (5, 2, 3), (5, 2, 3), (5, 2, 3), (5, 2, 3), (5, 2, 3), (5, 2, 3)]]
        fix_paths = []
        paths = Belief()
        for p in fix_paths:
            path = Path2D()
            for i in p:
                pose = Pose2D(i[0], i[1], i[2])
                path.poses.append(pose)
            paths.belief.append(path)
        print paths

        start = Pose2DList()
        start.poses.append(Pose2D(3, 5, 2))
        start.poses.append(Pose2D(6, 5, 4))
        #  print start

        goal = Pose2DList()
        goal.poses.append(Pose2D(10, 5, 1))
        goal.poses.append(Pose2D(1, 5, 1))
        # print goal

        # start = Pose2DList()
        # start.poses.append(Pose2D(6, 11, 1))
        # start.poses.append(Pose2D(8, 1, 1))
        #  print start

        # goal = Pose2DList()
        # goal.poses.append(Pose2D(1, 1, 3))
        # goal.poses.append(Pose2D(1, 7, 3))

        res = s([1,2], paths, start, goal)
    except rospy.ServiceException, e:
        pass
