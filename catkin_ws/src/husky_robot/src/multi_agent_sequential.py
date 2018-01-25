import rospy
from geometry_msgs.msg import Twist
from math import radians
import numpy as np
from pathPlanning import od_mstar
import math
import tf
import geometry_msgs.msg
import getModelStates
import sys

from PIL import Image
from pathPlanning.mstar_test_headings import png_to_obs_map
from pathPlanning.mstar_test_headings import txt_to_obs_map
from pathPlanning.mstar_test_headings import plot_mstar_paths
from pathPlanning.workspace_graph_headings import Heading

class multiagent_path_tracking():
    def __init__(self, num_robots, agent_num):
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
        self.path = (((1, 1, 1), (1, 7, 1), (12, 1, 1), (20, 1, 1)),
                    ((1, 1, 4), (1, 7, 2), (12, 2, 1), (20, 1, 2)),
                    ((2, 1, 4), (1, 7, 3), (12, 2, 4), (19, 1, 2)),
                    ((3, 1, 4), (1, 6, 3), (13, 2, 4), (19, 1, 2)),
                    ((4, 1, 4), (1, 5, 3), (14, 2, 4), (18, 1, 2)),
                    ((5, 1, 4), (1, 4, 3), (15, 2, 4), (17, 1, 2)),
                    ((6, 1, 4), (1, 3, 3), (16, 2, 4), (16, 1, 2)),
                    ((6, 1, 1), (1, 2, 3), (17, 2, 4), (15, 1, 2)),
                    ((6, 2, 1), (1, 1, 3), (18, 2, 4), (14, 1, 2)),
                    ((6, 3, 1), (1, 1, 4), (19, 2, 4), (13, 1, 2)),
                    ((6, 4, 1), (2, 1, 4), (20, 2, 4), (12, 1, 2)),
                    ((6, 5, 1), (3, 1, 4), (20, 2, 1), (12, 1, 1)),
                    ((6, 6, 1), (4, 1, 4), (20, 3, 1), (12, 2, 1)),
                    ((6, 7, 1), (5, 1, 4), (20, 4, 1), (12, 3, 1)),
                    ((6, 8, 1), (6, 1, 4), (20, 5, 1), (12, 4, 1)),
                    ((6, 9, 1), (7, 1, 4), (20, 6, 1), (12, 5, 1)),
                    ((6, 10, 1), (8, 1, 4), (20, 7, 1), (12, 6, 1)),
                    ((6, 11, 1), (8, 1, 1), (20, 8, 1), (12, 7, 1)),
                    ((6, 11, 1), (8, 1, 1), (20, 9, 1), (12, 8, 1)),
                    ((6, 11, 1), (8, 1, 1), (20, 10, 1), (12, 9, 1)),
                    ((6, 11, 1), (8, 1, 1), (20, 11, 1), (12, 10, 1)),
                    ((6, 11, 1), (8, 1, 1), (20, 11, 1), (12, 11, 1)),
                    ((6, 11, 1), (8, 1, 1), (20, 11, 1), (12, 11, 1)))

        self.num_robots = num_robots
        self.agent_num = agent_num
        # print(path)

        print('started')

    def multi_agent_motion(self):
        print('Check1')
        # What to do if you press ctrl + c    
        rospy.on_shutdown(self.shutdown)
        self.cmd_vel = [0]*self.num_robots
        
        # initiliaze
        rospy.init_node('agent' + str(self.agent_num) + 'multiagent_path_tracking', anonymous=False)
    
        for i in range (0, self.num_robots):
            self.cmd_vel[i] = rospy.Publisher('agent' + str(self.agent_num) + 'husky_velocity_controller/cmd_vel', Twist, queue_size=10)

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

        # Declare default angular speed bu tthis gets changed inside motion loop as Proportional control
        turn_cmd.angular.z = radians(angular_speed) #angular_speed deg/s converted into radians/s
        print('Check')
        # run for loop for length of path
        for i in range(0, len(self.path)-1):
            for j in range(0, self.num_robots):
                # Get the initial pose of agent
                agent_state = getModelStates.gms_client('Husky_' + 'agent' + str(self.agent_num),'world')
                # agent's pose is now defined as [x, y, theta]
                # where x and y comes directly from using getModelStates.gms_client
                # theta is calculated as acos(quaternion_scalar) with the sign of quaternion_z
                # as we know that the axis of rotation is z-axis due to planar motion
                agent_pose = [agent_state.pose.position.x, agent_state.pose.position.y, 
                                    math.copysign(2*math.acos(agent_state.pose.orientation.w),agent_state.pose.orientation.z)]
                
                # wrap theta in agent_pose to [-pi, pi)
                if (agent_pose[2] >= math.pi):
                    agent_pose[2] = agent_pose[2] - 2*math.pi
                elif (agent_pose[2] < - math.pi):
                    agent_pose[2] = agent_pose[2] + 2*math.pi

                # extract the previous position [x, y, heading]
                (xInitial, yInitial, headingInitial) = self.path[i][self.agent_num - 1]
                # extract the next position [x, y, heading]
                (xFinal, yFinal, headingFinal) = self.path[i+1][self.agent_num - 1]
                
                # calculate the heading change

                if (math.fabs(headingInitial - headingFinal) == 1):
                    angle = math.copysign(math.pi/2, headingInitial - headingFinal)
                elif(math.fabs(headingInitial - headingFinal) == 3):
                    angle = -math.copysign(math.pi/2, headingInitial - headingFinal)
                else:
                    angle = 0

                # calculate the Euclidean distance after converting motion from pixel scale to meter scale 
                if not (xFinal - xInitial == 0):
                    euclidean_dist = 1.3*math.fabs(xFinal - xInitial)
                elif not (yFinal - yInitial == 0):
                    euclidean_dist = 1.3*math.fabs(yFinal - yInitial)
                else:
                    euclidean_dist = 0

                # print(euclidean_dist, angle, i)

                if not (angle == 0):
                    angle = angle + agent_pose[2]
                    while (math.fabs(angle - agent_pose[2]) > 0.01):
                        # print(angle - agent_pose[2], agent_pose)
                        delta_angle = (angle - agent_pose[2])
                        # wrap delta_angle to [-pi, pi)
                        if delta_angle >= math.pi:
                            delta_angle = math.fabs(delta_angle) - 2*math.pi
                        if delta_angle < -math.pi:
                            delta_angle = math.fabs(delta_angle) + 2*math.pi

                        turn_cmd.angular.z = 0.6*delta_angle
                        if (math.fabs(delta_angle) < 0.3):
                            turn_cmd.angular.z = math.copysign(0.6*0.3, delta_angle)
                        self.cmd_vel[j].publish(turn_cmd)

                        # Get the initial pose of agent
                        agent_state = getModelStates.gms_client('Husky_' + 'agent' + str(self.agent_num),'world')
                        # agent's pose is now defined as [x, y, theta] 
                        # where x and y comes directly from using getModelStates.gms_client
                        # theta is calculated as acos(quaternion_scalar) with the sign of quaternion_z 
                        # as we know that the axis of rotation is z-axis due to planar motion
                        agent_pose = [agent_state.pose.position.x, agent_state.pose.position.y,  
                                        math.copysign(2*math.acos(agent_state.pose.orientation.w),agent_state.pose.orientation.z)]

                        # wrap theta in agent_pose to [-pi, pi)
                        if (agent_pose[2] >= math.pi):
                            agent_pose[2] = agent_pose[2] - 2*math.pi
                        elif (agent_pose[2] < - math.pi):
                            agent_pose[2] = agent_pose[2] + 2*math.pi
                        # print('agent%d'%self.agent_num + ' - rotating')
                        r.sleep()
                
                # Move the robot by distance 'euclidean_dist'
                # The controller gives the motion command at rate = frequency and we want to achive 0.2 m/s average speed. 
                # This imnplies that number of steps required can be calculated using: (distance/avg_speed)*frequency
                if not (euclidean_dist == 0):
                    for x in range(0, int(math.floor(euclidean_dist/0.2*frequency))):
                        move_cmd_x.linear.x = 0.2
                        if (xInitial == xFinal and yInitial == yFinal):
                            move_cmd_x.linear.x = 0
                        self.cmd_vel[j].publish(move_cmd_x)
                        r.sleep()
                        # print('agent%d'%self.agent_num + ' - Moving')

    def shutdown(self):
        # stop agent
        rospy.loginfo("Stop Moving")
        for i in range (0, self.num_robots):
            self.cmd_vel[i].publish(Twist())
        rospy.sleep(1)
 
if __name__ == '__main__':
    if len(sys.argv) == 2:
        agent_name = sys.argv[1]
        # relative_entity_name = sys.argv[2]
    try:
        multi_agent_motion()
    except:
    	rospy.loginfo("node terminated.")