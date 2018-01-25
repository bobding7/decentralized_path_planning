# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mstar: 4 messages, 2 services")

set(MSG_I_FLAGS "-Imstar:/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mstar_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg" NAME_WE)
add_custom_target(_mstar_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mstar" "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg" ""
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/Planner.srv" NAME_WE)
add_custom_target(_mstar_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mstar" "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/Planner.srv" "mstar/Pose2DList:mstar/Belief:mstar/Path2D:mstar/Pose2D"
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg" NAME_WE)
add_custom_target(_mstar_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mstar" "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg" "mstar/Pose2D"
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg" NAME_WE)
add_custom_target(_mstar_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mstar" "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg" "mstar/Pose2D:mstar/Path2D"
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg" NAME_WE)
add_custom_target(_mstar_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mstar" "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg" "mstar/Pose2D"
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/PriorityPlan.srv" NAME_WE)
add_custom_target(_mstar_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mstar" "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/PriorityPlan.srv" "mstar/Pose2D:mstar/Pose2DList:mstar/Belief:mstar/Path2D"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mstar
)
_generate_msg_cpp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mstar
)
_generate_msg_cpp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mstar
)
_generate_msg_cpp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mstar
)

### Generating Services
_generate_srv_cpp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/PriorityPlan.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mstar
)
_generate_srv_cpp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/Planner.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mstar
)

### Generating Module File
_generate_module_cpp(mstar
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mstar
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mstar_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mstar_generate_messages mstar_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg" NAME_WE)
add_dependencies(mstar_generate_messages_cpp _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/Planner.srv" NAME_WE)
add_dependencies(mstar_generate_messages_cpp _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg" NAME_WE)
add_dependencies(mstar_generate_messages_cpp _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg" NAME_WE)
add_dependencies(mstar_generate_messages_cpp _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg" NAME_WE)
add_dependencies(mstar_generate_messages_cpp _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/PriorityPlan.srv" NAME_WE)
add_dependencies(mstar_generate_messages_cpp _mstar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mstar_gencpp)
add_dependencies(mstar_gencpp mstar_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mstar_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mstar
)
_generate_msg_lisp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mstar
)
_generate_msg_lisp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mstar
)
_generate_msg_lisp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mstar
)

### Generating Services
_generate_srv_lisp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/PriorityPlan.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mstar
)
_generate_srv_lisp(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/Planner.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mstar
)

### Generating Module File
_generate_module_lisp(mstar
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mstar
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mstar_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mstar_generate_messages mstar_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg" NAME_WE)
add_dependencies(mstar_generate_messages_lisp _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/Planner.srv" NAME_WE)
add_dependencies(mstar_generate_messages_lisp _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg" NAME_WE)
add_dependencies(mstar_generate_messages_lisp _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg" NAME_WE)
add_dependencies(mstar_generate_messages_lisp _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg" NAME_WE)
add_dependencies(mstar_generate_messages_lisp _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/PriorityPlan.srv" NAME_WE)
add_dependencies(mstar_generate_messages_lisp _mstar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mstar_genlisp)
add_dependencies(mstar_genlisp mstar_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mstar_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar
)
_generate_msg_py(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar
)
_generate_msg_py(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar
)
_generate_msg_py(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar
)

### Generating Services
_generate_srv_py(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/PriorityPlan.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar
)
_generate_srv_py(mstar
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/Planner.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar
)

### Generating Module File
_generate_module_py(mstar
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mstar_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mstar_generate_messages mstar_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2D.msg" NAME_WE)
add_dependencies(mstar_generate_messages_py _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/Planner.srv" NAME_WE)
add_dependencies(mstar_generate_messages_py _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Pose2DList.msg" NAME_WE)
add_dependencies(mstar_generate_messages_py _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Belief.msg" NAME_WE)
add_dependencies(mstar_generate_messages_py _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/msg/Path2D.msg" NAME_WE)
add_dependencies(mstar_generate_messages_py _mstar_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/mstar/srv/PriorityPlan.srv" NAME_WE)
add_dependencies(mstar_generate_messages_py _mstar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mstar_genpy)
add_dependencies(mstar_genpy mstar_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mstar_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mstar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mstar
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mstar_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mstar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mstar
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(mstar_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mstar/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mstar_generate_messages_py std_msgs_generate_messages_py)
endif()
