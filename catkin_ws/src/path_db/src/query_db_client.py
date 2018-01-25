#!/usr/bin/env python

import sys
import rospy
from path_db.srv import *
from path_db.msg import *

def query_db_client(type, in_belief):
    rospy.wait_for_service('query_db')
    try:
        query_db = rospy.ServiceProxy('query_db', QueryDB)
        resp1 = query_db(type, in_belief)
        return resp1.out_belief
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

def print_belief(belief):
    for belief_idx in range(0, len(belief.belief)):
        id = belief.belief[belief_idx].id
        print "Printing belief index [%i] ... "%(id)
        print "    Belief [%i] time stamp = %i "%(id, belief.belief[belief_idx].timestamp)
        print "    Belief [%i] path length = %i "%(id, len(belief.belief[belief_idx].poses))
        for pose_idx in range(0, len(belief.belief[belief_idx].poses)):
            pose = belief.belief[belief_idx].poses[pose_idx]
            print "        [%f, %f, %f]"%(pose.x, pose.y, pose.yaw)
        print " "
    return

if __name__ == "__main__":

    # test case 0
    type0 = 'query'
    out_belief0 = query_db_client(type0, Belief())
    print "[Query] Empty database:"
    print_belief(out_belief0)

    # test case 1
    type1 = 'update'
    in_belief1 = Belief()
    temp_path = Path2D()
    temp_path.id = 1
    temp_path.timestamp = 10
    pose1 = Pose2D()
    pose1.x = 0.755814
    pose1.y = 1.20841
    pose1.yaw = 0
    temp_path.poses.append(pose1)
    pose2 = Pose2D()
    pose2.x = 15.8721
    pose2.y = 9.26446
    pose2.yaw = 0
    temp_path.poses.append(pose2)
    in_belief1.belief.append(temp_path)
    out_belief1 = query_db_client(type1, in_belief1)
    print "[update] Out belief 1:"
    print_belief(out_belief1)
    

    # test case 2
    type2 = 'update'
    in_belief2 = Belief()
    temp_path = Path2D()
    temp_path.id = 1
    temp_path.timestamp = 5
    pose1 = Pose2D()
    pose1.x = 3.66279
    pose1.y = 12.2855
    pose1.yaw = 0
    temp_path.poses.append(pose1)
    pose2 = Pose2D()
    pose2.x = 28.6628
    pose2.y = 7.25045
    pose2.yaw = 0
    temp_path.poses.append(pose2)
    pose3 = Pose2D()
    pose3.x = 22.8488
    pose3.y = 3.22242
    pose3.yaw = 0
    temp_path.poses.append(pose3)
    in_belief2.belief.append(temp_path)
    out_belief2 = query_db_client(type2, in_belief2)
    print "[update] Out belief 2:"
    print_belief(out_belief2)
