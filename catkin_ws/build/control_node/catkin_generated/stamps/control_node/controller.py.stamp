#! /usr/bin/env python

import rospy
from control_node.controller import Controller

if __name__ == "__main__":
    try:
        c = Controller()
        c.start()
    except rospy.ROSInterruptException:
        pass
