#!/usr/bin/env python
"""
This is a small code to define multi_agent_sequential class and then 
call the singleagent_path_tracking function for one of the agent. 
Paths of all agents are hard coded inside multi_agent_sequential constructor 
but one choose to create new path using the commented out part in the same constructor

	1. Run Command in terminal: python name_of_the_file.py
	2. Input Arguments: Number: identity of agent which is also termed as agent_num inside multi_agent_sequential class. 
		example: 1 for agent1, 5 for agent5

	3. Output: None except for print commands on terminal
	4. Requirements: agent should exist
		else change the name of topic in first argument of rospy.Publisher(topic, Twist, queue_size)

Author: Puneet Singhal
email-id: puneetatpks@gmail.com
Version: 1.0
Date: 26th May 2017
"""
import sys
import rospy
import single_agent_control_working

if __name__ == '__main__':
	agentIdentity = rospy.get_param('pathfollower/agent_identity')
	m = single_agent_control_working.singleagent_path_tracking(agentIdentity)
	m.single_agent_motion()