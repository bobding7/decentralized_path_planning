#!/usr/bin/env python  
import geometry_msgs.msg
import numpy
import od_mstar
import os
import random
import rospy

from PIL import Image

def png_to_obs_map(file_name):
    file_path = os.path.join(os.path.dirname(__file__), file_name)
    im = Image.open(file_path).convert('1')
    width = im.size[0]
    vals = list(im.getdata())
    # convert to matrix with 0 for white (free) and 1 for black (obstacle)
    return [[1 if x==0 else 0 for x in vals[i:i+width]] for i in range(0, len(vals), width)]

if __name__ == '__main__':
    obs_map = png_to_obs_map('../obstacles/walls_conservative.png')
    # print(obs_map)

    rospy.init_node('mstar_commands')
    pub = rospy.Publisher('husky_velocity_controller/cmd_vel', geometry_msgs.msg.Twist, queue_size=1)

    # sets the loop to publish at a rate of 10Hz
    rate = rospy.Rate(10.0)
    while not rospy.is_shutdown():
        
        msg = geometry_msgs.msg.Twist()
        msg.linear.x = random.uniform(-2.0, 2.0)
        msg.angular.z = random.uniform(-3.0, 3.0)
        
        pub.publish(msg)

        rate.sleep()