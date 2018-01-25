"""
This code is to help understand the cmd_vel command and frequency settings.
In this code, we are setting the frequency of rospy, linear and angular velocity of the bot.
We then run the robot forward for some time (2 seconds here) 
followed by angular rotation for 2 seconds (equuivalent to 90 degrees rotation)
and repeat this forever. This makes the robot to move in squares/rectangle 
but due to slips/uncertainty, the path will not be exactly square
Remember that the control is open loop with no feedback

    1. Run command in terminal: python name_of_the_file.py
    2. Input Argument: None
    3. Output: None except for print commands on terminal
    4. Requirements: Availability of rostopic: "h1/husky_velocity_controller/cmd_vel" 
        else change the name of topic in first argument of rospy.Publisher(topic, Twist, queue_size)

Author: Puneet Singhal
email-id: puneetatpks@gmail.com
Version: 1.0
Date: 26th May 2017
"""

import rospy
from geometry_msgs.msg import Twist
from math import radians

class DrawASquare():
    def __init__(self):
        # initiliaze
        rospy.init_node('drawasquare', anonymous=False)

        # What to do you ctrl + c    
        rospy.on_shutdown(self.shutdown)
        
        self.cmd_vel = rospy.Publisher('h1/husky_velocity_controller/cmd_vel', Twist, queue_size=10)
     
        # 5 HZ
        r = rospy.Rate(5);

        # create two different Twist() variables.  One for moving forward.  One for turning 45 degrees.

        # let's go forward at 0.2 m/s
        move_cmd_x = Twist()
        move_cmd_x.linear.x = 0.2
        
        # by default angular.z is 0 so setting this isn't required

        #let's turn at 45 deg/s
        turn_cmd = Twist()
        turn_cmd.linear.x = 0
        turn_cmd.angular.z = radians(45); #45 deg/s in radians/s

        #to keep drawing squares.  Go forward for 2 seconds (10 x 5 HZ) then turn for 2 second
        count = 0
        while not rospy.is_shutdown():
            # go forward 0.4 m (2 seconds * 0.2 m / seconds)
            rospy.loginfo("Going Straight Forward (in direction of robot heading)")
            for x in range(0, 10):
                self.cmd_vel.publish(move_cmd_x)
                r.sleep()
            
            # turn 90 degrees
            rospy.loginfo("Turning")
            for x in range(0,10):
                self.cmd_vel.publish(turn_cmd)
                r.sleep()

    	    count = count + 1
    	    if(count == 4): 
                count = 0
    	    if(count == 0): 
                rospy.loginfo("Husky Robot should be close to the original starting position (but it's probably off due to slips and uncertainties)")
            
    def shutdown(self):
        # stop bot
        rospy.loginfo("Stop Moving")
        self.cmd_vel.publish(Twist())
        rospy.sleep(1)
 
if __name__ == '__main__':
    try:
        DrawASquare()
    except:
    	rospy.loginfo("node terminated.")