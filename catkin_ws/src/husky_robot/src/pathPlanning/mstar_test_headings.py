#!/usr/bin/env python
import numpy as np
import od_mstar_headings
import os

from colorsys import hsv_to_rgb
from PIL import Image
from workspace_graph_headings import Heading

# hsv values for plotting 10 paths
HSV_VALS = [[0.5574, 0.2687, 0.8902],
            [0.6667, 1.0000, 1.0000],
            [0.3333, 1.0000, 1.0000],
            [0.1667, 1.0000, 1.0000],
            [0.0017, 0.3904, 0.9843],
            [0.0939, 0.5613, 0.9922],
            [0.0830, 1.0000, 1.0000],
            [0.7778, 0.1682, 0.8392],
            [0.7473, 0.6039, 0.6039],
            [0.0596, 0.7740, 0.6941]]

# offset so colors aren't too light
OFFSET = 25

def colorize_path(obs_map, map_no_buffer, path, save_location):
    path_map = np.uint8((np.array(map_no_buffer) == 0) * 255)
    (h,w) = path_map.shape
    path_map = np.repeat(path_map,3).reshape((h,w,3))

    for i in range(0,len(path)):
        for j in range(0,len(path[i])):
            if path[i][j] == None:
                continue
            (x, y, direction) = path[i][j]
            path_map[x,y] = [int(a * 255) for a in hsv_to_rgb(HSV_VALS[j%10][0],
                    float(i+OFFSET)/(len(path)+OFFSET) * HSV_VALS[j%10][1],HSV_VALS[j%10][2])]
            comp_path = [path_elem for path_elem in path[i] if path_elem is not None]
            duplicates = set([a for a in comp_path if comp_path.count(a) > 1])
            if len(duplicates) > 0:
                for (r,c) in duplicates:
                    path_map[r,c] = [255,0,0] # red color for collisions
                    print("collision at:", (r,c))
    im = Image.fromarray(path_map, 'RGB')
    im.save(save_location)

def png_to_obs_map(file_name):
    file_path = os.path.join(os.path.dirname(__file__), file_name)
    im = Image.open(file_path).convert('1')
    width = im.size[0]
    vals = list(im.getdata())
    # convert to matrix with 0 for white (free) and 1 for black (obstacle)
    return [[1 if x==0 else 0 for x in vals[i:i+width]] for i in range(0, len(vals), width)]

def txt_to_obs_map(file_name):
    with open(file_name) as inputFile:
        return [[int(i) for i in line.strip().split('\t')] for line in inputFile]

def plot_mstar_paths(obs_map, map_no_buffer, init_pos, goal_pos, save_location):
    m = od_mstar_headings.Od_Mstar(obs_map, goal_pos, False)
    print("Finding path...")
    path = m.find_path(init_pos, time_limit=420 * 60)

    for state in path:
        print(state)

    colorize_path(obs_map, map_no_buffer, path, save_location)
    return path

def plot_individual_paths(obs_map, map_no_buffer, init_pos, goal_pos, save_location):
    paths = []
    max_path_len = 0
    for i in range(0,len(goal_pos)):
        m = od_mstar_headings.Od_Mstar(obs_map, (goal_pos[i],), False)
        path = m.find_path((init_pos[i],))
        paths.append(tuple([x[0] for x in path]))

    # zip different length lists
    zipped_paths = tuple(map(None,*paths)) # note that map is different in Python 3
    colorize_path(obs_map, map_no_buffer, zipped_paths, save_location)
    return zipped_paths

def plot_mstar_on_collision(path, obs_map, map_no_buffer, goal_pos, save_location):
    mutable_path = list(path)
    i = 1
    # print("Original max-length of paths:", len(mutable_path))
    while i < len(mutable_path) - 1:
        # print(i)
        comp_path = [path_elem for path_elem in mutable_path[i] if path_elem is not None]
        if len(comp_path) != len(set(comp_path)):
            collision_length = 1
            for j in range(i+1,len(mutable_path)-1):
                comp_path = [path_elem for path_elem in mutable_path[j] if path_elem is not None]
                if len(comp_path) != len(set(comp_path)):
                    collision_length += 1
                    # print("Collision length increased:", collision_length)
            sub_goal = mutable_path[i+collision_length]
            sub_goal = tuple([sub_goal[x] if sub_goal[x]!=None else goal_pos[x] for x in range(0,len(sub_goal))])
            m = od_mstar_headings.Od_Mstar(obs_map, sub_goal, False)
            sub_path = m.find_path(mutable_path[i-1], time_limit=60 * 60)
            # print("Found subpath to avoid collision.")
            del mutable_path[i:i+collision_length]
            mutable_path[i:i] = sub_path
            # print("Length is now:", len(mutable_path))
        i += 1
    print(mutable_path)
    colorize_path(obs_map, map_no_buffer, tuple(mutable_path), save_location)

if __name__ == '__main__':
    # obs_map = png_to_obs_map('../obstacles/walls_conservative_buffer_bw.png')
    obs_map = txt_to_obs_map('../obstacles/highbay_obs_map.txt')
    map_no_buffer = png_to_obs_map('../obstacles/walls_conservative.png')

    # goal_pos = ((75,16), (95,83), (88,18), (76,65), (95,15), (84,91), (58,37), (93,34), (69,52), (86,104), (2,37), (33,73), (11,104), (30,81))
    # init_pos = ((95,83), (75,16), (76,65), (88,18), (84,91), (95,15), (93,34), (58,37), (86,104), (69,52), (33,73), (2,37), (30,81), (11,104))

    # goal_pos = ((14,26), (46,46), (46,21), (22,49), (36,14), (37,55), (75,16), (84,16), (88,16), (68,24))
    # init_pos = ((46,46) ,(14,26), (22,49), (46,21), (37,55), (36,14), (84,16), (75,16), (68,24), (88,16))

    # goal_pos = ((14,26), (46,46), (46,21), (22,49), (36,14), (37,55), (88,16), (68,24), (46,26), (45,42))
    # init_pos = ((46,46) ,(14,26), (22,49), (46,21), (37,55), (36,14), (68,24), (88,16), (45,42), (46,26))

    # goal_pos = ((14,26,Heading.NORTH), (46,46,Heading.NORTH), (46,21,Heading.NORTH), (22,49,Heading.NORTH))
    # init_pos = ((46,46,Heading.NORTH) ,(14,26,Heading.NORTH), (22,49,Heading.NORTH), (46,21,Heading.NORTH))

    # Goal and initial position for new highbay layout without any obstacles
    goal_pos = ((6,11,Heading.NORTH), (8,1,Heading.NORTH), (20,11,Heading.NORTH), (12,11,Heading.NORTH))
    init_pos = ((1,1,Heading.SOUTH) ,(1,7,Heading.SOUTH), (12,1,Heading.SOUTH), (20,1,Heading.SOUTH))

    # individual_paths = plot_individual_paths(obs_map, map_no_buffer, init_pos, goal_pos, "../plots/paths_individual3.png")
    # plot_mstar_on_collision(individual_paths, obs_map, map_no_buffer, goal_pos, "../plots/paths_mstar_on_collision3.png")
    plot_mstar_paths(obs_map, obs_map, init_pos, goal_pos, "../plots/paths_mstar3.png")
