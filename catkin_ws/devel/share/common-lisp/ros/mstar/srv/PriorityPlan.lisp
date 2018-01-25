; Auto-generated. Do not edit!


(cl:in-package mstar-srv)


;//! \htmlinclude PriorityPlan-request.msg.html

(cl:defclass <PriorityPlan-request> (roslisp-msg-protocol:ros-message)
  ((robotIDs
    :reader robotIDs
    :initarg :robotIDs
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (fix_paths
    :reader fix_paths
    :initarg :fix_paths
    :type mstar-msg:Belief
    :initform (cl:make-instance 'mstar-msg:Belief))
   (current
    :reader current
    :initarg :current
    :type mstar-msg:Pose2DList
    :initform (cl:make-instance 'mstar-msg:Pose2DList))
   (target
    :reader target
    :initarg :target
    :type mstar-msg:Pose2DList
    :initform (cl:make-instance 'mstar-msg:Pose2DList)))
)

(cl:defclass PriorityPlan-request (<PriorityPlan-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PriorityPlan-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PriorityPlan-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mstar-srv:<PriorityPlan-request> is deprecated: use mstar-srv:PriorityPlan-request instead.")))

(cl:ensure-generic-function 'robotIDs-val :lambda-list '(m))
(cl:defmethod robotIDs-val ((m <PriorityPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-srv:robotIDs-val is deprecated.  Use mstar-srv:robotIDs instead.")
  (robotIDs m))

(cl:ensure-generic-function 'fix_paths-val :lambda-list '(m))
(cl:defmethod fix_paths-val ((m <PriorityPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-srv:fix_paths-val is deprecated.  Use mstar-srv:fix_paths instead.")
  (fix_paths m))

(cl:ensure-generic-function 'current-val :lambda-list '(m))
(cl:defmethod current-val ((m <PriorityPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-srv:current-val is deprecated.  Use mstar-srv:current instead.")
  (current m))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <PriorityPlan-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-srv:target-val is deprecated.  Use mstar-srv:target instead.")
  (target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PriorityPlan-request>) ostream)
  "Serializes a message object of type '<PriorityPlan-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'robotIDs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'robotIDs))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'fix_paths) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'current) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'target) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PriorityPlan-request>) istream)
  "Deserializes a message object of type '<PriorityPlan-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'robotIDs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'robotIDs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'fix_paths) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'current) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'target) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PriorityPlan-request>)))
  "Returns string type for a service object of type '<PriorityPlan-request>"
  "mstar/PriorityPlanRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PriorityPlan-request)))
  "Returns string type for a service object of type 'PriorityPlan-request"
  "mstar/PriorityPlanRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PriorityPlan-request>)))
  "Returns md5sum for a message object of type '<PriorityPlan-request>"
  "fd5a9e5a4e9db09f05592023da0f0f50")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PriorityPlan-request)))
  "Returns md5sum for a message object of type 'PriorityPlan-request"
  "fd5a9e5a4e9db09f05592023da0f0f50")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PriorityPlan-request>)))
  "Returns full string definition for message of type '<PriorityPlan-request>"
  (cl:format cl:nil "int8[] robotIDs~%Belief fix_paths~%Pose2DList current~%Pose2DList target~%~%================================================================================~%MSG: mstar/Belief~%Path2D[] belief~%~%================================================================================~%MSG: mstar/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%================================================================================~%MSG: mstar/Pose2DList~%Pose2D[] poses~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PriorityPlan-request)))
  "Returns full string definition for message of type 'PriorityPlan-request"
  (cl:format cl:nil "int8[] robotIDs~%Belief fix_paths~%Pose2DList current~%Pose2DList target~%~%================================================================================~%MSG: mstar/Belief~%Path2D[] belief~%~%================================================================================~%MSG: mstar/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%================================================================================~%MSG: mstar/Pose2DList~%Pose2D[] poses~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PriorityPlan-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'robotIDs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'fix_paths))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'current))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'target))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PriorityPlan-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PriorityPlan-request
    (cl:cons ':robotIDs (robotIDs msg))
    (cl:cons ':fix_paths (fix_paths msg))
    (cl:cons ':current (current msg))
    (cl:cons ':target (target msg))
))
;//! \htmlinclude PriorityPlan-response.msg.html

(cl:defclass <PriorityPlan-response> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type mstar-msg:Belief
    :initform (cl:make-instance 'mstar-msg:Belief)))
)

(cl:defclass PriorityPlan-response (<PriorityPlan-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PriorityPlan-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PriorityPlan-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mstar-srv:<PriorityPlan-response> is deprecated: use mstar-srv:PriorityPlan-response instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <PriorityPlan-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-srv:path-val is deprecated.  Use mstar-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PriorityPlan-response>) ostream)
  "Serializes a message object of type '<PriorityPlan-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'path) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PriorityPlan-response>) istream)
  "Deserializes a message object of type '<PriorityPlan-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'path) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PriorityPlan-response>)))
  "Returns string type for a service object of type '<PriorityPlan-response>"
  "mstar/PriorityPlanResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PriorityPlan-response)))
  "Returns string type for a service object of type 'PriorityPlan-response"
  "mstar/PriorityPlanResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PriorityPlan-response>)))
  "Returns md5sum for a message object of type '<PriorityPlan-response>"
  "fd5a9e5a4e9db09f05592023da0f0f50")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PriorityPlan-response)))
  "Returns md5sum for a message object of type 'PriorityPlan-response"
  "fd5a9e5a4e9db09f05592023da0f0f50")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PriorityPlan-response>)))
  "Returns full string definition for message of type '<PriorityPlan-response>"
  (cl:format cl:nil "Belief path~%~%~%================================================================================~%MSG: mstar/Belief~%Path2D[] belief~%~%================================================================================~%MSG: mstar/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PriorityPlan-response)))
  "Returns full string definition for message of type 'PriorityPlan-response"
  (cl:format cl:nil "Belief path~%~%~%================================================================================~%MSG: mstar/Belief~%Path2D[] belief~%~%================================================================================~%MSG: mstar/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PriorityPlan-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PriorityPlan-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PriorityPlan-response
    (cl:cons ':path (path msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PriorityPlan)))
  'PriorityPlan-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PriorityPlan)))
  'PriorityPlan-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PriorityPlan)))
  "Returns string type for a service object of type '<PriorityPlan>"
  "mstar/PriorityPlan")