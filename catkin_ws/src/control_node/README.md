# Controller Node
Control the communication between local nodes and global nodes/other robot nodes. All nodes lists are communicating with the cotrol node.

## Collision Detection Node
  - Topic:
    - *has_collision*: subscribe to collision detection node.   
       - Type: String. The id of the robot to be colliding with.  

## Planner Node
  - Service(PlanPath):
    - *plan_path*: call the path planner node to get the local path for the robot.
       - Input: Pose2D. Current and target poses. (ref. mstar node, need to change to single robot)  
                Path2D. Other robot's path to avoid collision.
       - Return: Path2D. Planned path.

## Path Database Node
  - Service(DatabaseSrv):
    - *query_db*: query database.
      - Input: String. The request type, update or get data.  
               Path2D. The data to update.  
      - Return: Path2D. 

## Initial Node
  - Service(InitSrv): 
    - *init_info*: to be called by initial node.
      - Input: int. The id assigned.
               Pose2D. Start position.  
               Pose2D. Goal position.

