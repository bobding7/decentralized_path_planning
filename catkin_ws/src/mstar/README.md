# M* ROS Node Dynamic Service 
To use this node:
1. Change to your catkin workspace and do `catkin_make` or `catkin b -v`

2. Add below lines to your "~/.bashrc" file
```
export ROS_IP=192.168.10.188
export ROS_MASTER_URI=http://192.168.10.200:11311
```

3. Source bashrc by running below command in terminal:
```
source ~/.bashrc
```

4. Run this node by `rosrun mstar planning.py`


To see the sample input and output of the service:
```
cd test
./srv_call.sh
```
