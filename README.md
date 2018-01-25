# Decentralized_path_planning

## Usage
Please go to branch named: 16782_path_planner

install package 
```
sudo apt-get install ros-indigo-husky-*
```

source current package to $ROS_PACKAGE_PATH by running below command in terminal while you are catkin_ws folder
```
source ./devel/setup.bash
```

add the path to model directory to $GAZEBO_MODEL_PATH by running below command:
```
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/puneet/FoxconnMultiAgent/catkin_ws/src/nre_simmultihusky/worlds
```

Start ros master
```
roscore
```

In new terminal, launch gazebo with multiple robots by running below command in new terminal:
```
roslaunch nre_simmultihusky multiagent.launch
```

To run in ros kinetic, comment out these two lines in mhusky.gazebo.xacro:
```
  <!-- <xacro:husky_robot /> -->
  
  <!-- <xacro:husky_robot_gazebo /> -->
```

In another terminal, launch the control node as:
```
roslaunch control_node Dmstar.launch
```

## install other packages
install package 
```
sudo apt-get install ros-indigo-husky-*
```

source current package to $ROS_PACKAGE_PATH by running below command in terminal while you are catkin_ws folder
```
source ./devel/setup.bash
```

add the path to model directory to $GAZEBO_MODEL_PATH by running below command:
```
export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/puneet/FoxconnMultiAgent/catkin_ws/src/nre_simmultihusky/worlds
```

Start ros master
```
roscore
```

In new terminal, launch gazebo with multiple robots by running below command in new terminal:
```
roslaunch nre_simmultihusky multiagent.launch
```

Run multiple python scripts corresponding to multiple agents. 
For example, to run agent 1 and agent 2 use below command:
```
roslaunch nre_simmultihusky multiAgentControl.launch
```

To run in ros kinetic, comment out these two lines in mhusky.gazebo.xacro:
```
  <!-- <xacro:husky_robot /> -->
  
  <!-- <xacro:husky_robot_gazebo /> -->
```

In another terminal, launch the control node as:
```
roslaunch control_node Dmstar.launch
```

