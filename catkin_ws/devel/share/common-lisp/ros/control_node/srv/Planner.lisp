; Auto-generated. Do not edit!


(cl:in-package control_node-srv)


;//! \htmlinclude Planner-request.msg.html

(cl:defclass <Planner-request> (roslisp-msg-protocol:ros-message)
  ((agents_ids
    :reader agents_ids
    :initarg :agents_ids
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass Planner-request (<Planner-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Planner-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Planner-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control_node-srv:<Planner-request> is deprecated: use control_node-srv:Planner-request instead.")))

(cl:ensure-generic-function 'agents_ids-val :lambda-list '(m))
(cl:defmethod agents_ids-val ((m <Planner-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_node-srv:agents_ids-val is deprecated.  Use control_node-srv:agents_ids instead.")
  (agents_ids m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Planner-request>) ostream)
  "Serializes a message object of type '<Planner-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'agents_ids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'agents_ids))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Planner-request>) istream)
  "Deserializes a message object of type '<Planner-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'agents_ids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'agents_ids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Planner-request>)))
  "Returns string type for a service object of type '<Planner-request>"
  "control_node/PlannerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Planner-request)))
  "Returns string type for a service object of type 'Planner-request"
  "control_node/PlannerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Planner-request>)))
  "Returns md5sum for a message object of type '<Planner-request>"
  "07991e894479aa925d322b73f927b3b5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Planner-request)))
  "Returns md5sum for a message object of type 'Planner-request"
  "07991e894479aa925d322b73f927b3b5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Planner-request>)))
  "Returns full string definition for message of type '<Planner-request>"
  (cl:format cl:nil "int8[] agents_ids~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Planner-request)))
  "Returns full string definition for message of type 'Planner-request"
  (cl:format cl:nil "int8[] agents_ids~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Planner-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'agents_ids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Planner-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Planner-request
    (cl:cons ':agents_ids (agents_ids msg))
))
;//! \htmlinclude Planner-response.msg.html

(cl:defclass <Planner-response> (roslisp-msg-protocol:ros-message)
  ((agents_paths
    :reader agents_paths
    :initarg :agents_paths
    :type (cl:vector control_node-msg:Path2D)
   :initform (cl:make-array 0 :element-type 'control_node-msg:Path2D :initial-element (cl:make-instance 'control_node-msg:Path2D))))
)

(cl:defclass Planner-response (<Planner-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Planner-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Planner-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control_node-srv:<Planner-response> is deprecated: use control_node-srv:Planner-response instead.")))

(cl:ensure-generic-function 'agents_paths-val :lambda-list '(m))
(cl:defmethod agents_paths-val ((m <Planner-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_node-srv:agents_paths-val is deprecated.  Use control_node-srv:agents_paths instead.")
  (agents_paths m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Planner-response>) ostream)
  "Serializes a message object of type '<Planner-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'agents_paths))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'agents_paths))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Planner-response>) istream)
  "Deserializes a message object of type '<Planner-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'agents_paths) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'agents_paths)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'control_node-msg:Path2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Planner-response>)))
  "Returns string type for a service object of type '<Planner-response>"
  "control_node/PlannerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Planner-response)))
  "Returns string type for a service object of type 'Planner-response"
  "control_node/PlannerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Planner-response>)))
  "Returns md5sum for a message object of type '<Planner-response>"
  "07991e894479aa925d322b73f927b3b5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Planner-response)))
  "Returns md5sum for a message object of type 'Planner-response"
  "07991e894479aa925d322b73f927b3b5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Planner-response>)))
  "Returns full string definition for message of type '<Planner-response>"
  (cl:format cl:nil "Path2D[] agents_paths~%~%================================================================================~%MSG: control_node/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: control_node/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Planner-response)))
  "Returns full string definition for message of type 'Planner-response"
  (cl:format cl:nil "Path2D[] agents_paths~%~%================================================================================~%MSG: control_node/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: control_node/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Planner-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'agents_paths) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Planner-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Planner-response
    (cl:cons ':agents_paths (agents_paths msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Planner)))
  'Planner-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Planner)))
  'Planner-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Planner)))
  "Returns string type for a service object of type '<Planner>"
  "control_node/Planner")