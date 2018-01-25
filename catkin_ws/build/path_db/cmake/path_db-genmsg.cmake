# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "path_db: 3 messages, 1 services")

set(MSG_I_FLAGS "-Ipath_db:/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(path_db_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Belief.msg" NAME_WE)
add_custom_target(_path_db_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_db" "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Belief.msg" "path_db/Path2D:path_db/Pose2D"
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/srv/QueryDB.srv" NAME_WE)
add_custom_target(_path_db_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_db" "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/srv/QueryDB.srv" "path_db/Path2D:path_db/Belief:path_db/Pose2D"
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg" NAME_WE)
add_custom_target(_path_db_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_db" "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg" ""
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg" NAME_WE)
add_custom_target(_path_db_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_db" "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg" "path_db/Pose2D"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Belief.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_db
)
_generate_msg_cpp(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_db
)
_generate_msg_cpp(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_db
)

### Generating Services
_generate_srv_cpp(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/srv/QueryDB.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Belief.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_db
)

### Generating Module File
_generate_module_cpp(path_db
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_db
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(path_db_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(path_db_generate_messages path_db_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Belief.msg" NAME_WE)
add_dependencies(path_db_generate_messages_cpp _path_db_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/srv/QueryDB.srv" NAME_WE)
add_dependencies(path_db_generate_messages_cpp _path_db_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg" NAME_WE)
add_dependencies(path_db_generate_messages_cpp _path_db_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg" NAME_WE)
add_dependencies(path_db_generate_messages_cpp _path_db_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_db_gencpp)
add_dependencies(path_db_gencpp path_db_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_db_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Belief.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_db
)
_generate_msg_lisp(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_db
)
_generate_msg_lisp(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_db
)

### Generating Services
_generate_srv_lisp(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/srv/QueryDB.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Belief.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_db
)

### Generating Module File
_generate_module_lisp(path_db
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_db
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(path_db_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(path_db_generate_messages path_db_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Belief.msg" NAME_WE)
add_dependencies(path_db_generate_messages_lisp _path_db_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/srv/QueryDB.srv" NAME_WE)
add_dependencies(path_db_generate_messages_lisp _path_db_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg" NAME_WE)
add_dependencies(path_db_generate_messages_lisp _path_db_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg" NAME_WE)
add_dependencies(path_db_generate_messages_lisp _path_db_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_db_genlisp)
add_dependencies(path_db_genlisp path_db_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_db_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Belief.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_db
)
_generate_msg_py(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_db
)
_generate_msg_py(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_db
)

### Generating Services
_generate_srv_py(path_db
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/srv/QueryDB.srv"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Belief.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_db
)

### Generating Module File
_generate_module_py(path_db
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_db
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(path_db_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(path_db_generate_messages path_db_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Belief.msg" NAME_WE)
add_dependencies(path_db_generate_messages_py _path_db_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/srv/QueryDB.srv" NAME_WE)
add_dependencies(path_db_generate_messages_py _path_db_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Pose2D.msg" NAME_WE)
add_dependencies(path_db_generate_messages_py _path_db_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/path_db/msg/Path2D.msg" NAME_WE)
add_dependencies(path_db_generate_messages_py _path_db_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_db_genpy)
add_dependencies(path_db_genpy path_db_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_db_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_db)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_db
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(path_db_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_db)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_db
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(path_db_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_db)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_db\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_db
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(path_db_generate_messages_py std_msgs_generate_messages_py)
endif()
