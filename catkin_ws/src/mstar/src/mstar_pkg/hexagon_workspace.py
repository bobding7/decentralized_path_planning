from workspace_graph import *

from col_set_addition import add_col_set_recursive, add_col_set
from col_set_addition import NoSolutionError
import SortedCollection
from collections import defaultdict
from functools import wraps
try:
    import ipdb as pdb
except ImportError:
    import pdb
import interface
import math

class Hexagon_Graph(interface.Graph_Interface):

    def __init__(self, world_descriptor, goal, wait_cost=0.0):
        nodes, edges = world_descriptor
        new_nodes = {}
        for coord in nodes:
            new_nodes[coord[0]] = (coord[0], (coord[1], coord[2]))
        mapping = {}
        edges.extend([(b, a) for (a, b) in edges])
        for edge in edges:
            n1, pos1 = new_nodes[edge[0]]
            n2, pos2 = new_nodes[edge[1]]
            xdif = pos2[0] - pos1[0]
            ydif = pos2[1] - pos1[1]
            angle = (int(round(math.degrees(
                math.atan2(float(ydif), float(xdif)))))) % 360
            mapping[(n1, (pos1[0], pos1[1], angle))] = \
                (n2, (pos2[0], pos2[1], angle))
        self.goal = goal
        self.wait_cost = wait_cost
        self.world_descriptor = mapping
        self.turn_degrees = 60

    def get_edge_cost(self, coord1, coord2):
        if coord1 == self.goal and coord2 == self.goal:
            return self.wait_cost
        return 1

    def get_neighbors(self, coord):
        neighbors = [coord]
        node_num, (x, y, theta) = coord
        neighbors.append((node_num, (x, y,
            (theta - self.turn_degrees) % 360)))
        neighbors.append((node_num, (x, y,
            (theta + self.turn_degrees) % 360)))
        if coord in self.world_descriptor:
            neighbors.append(self.world_descriptor[coord])
        return neighbors

    def get_in_neighbors(self, coord):
        neighbors = [coord]
        node_num, (x, y, theta) = coord
        neighbors.append((node_num, (x, y,
            (theta - self.turn_degrees) % 360)))
        neighbors.append((node_num, (x, y,
            (theta + self.turn_degrees) % 360)))
        tmp = (node_num, (x, y, (theta + 180) % 360))
        if tmp in self.world_descriptor:
            neib_num, (nx, ny, ntheta) = self.world_descriptor[tmp]
            neighbors.append((neib_num, (nx, ny, theta)))
        return neighbors

def compute_heuristic(coord1, coord2):
    return abs(coord1[1][0] - coord2[1][0]) + \
           abs(coord1[1][1] - coord2[1][1])

def Astar_Graph(world_descriptor, goal=None, wait_cost=0.):
    return Astar_DiGraph_Policy(world_descriptor,
                        lambda x: Hexagon_Graph(
                            x, goal, wait_cost=wait_cost),
                        goal, compute_heuristic)

class Edge_Checker(interface.Planner_Edge_Checker):
    """Used to wrap edge checking so more complex graphs can be cleanly
    handled (may require keeping track of state for non-trivial graphs

    """
    def __init__(self):
        """Takes no arguments, because on grid graph, only the
        coordinates matter

        """
        pass

    def col_check(self, c1, recursive):
        """Checks for collisions at a single point.  Returns either a M*
        or rM* collision set in the form of sets, depending on the
        setting of recursive.

        """
        col_set = []
        # Select the function to be used for adding collision sets
        adder = add_col_set
        if recursive:
            adder = add_col_set_recursive
        for i in xrange(len(c1) - 1):
            for j in xrange(i + 1, len(c1)):
                if c1[i][0] == c1[j][0]:
                    col_set = adder([frozenset([i, j])], col_set)
        return col_set

    def incremental_col_check(self, c1, recursive):
        """Checks for collisions at a single point.  Returns either a M*
        or rM* collision set in the form of sets, depending on the
        setting of recursive.  Only checks whether the last robot is
        involved in a collision, for use with incremental methods

        """
        col_set = []
        # Select the function to be used for adding collision sets
        adder = add_col_set
        if recursive:
            adder = add_col_set_recursive
        j = len(c1) - 1
        for i in xrange(len(c1) - 1):
            if c1[i][0] == c1[j][0]:
                col_set = adder([frozenset((i, j))], col_set)
        return col_set

    def cross_over(self, c1, c2, recursive=False):
        """Detects cross over collisions as well as pass through
        collisions

        """
        col_set = []
        # Select the function to be used for adding collision sets
        adder = add_col_set
        if recursive:
            adder = add_col_set_recursive
        for i in xrange(len(c1) - 1):
            for j in xrange(i + 1, len(c1)):
                # compute current displacement vector
                if c1[i] is None or c1[j] is None or c2[i] is None or c2[j] \
                        is None:
                    continue
                if c1[i][0] == c2[j][0] and c1[j][0] == c2[i][0]:
                    col_set = adder([frozenset([i, j])], col_set)
        return col_set

    def incremental_cross_over(self, c1, c2, recursive=False):
        """Detects cross over collisions as well as pass through
        collisions.

        Only checks if the last robot is involved in a collision, for use
        with partial expansion approaches.

        c1 - the initial configuration.
        c2 - the final configuration. c1 may include additional robots,
             if necessary

        """
        col_set = []
        # Select the function to be used for adding collision sets
        adder = add_col_set
        if recursive:
            adder = add_col_set_recursive
        j = len(c2) - 1
        for i in xrange(len(c2) - 1):
            # compute current displacement vector
            if c1[i][0] == c2[j][0] and c1[j][0] == c2[i][0]:
                col_set = adder([frozenset([i, j])], col_set)
        return col_set

    def pass_through(self, c1, c2, recursive=False):
        """returns a tuple of colliding robots, or set of tuples if
        recursive

        """
        col_set = []
        # Select the function to be used for adding collision sets
        adder = add_col_set
        if recursive:
            adder = add_col_set_recursive
        for i in xrange(len(c1) - 1):
            for j in xrange(i + 1, len(c1)):
                if c1[i][0] == c2[j][0] and c1[j][0] == c2[i][0]:
                    col_set = adder([frozenset([i, j])], col_set)
        return col_set
