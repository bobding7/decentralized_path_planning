import numpy as np
import heapq
import csv
import math
import os

class Node:
    def __init__(self, x, y, yaw, t):
        self.x = int(x)
        self.y = int(y)
        self.yaw = int(yaw)
        self.t = t
        self.g = np.inf
        self.f = np.inf
        self.parent = None

class PriorityPlanner:
    def __init__(self, obs_map, fix_paths, extra_time):
        # extra time is the the time length of the 4d map
        # if we want the time length to be twice the length of max(fix_paths)
        # then extra_time = 2

        self.obs_map = np.array(obs_map)
        self.map_width = len(obs_map)
        self.map_height = len(obs_map[0])
        self.fix_paths = fix_paths
        self.extra_time = extra_time

        self.create_4dmap()

    def find_path(self, start_list, goal_list):
        # path will be created with the order in start_list
        if len(start_list) != len(goal_list):
            print "Start and goal pair length does not match"
            return

        path_list = []
        for i in range(len(start_list)):
            path = self.find_each_path(start_list[i], goal_list[i])
            self.update_map4d(path)
            path_list.append(path)
        return path_list
    
    def manh_dis(self, n1, n2):
        return abs(n1.x - n2.x) + abs(n1.y - n2.y)

    def find_each_path(self, start, goal):
        start_node = Node(start[0], start[1], start[2]-1, 0)
        start_node.g = 0
        goal_node = Node(goal[0], goal[1], goal[2]-1, np.inf)
        
        open_list = []
        close_map = np.zeros((int(self.map_width), int(self.map_height), 4, int(self.time_length)))
        # print "close_map size"
        # print((int(self.map_width), int(self.map_height), 4, int(self.time_length)))
        heapq.heappush(open_list, (start_node.f, start_node))

        while len(open_list) > 0:
            current = heapq.heappop(open_list)[1]
            # print(current.x, current.y, current.yaw, current.t)
            close_map[current.x, current.y, current.yaw, current.t] = 1
            
            if current.x == goal_node.x and current.y == goal_node.y and current.yaw == goal_node.yaw:
                path = self.construct_path(start, current)
                return path

            neighbors = self.get_neighbor(current)
            for n in neighbors:
                if close_map[n.x, n.y, n.yaw, n.t] == 1:
                    continue

                tmp_g = current.g + 1
                if tmp_g >= n.g:
                    continue

                n.g = tmp_g
                n.parent = current
                n.f = n.g + self.manh_dis(n, goal_node)
                heapq.heappush(open_list, (n.f, n))
    
    def construct_path(self, start, goal):
        n = goal
        path = []
        print "new path:"
        while n:
            path.insert(0, (n.x, n.y, n.yaw+1))
            n = n.parent
        print path
        return path

    def wrap_yaw(self, y):
        if y < 0:
            return 3
        if y > 3:
            return 0
        return y

    def get_neighbor(self, c):
        neighbors = []
        # pure translation
        n_list = []
        if c.yaw == 0:
            n_list.append(Node(c.x, c.y -1, c.yaw, c.t+1))
        elif c.yaw == 1:
            n_list.append(Node(c.x +1, c.y, c.yaw, c.t+1))
        elif c.yaw == 2:
            n_list.append(Node(c.x, c.y +1, c.yaw, c.t+1))
        elif c.yaw == 3:
            n_list.append(Node(c.x -1, c.y, c.yaw, c.t+1))

        for n in n_list:
            if not self.is_collide(n):
                neighbors.append(n)

        # pure rotation
        r_list = [Node(c.x, c.y, self.wrap_yaw(c.yaw+1), c.t+1), Node(c.x, c.y, self.wrap_yaw(c.yaw-1), c.t+1)]
        for r in r_list:
            if not self.is_collide(r):
                neighbors.append(r)

        return neighbors

    def is_collide(self, node):
        if node.x < 0 or node.y < 0 or node.x >= self.map_width or node.y >= self.map_height:
            return True

        if node.t == 0:
            if self.map4d[node.x, node.y, node.t] == 0:
                return False
        elif self.map4d[node.x, node.y, node.t] == 0 and self.map4d[node.x, node.y, node.t-1] == 0:
            return False
        else:
            return True

    def create_4dmap(self):
        max_path_length = self.longest(self.fix_paths)
        self.time_length = math.ceil(max_path_length * self.extra_time)
        if self.time_length < 30:
            self.time_length = 30
        self.map4d = np.repeat(self.obs_map[:, :, np.newaxis], self.time_length, axis=2)
        
        for path in self.fix_paths:
            for i in range(len(path)):
                pose = path[i]
                self.map4d[pose[0], pose[1], i] = 1
    
    def update_map4d(self, path):
        for i in range(len(path)):
            pose = path[i]
            self.map4d[pose[0], pose[1], i] = 1

    def longest(self, l):
        if(not isinstance(l, list)): return(0)
        return(max([len(l),] + [len(subl) for subl in l if isinstance(subl, list)] +
                [self.longest(subl) for subl in l]))

if __name__ == "__main__":
    with open("/home/yisha/class/16782/project/FoxconnMultiAgent/catkin_ws/src/mstar/data/highbay_obs_map.txt") as inputFile:
        obs_map = [[int(i) for i in line.strip().split('\t')] for line in inputFile]
    fix_paths = [[(0, 0, 1), (1, 0, 1), (2, 0, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1)], [(5, 5, 2), (5, 6, 2)], [(5, 2, 3), (5, 2, 3), (5, 2, 3), (5, 2, 3), (5, 2, 3), (5, 2, 3), (5, 2, 3), (5, 2, 3)]]
    #  fix_paths = [[(0, 0, 1), (1, 0, 1), (2, 0, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1), (2, 1, 1)], [(5, 5, 2), (5, 6, 2)]]

    p = PriorityPlanner(obs_map, fix_paths, 2)
    p.find_path([(6, 11, 1), (8, 1, 1)], [(1, 1, 3), (1, 7, 3)])

