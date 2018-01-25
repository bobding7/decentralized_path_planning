# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "p2os_msgs: 11 messages, 0 services")

set(MSG_I_FLAGS "-Ip2os_msgs:/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(p2os_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/DIO.msg" NAME_WE)
add_custom_target(_p2os_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "p2os_msgs" "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/DIO.msg" ""
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/BatteryState.msg" NAME_WE)
add_custom_target(_p2os_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "p2os_msgs" "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/BatteryState.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/TCMState.msg" NAME_WE)
add_custom_target(_p2os_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "p2os_msgs" "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/TCMState.msg" ""
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/LiftState.msg" NAME_WE)
add_custom_target(_p2os_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "p2os_msgs" "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/LiftState.msg" ""
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/SonarArray.msg" NAME_WE)
add_custom_target(_p2os_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "p2os_msgs" "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/SonarArray.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/AIO.msg" NAME_WE)
add_custom_target(_p2os_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "p2os_msgs" "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/AIO.msg" ""
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripperState.msg" NAME_WE)
add_custom_target(_p2os_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "p2os_msgs" "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripperState.msg" "p2os_msgs/GripState:p2os_msgs/LiftState"
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/ArmState.msg" NAME_WE)
add_custom_target(_p2os_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "p2os_msgs" "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/ArmState.msg" ""
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripState.msg" NAME_WE)
add_custom_target(_p2os_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "p2os_msgs" "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripState.msg" ""
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/MotorState.msg" NAME_WE)
add_custom_target(_p2os_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "p2os_msgs" "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/MotorState.msg" ""
)

get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/PTZState.msg" NAME_WE)
add_custom_target(_p2os_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "p2os_msgs" "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/PTZState.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/ArmState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_cpp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_cpp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/TCMState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_cpp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/LiftState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_cpp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/SonarArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_cpp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/MotorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_cpp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripperState.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripState.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/LiftState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_cpp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/DIO.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_cpp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_cpp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/AIO.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_cpp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/PTZState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(p2os_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(p2os_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(p2os_msgs_generate_messages p2os_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/DIO.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_cpp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_cpp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/TCMState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_cpp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/LiftState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_cpp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/SonarArray.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_cpp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/AIO.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_cpp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripperState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_cpp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/ArmState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_cpp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_cpp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/MotorState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_cpp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/PTZState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_cpp _p2os_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(p2os_msgs_gencpp)
add_dependencies(p2os_msgs_gencpp p2os_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS p2os_msgs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/ArmState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_lisp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_lisp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/TCMState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_lisp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/LiftState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_lisp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/SonarArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_lisp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/MotorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_lisp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripperState.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripState.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/LiftState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_lisp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/DIO.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_lisp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_lisp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/AIO.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
)
_generate_msg_lisp(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/PTZState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(p2os_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(p2os_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(p2os_msgs_generate_messages p2os_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/DIO.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_lisp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_lisp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/TCMState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_lisp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/LiftState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_lisp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/SonarArray.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_lisp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/AIO.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_lisp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripperState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_lisp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/ArmState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_lisp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_lisp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/MotorState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_lisp _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/PTZState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_lisp _p2os_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(p2os_msgs_genlisp)
add_dependencies(p2os_msgs_genlisp p2os_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS p2os_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/ArmState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
)
_generate_msg_py(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
)
_generate_msg_py(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/TCMState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
)
_generate_msg_py(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/LiftState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
)
_generate_msg_py(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/SonarArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
)
_generate_msg_py(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/MotorState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
)
_generate_msg_py(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripperState.msg"
  "${MSG_I_FLAGS}"
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripState.msg;/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/LiftState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
)
_generate_msg_py(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/DIO.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
)
_generate_msg_py(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
)
_generate_msg_py(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/AIO.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
)
_generate_msg_py(p2os_msgs
  "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/PTZState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(p2os_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(p2os_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(p2os_msgs_generate_messages p2os_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/DIO.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_py _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/BatteryState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_py _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/TCMState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_py _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/LiftState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_py _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/SonarArray.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_py _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/AIO.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_py _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripperState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_py _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/ArmState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_py _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/GripState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_py _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/MotorState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_py _p2os_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/puneet/foxconnmultiagent/catkin_ws/src/p2os/p2os_msgs/msg/PTZState.msg" NAME_WE)
add_dependencies(p2os_msgs_generate_messages_py _p2os_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(p2os_msgs_genpy)
add_dependencies(p2os_msgs_genpy p2os_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS p2os_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/p2os_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(p2os_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/p2os_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(p2os_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/p2os_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(p2os_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
