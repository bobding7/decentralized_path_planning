
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

class singleagent_path_tracking():
    def __init__(self):
    # Find paths given the goal position
        # obs_map = png_to_obs_map('walls_conservative.png')
        # path_map = np.uint8((np.matrix(obs_map) == 0) * 255)

        # m = od_mstar.Od_Mstar(obs_map, ((25,25), (20,100)), False)
        # self.path = m.find_path(((15,16), (30,30)))
        # print(path)
        print('started')

    def single_agent_motion(self, agent_name, path):
        # initiliaze
        rospy.init_node('singleagent_path_tracking', anonymous=False)

        # What to do if you press ctrl + c    
        rospy.on_shutdown(self.shutdown)
        
        self.cmd_vel = rospy.Publisher('agent' + str(agent_name) + '/husky_velocity_controller/cmd_vel', Twist, queue_size=10)

        # Frequency in HZ
        frequency = 100
        r = rospy.Rate(frequency);

        # create two different Twist() variables.  One for moving forward.  One for turning

        # let's go forward at 0.2 m/s
        move_cmd_x = Twist()
        move_cmd_x.linear.x = 0.2

        # by default angular.z is 0 so setting this isn't required

        #let's turn at 30 deg/s
        angular_speed = 30
        turn_cmd = Twist()
        turn_cmd.linear.x = 0

        # Declare default angular speed but this gets changed inside motion loop as Proportional control
        turn_cmd.angular.z = radians(angular_speed) #angular_speed deg/s converted into radians/s

        # Get the initial pose of agent
        agent1_state = getModelStates.gms_client('Husky_' + 'agent' + str(agent_name), 'world')
        # agent's pose is now defined as [x, y, theta] 
        # where x and y comes directly from using getModelStates.gms_client
        # theta is calculated as acos(quaternion_scalar) times the sign of quaternion_z 
        # as we know that the axis of rotation is z-axis due to planar motion
        agent1_pose = [agent1_state.pose.position.x, agent1_state.pose.position.y, 
                                    2*math.acos(agent1_state.pose.orientation.w)*agent1_state.pose.orientation.z/abs(agent1_state.pose.orientation.z)]
        print(len(path))

        # run for loop for length of path
        for i in range(0, len(path)-1):
            # extract the previous position [x,y]
            ((y1i, x1i), (y2i, x2i)) = path[i] 
            # extract the next position [x,y]
            ((y1f, x1f), (y2f, x2f)) = path[i+1]
            # calculate the global direction of motion
            angle = math.atan2(-(y1f-y1i),(x1f - x1i))

            # wrap direction of motion from [0, 2pi) (from atan function) to [-pi, pi)
            if angle >= math.pi:
                angle = angle - 2.0*math.pi

            # calculate the Euclidean distance after converting motion from pixel scale to meter scale 
            move_x = (((x1f - x1i)*20.0/40.0)**2 + ((y1f-y1i)*26.0/54.0)**2)**(0.5)

            # print(i, move_x, angle, agent1_pose[2])

            # Start by checking if we need to rotate as the robot is dubian's car and not omni wheeled
            while (math.fabs(angle - agent1_pose[2]) > 0.01):
                print(angle - agent1_pose[2], agent1_pose)
                turn_cmd.angular.z = 0.6*(angle - agent1_pose[2])
                self.cmd_vel.publish(turn_cmd)
                agent1_state = getModelStates.gms_client('Husky_' + 'agent' + str(agent_name),'world')
                agent1_pose = [agent1_state.pose.position.x, agent1_state.pose.position.y, 
                                2*math.acos(agent1_state.pose.orientation.w)*agent1_state.pose.orientation.z/abs(agent1_state.pose.orientation.z)]
                if agent1_pose[2]>= math.pi:
                    agent1_pose[2] = agent1_pose[2] - 2*math.pi
                elif (agent1_pose[2] < -math.pi):
                    agent1_pose[2] = agent1_pose[2] + 2*math.pi
                # print(agent1_pose)
                r.sleep()
            # After changing the robot orientation to align with motion direction, move the robot by distance move_x
            # The controller gives the motion command at rate = frequency and we want to achive 0.2 m/s average speed. 
            # This imnplies that number of steps required can be calculated using: (distance/avg_speed)*frequency
            for x in range(0, int(math.floor((move_x/0.2)*frequency))):
                self.cmd_vel.publish(move_cmd_x)
                r.sleep()

    def shutdown(self):
        # stop agent
        rospy.loginfo("Stop Moving")
        self.cmd_vel.publish(Twist())
        rospy.sleep(1)
 
if __name__ == '__main__':
    if len(sys.argv) == 2:
        agent_name = sys.argv[1]
        # relative_entity_name = sys.argv[2]
    try:
        singleagent_path_tracking(agent_name)
    except:
    	rospy.loginfo("node terminated.")