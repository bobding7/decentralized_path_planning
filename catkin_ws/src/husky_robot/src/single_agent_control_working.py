import rospy
import os
from geometry_msgs.msg import Twist
from math import radians
import numpy as np
from pathPlanning import od_mstar
import math
import tf
import geometry_msgs.msg
import getModelStates
import sys
from copy import copy
import pickle

from PIL import Image
from pathPlanning.mstar_test_headings import png_to_obs_map
from pathPlanning.mstar_test_headings import txt_to_obs_map
from pathPlanning.mstar_test_headings import plot_mstar_paths
from pathPlanning.workspace_graph_headings import Heading

class singleagent_path_tracking():
    def __init__(self, agent_num):
    # Find paths given the goal position
        # obs_map = png_to_obs_map('walls_conservative.png')
        # path_map = np.uint8((np.matrix(obs_map) == 0) * 255)

        # m = od_mstar.Od_Mstar(obs_map, ((25,25), (20,100)), False)
        # self.path = m.find_path(((15,16), (30,30)))

        # Create obs_map from text file
        # obs_map = txt_to_obs_map('/home/imr/puneet/FoxconnMultiAgent/catkin_ws/src/husky_robot/src/obstacles/highbay_obs_map.txt')

        # # Goal and initial position for new highbay layout without any obstacles
        # goal_pos = ((6,11,Heading.NORTH), (8,1,Heading.NORTH), (20,11,Heading.NORTH), (12,11,Heading.NORTH))
        # init_pos = ((1,1,Heading.NORTH) ,(1,7,Heading.NORTH), (12,1,Heading.NORTH), (20,1,Heading.NORTH))

        # self.path = plot_mstar_paths(obs_map, obs_map, init_pos, goal_pos, "../plots/paths_mstar3.png")
        
        cur_path = os.path.dirname(__file__)
        self.path = pickle.load(open(cur_path + "/data/path_12agents.p"))

        self.agent_num = agent_num
        # print(path)

        print('started')

    def wrapToPi(self, angle):
        if (angle >= math.pi):
                return angle - 2*math.pi
        elif (angle < - math.pi):
                return angle + 2*math.pi
        else:
            return angle

    def single_agent_motion(self):
        # What to do if you press ctrl + c    
        rospy.on_shutdown(self.shutdown)
        
        # initiliaze
        rospy.init_node('agent' + str(self.agent_num) + 'multiagent_path_tracking', anonymous=False)

        self.cmd_vel = rospy.Publisher('husky_velocity_controller/cmd_vel', Twist, queue_size=10)
        self.hardware_cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=10)

        # Frequency in HZ
        frequency = 10
        r = rospy.Rate(frequency);

        # create two different Twist() variables.  One for moving forward.  One for turning

        # let's go forward at 0.2 m/s
        move_cmd_x = Twist()
        forwardSpeed = 0.3
        move_cmd_x.linear.x = forwardSpeed

        # by default angular.z is 0 so setting this isn't required

        #let's turn at 30 deg/s
        angular_speed = 30
        turn_cmd = Twist()
        turn_cmd.linear.x = 0

        # Declare default angular speed bu tthis gets changed inside motion loop as Proportional control
        turn_cmd.angular.z = radians(angular_speed) #angular_speed deg/s converted into radians/s
        print('Check')
        # run for loop for length of path
        for i in range(0, len(self.path)-1):
            if not (self.path[i][self.agent_num - 1][0]==self.path[i+1][self.agent_num - 1][0] and self.path[i][self.agent_num - 1][1][2]==self.path[i+1][self.agent_num - 1][1][2]):
                # Get the initial pose of agent
                agent_state = getModelStates.gms_client('Husky_' + 'agent' + str(self.agent_num),'world')
                # agent's pose is now defined as [x, y, theta]
                # where x and y comes directly from using getModelStates.gms_client
                # theta is calculated as acos(quaternion_scalar) with the sign of quaternion_z
                # as we know that the axis of rotation is z-axis due to planar motion
                agent_pose = [copy(agent_state.pose.position.x), copy(agent_state.pose.position.y), 
                                    math.copysign(2*math.acos(agent_state.pose.orientation.w),agent_state.pose.orientation.z)]
                
                # wrap theta in agent_pose to [-pi, pi)
                agent_pose[2] = self.wrapToPi(agent_pose[2])

                # extract the previous position [x, y, heading]
                # (xInitial, yInitial, headingInitial) = self.path[i][self.agent_num - 1][1]
                # headingInitial = self.wrapToPi(-headingInitial)
                (xInitial, yInitial, headingInitial) = agent_pose
                # headingInitial = self.wrapToPi(-math.radians(headingInitial))
                # extract the next position [x, y, heading]
                xFinal = copy(self.path[i+1][self.agent_num - 1][1][0])
                yFinal = -copy(self.path[i+1][self.agent_num - 1][1][1])
                headingFinal = copy(self.path[i+1][self.agent_num - 1][1][2])
                headingFinal = self.wrapToPi(math.radians(-headingFinal))
                
                # calculate the heading change and wrap angle to [-pi, pi)
                if (self.path[i+1][self.agent_num - 1][1][2] == self.path[i][self.agent_num - 1][1][2]):
                    angle = math.atan2((yFinal - yInitial), (xFinal - xInitial))
                else:
                    angle = copy(headingFinal)

                # angle = headingFinal - headingInitial
                # angle = self.wrapToPi(angle)
                # if (math.fabs(headingInitial - headingFinal) == 1):
                #     angle = math.copysign(math.pi/2, headingInitial - headingFinal)
                # elif(math.fabs(headingInitial - headingFinal) == 3):
                #     angle = -math.copysign(math.pi/2, headingInitial - headingFinal)
                # else:
                #     angle = 0

                # calculate the Euclidean distance after converting motion from pixel scale to meter scale 
                # if not (xFinal - xInitial == 0):
                #     euclidean_dist = 1.3*math.fabs(xFinal - xInitial)
                # elif not (yFinal - yInitial == 0):
                #     euclidean_dist = 1.3*math.fabs(yFinal - yInitial)
                # else:
                #     euclidean_dist = 0
                euclidean_dist = math.sqrt((xFinal - xInitial)**2 + (yFinal - yInitial)**2)

                print(self.agent_num, i, euclidean_dist, angle, agent_pose[2], xInitial, xFinal, yInitial, yFinal)

                delta_angle = self.wrapToPi(angle - agent_pose[2])
                
                if not (math.fabs(delta_angle) < 0.01):
                    # angle = angle + agent_pose[2]
                    # delta_angle = self.wrapToPi(angle - agent_pose[2])
                    # print("rotation")
                    
                    while (math.fabs(delta_angle) > 0.01):
                        # print(angle - agent_pose[2], agent_pose)
                        # print(self.agent_num, i, euclidean_dist, angle, agent_pose[2], xInitial, xFinal, yInitial, yFinal)
                        # delta_angle = (angle - agent_pose[2])
                        # # wrap delta_angle to [-pi, pi)
                        # if delta_angle >= math.pi:
                        #     delta_angle = math.fabs(delta_angle) - 2*math.pi
                        # if delta_angle < -math.pi:
                        #     delta_angle = math.fabs(delta_angle) + 2*math.pi

                        turn_cmd.angular.z = 0.6*delta_angle
                        if (math.fabs(delta_angle) < 0.2):
                            turn_cmd.angular.z = math.copysign(0.6*0.3, delta_angle)

                        self.cmd_vel.publish(turn_cmd)
                        if self.agent_num == 1:
                            self.hardware_cmd_vel.publish(turn_cmd)
                        # print(turn_cmd.angular.z, angle, agent_pose[2], delta_angle)
                        # Get the initial pose of agent
                        agent_state = getModelStates.gms_client('Husky_' + 'agent' + str(self.agent_num),'world')
                        # agent's pose is now defined as [x, y, theta] 
                        # where x and y comes directly from using getModelStates.gms_client
                        # theta is calculated as acos(quaternion_scalar) with the sign of quaternion_z 
                        # as we know that the axis of rotation is z-axis due to planar motion
                        agent_pose = [agent_state.pose.position.x, agent_state.pose.position.y,  
                                        math.copysign(2*math.acos(agent_state.pose.orientation.w),agent_state.pose.orientation.z)]
                        print(self.agent_num, agent_pose)

                        # wrap theta in agent_pose to [-pi, pi)
                        agent_pose[2] = self.wrapToPi(agent_pose[2])

                        delta_angle = (angle - agent_pose[2])
                        # wrap delta_angle to [-pi, pi)
                        delta_angle = self.wrapToPi(angle - agent_pose[2])

                        r.sleep()
                
                # Move the robot by distance 'euclidean_dist'
                # The controller gives the motion command at rate = frequency and we want to achive 0.2 m/s average speed. 
                # This imnplies that number of steps required can be calculated using: (distance/avg_speed)*frequency
                if not (euclidean_dist < 0.01):
                    # print("translation")
                    for x in range(0, int(math.floor(euclidean_dist/forwardSpeed*frequency))):
                        # print(self.agent_num, i, euclidean_dist, angle, agent_pose[2], xInitial, xFinal, yInitial, yFinal)
                        move_cmd_x.linear.x = forwardSpeed
                        if (xInitial == xFinal and yInitial == yFinal):
                            move_cmd_x.linear.x = 0
                        self.cmd_vel.publish(move_cmd_x)
                        if self.agent_num == 1 and math.fabs(xInitial - agent_pose[0]) < 1 and math.fabs(yInitial - agent_pose[1]) < 1:
                            self.hardware_cmd_vel.publish(move_cmd_x)
                        r.sleep()
            # self.shutdown()
        else:
            for x in range(0, int(1.16/forwardSpeed*frequency)):
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
        multi_agent_motion()
    except:
    	rospy.loginfo("node terminated.")