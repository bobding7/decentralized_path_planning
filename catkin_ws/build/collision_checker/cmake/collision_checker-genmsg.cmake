# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "collision_checker: 1 messages, 1 services")

set(MSG_I_FLAGS "-Icollision_checker:/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(collision_checker_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/srv/Checker.srv" NAME_WE)
add_custom_target(_collision_checker_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "collision_checker" "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/srv/Checker.srv" "collision_checker/CollisionIDs:collision_checker/Pose2D:collision_checker/Pose2DList"
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/CollisionIDs.msg" NAME_WE)
add_custom_target(_collision_checker_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "collision_checker" "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/CollisionIDs.msg" "collision_checker/Pose2D:collision_checker/Pose2DList"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(collision_checker
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/CollisionIDs.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2DList.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/collision_checker
)

### Generating Services
_generate_srv_cpp(collision_checker
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/srv/Checker.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/CollisionIDs.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2DList.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/collision_checker
)

### Generating Module File
_generate_module_cpp(collision_checker
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/collision_checker
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(collision_checker_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(collision_checker_generate_messages collision_checker_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/srv/Checker.srv" NAME_WE)
add_dependencies(collision_checker_generate_messages_cpp _collision_checker_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/CollisionIDs.msg" NAME_WE)
add_dependencies(collision_checker_generate_messages_cpp _collision_checker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(collision_checker_gencpp)
add_dependencies(collision_checker_gencpp collision_checker_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS collision_checker_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(collision_checker
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/CollisionIDs.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2DList.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/collision_checker
)

### Generating Services
_generate_srv_lisp(collision_checker
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/srv/Checker.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/CollisionIDs.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2DList.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/collision_checker
)

### Generating Module File
_generate_module_lisp(collision_checker
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/collision_checker
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(collision_checker_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(collision_checker_generate_messages collision_checker_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/srv/Checker.srv" NAME_WE)
add_dependencies(collision_checker_generate_messages_lisp _collision_checker_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/CollisionIDs.msg" NAME_WE)
add_dependencies(collision_checker_generate_messages_lisp _collision_checker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(collision_checker_genlisp)
add_dependencies(collision_checker_genlisp collision_checker_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS collision_checker_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(collision_checker
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/CollisionIDs.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2DList.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_checker
)

### Generating Services
_generate_srv_py(collision_checker
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/srv/Checker.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/CollisionIDs.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/Pose2DList.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_checker
)

### Generating Module File
_generate_module_py(collision_checker
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_checker
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(collision_checker_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(collision_checker_generate_messages collision_checker_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/srv/Checker.srv" NAME_WE)
add_dependencies(collision_checker_generate_messages_py _collision_checker_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/collision_checker/msg/CollisionIDs.msg" NAME_WE)
add_dependencies(collision_checker_generate_messages_py _collision_checker_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(collision_checker_genpy)
add_dependencies(collision_checker_genpy collision_checker_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS collision_checker_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/collision_checker)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/collision_checker
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(collision_checker_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/collision_checker)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/collision_checker
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(collision_checker_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_checker)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_checker\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_checker
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_checker
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/collision_checker/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(collision_checker_generate_messages_py std_msgs_generate_messages_py)
endif()
