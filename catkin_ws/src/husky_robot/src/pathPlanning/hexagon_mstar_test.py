import hexagon_workspace
import od_mstar
import numpy as np
import od_mstar_headings
import os

from colorsys import hsv_to_rgb
from PIL import Image
from workspace_graph_headings import Heading

# hsv values for plotting 10 paths
HSV_VALS = [[0.5574, 0.2687, 0.8902],
            [0.3333, 1.0000, 1.0000],
            [0.0596, 1.0000, 1.0000],
            [0.1667, 1.0000, 1.0000],
            [0.0017, 0.3904, 0.9843],
            [0.0939, 0.5613, 0.9922],
            [0.0830, 1.0000, 1.0000],
            [0.7778, 0.1682, 0.8392],
            [0.7473, 0.6039, 0.6039],
            [0.6667, 0.7740, 0.6941]]

# offset so colors aren't too light
OFFSET = 100

def colorize_path(obs_map, map_no_buffer, path, save_location):
    im2 = Image.open("../plots/lattice.png")
    xscale = im2.size[0] / 31.0
    yscale = im2.size[1] / 17.0
    path_map = np.uint8(np.array([[255] * im2.size[1]] * im2.size[0]))
    # print path_map
    (h,w) = path_map.shape
    path_map = np.repeat(path_map,3).reshape((h,w,3))

    for i in range(0,len(path)):
        for j in range(0,len(path[i])):
            if path[i][j] == None:
                continue
            num, (x, y, direction) = path[i][j]
            (x, y, direction) = (int(x * xscale), int(y * yscale), direction)
            for k in xrange(-5, 5):
                for l in xrange(-5, 5):
                    nx, ny = int((x + k + 14) / 1.05) , int((y + l +16) / 1.07)
                    if 0 < nx and nx < h and 0 < ny and ny < w:
                        new_color = \
                            [int(a * 255) for a in hsv_to_rgb(HSV_VALS[j%10][0],
                            float(i+OFFSET)/(len(path)+OFFSET) * HSV_VALS[j%10][1],
                            HSV_VALS[j%10][2])]
                        path_map[nx, ny] = [(new_color[0] * path_map[nx, ny][0]) / 255,
                                            (new_color[1] * path_map[nx, ny][1]) / 255,
                                            (new_color[2] * path_map[nx, ny][2]) / 255]
            comp_path = [path_elem for path_elem in path[i] if path_elem is not None]
            duplicates = set([a for a in comp_path if comp_path.count(a) > 1])
            if len(duplicates) > 0:
                for (r,c) in duplicates:
                    path_map[r,c] = [255,0,0] # red color for collisions
                    print("collision at:", (r,c))
    im = Image.fromarray(path_map, 'RGB')
    im = im.transpose(Image.ROTATE_90)
    im = im.transpose(Image.FLIP_TOP_BOTTOM)
    for i in xrange(im.size[0]):
        for j in xrange(im.size[1]):
            if im.getpixel((i, j)) != (255, 255, 255):
                im2.putpixel((i, j), im.getpixel((i, j)))
    im2.save(save_location)

if __name__ == "__main__":
    import pickle
    nodes = pickle.load(open("../data/nodes.p"))
    nodes_to_xy = {num: (x, y) for (num, x, y) in nodes}
    edges = pickle.load(open("../data/edges.p"))
    START_COORDS = ((86, 0), (272, 0), (301, 0), (244, 0), (154, 0), (55,0), (224,0), (218,0), (214,0), (279,0), (356,0), (45,0))
    END_COORDS = ((408, 0), (213, 0), (130, 0), (289, 0), (402, 0), (88,0), (92,0), (199,0), (236,0), (313,0), (373,0), (172,0))

    START_COORDS = tuple([(num, (nodes_to_xy[num][0], nodes_to_xy[num][1], theta))
                          for num, theta in START_COORDS])
    END_COORDS = tuple([(num, (nodes_to_xy[num][0], nodes_to_xy[num][1], theta))
                        for num, theta in END_COORDS])
    world = [nodes, edges]
    mstar = od_mstar.Od_Mstar(world, END_COORDS, True,
        sub_search={(i,): hexagon_workspace.Astar_Graph(world, END_COORDS[i])
                    for i in xrange(len(END_COORDS))},
        col_checker=hexagon_workspace.Edge_Checker())
    path = mstar.find_path(START_COORDS)
    for i in range(len(path)):
        print(path[i][11])
    # print(path)
    pickle.dump(path, open("../data/path_12agents.p", "wb"))
    colorize_path(None, None, path, "../plots/out_12agents.png")
