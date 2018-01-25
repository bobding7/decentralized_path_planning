# path_db
Maintain a database for each of the robot. The data base contain the latest belief for the robot. The 'path_db' node is a service and will be later called be controller. 

## msg file
* `Path2D.msg`: add `int32 timestamp`
* `Belief.msg`: create a new message file, which is type `Path2D[]`

## srv file
- `QueryDB.srv`: create a service file.
  - Input: `String type`, take `'update'` or `'query'`
  - `Belief in_belief`
  - Output: `Belief out_belief`

## Usage
* The server will run a service named `query_db`. When initialization, the robot number is required. 
* When the service type is `update`, the `in_belief` is necessary. The `in_belief` could be patial. The service will compare the timestamp and determine whether it will update the database or not. The service will return the latest database after update.
* When the service type is `query`, the `in_belief` is not necessary, and an empty `Belief` could be passed in. The service will return the current database.

## Combining with Controller node
* Wait `path_db` service initialized.
* After first planning, `update` the patial belief, which only contain the path information for the robot itself.
* When two robots have potential collision, `controller` node query the belief, and `update` the other party's belief with each other. The `query_db` service will then return an updated belief. The `controller` could then pass the shared belief to `planning` node.
* After planning completed, `controller` call `update` again to update the M star planning belief.
