#!/usr/bin/env python

from path_db.srv import *
from path_db.msg import *
import rospy

global database

def init_db(robot_num):
    rospy.init_node('querydb', anonymous=True)
    belief = Belief()
    for robot_idx in range(0, robot_num):
        temp_path = Path2D()
        temp_path.id = robot_idx
        temp_path.timestamp = rospy.get_rostime().nsecs
        belief.belief.append(temp_path)
    return belief

def handle_query_db(req):
    temp_type = req.type
    temp_in_belief = req.in_belief
    if temp_type == 'update':
        print('update')
        for belief_idx in range(0, len(temp_in_belief.belief)):
            new_id = temp_in_belief.belief[belief_idx].id - 1
            new_timestamp = temp_in_belief.belief[belief_idx].timestamp
            current_timestamp = database.belief[new_id].timestamp
            current_poselength = len(database.belief[new_id].poses)
            if current_poselength == 0: # empty entry, direct update
                database.belief[new_id].poses = temp_in_belief.belief[belief_idx].poses
                database.belief[new_id].timestamp = new_timestamp
            else: # non-empty entry, cmp time stamp
                if current_timestamp > new_timestamp: # update
                    database.belief[new_id].poses = temp_in_belief.belief[belief_idx].poses
                    database.belief[new_id].timestamp = new_timestamp
    elif temp_type == 'query':
        print('query')
    else:
        print('error') 

    # print_belief(database)
    return database

def query_db_server():
    s = rospy.Service('query_db', QueryDB, handle_query_db)
    print "Ready to query database"
    rospy.spin()


if __name__ == "__main__":
    robot_num = 3
    database = init_db(robot_num)
    query_db_server()
