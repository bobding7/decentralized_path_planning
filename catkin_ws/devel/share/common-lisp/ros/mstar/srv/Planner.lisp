; Auto-generated. Do not edit!


(cl:in-package mstar-srv)


;//! \htmlinclude Planner-request.msg.html

(cl:defclass <Planner-request> (roslisp-msg-protocol:ros-message)
  ((robotIDs
    :reader robotIDs
    :initarg :robotIDs
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (startPosition
    :reader startPosition
    :initarg :startPosition
    :type mstar-msg:Pose2DList
    :initform (cl:make-instance 'mstar-msg:Pose2DList))
   (goalPosition
    :reader goalPosition
    :initarg :goalPosition
    :type mstar-msg:Pose2DList
    :initform (cl:make-instance 'mstar-msg:Pose2DList)))
)

(cl:defclass Planner-request (<Planner-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Planner-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Planner-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mstar-srv:<Planner-request> is deprecated: use mstar-srv:Planner-request instead.")))

(cl:ensure-generic-function 'robotIDs-val :lambda-list '(m))
(cl:defmethod robotIDs-val ((m <Planner-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-srv:robotIDs-val is deprecated.  Use mstar-srv:robotIDs instead.")
  (robotIDs m))

(cl:ensure-generic-function 'startPosition-val :lambda-list '(m))
(cl:defmethod startPosition-val ((m <Planner-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-srv:startPosition-val is deprecated.  Use mstar-srv:startPosition instead.")
  (startPosition m))

(cl:ensure-generic-function 'goalPosition-val :lambda-list '(m))
(cl:defmethod goalPosition-val ((m <Planner-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-srv:goalPosition-val is deprecated.  Use mstar-srv:goalPosition instead.")
  (goalPosition m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Planner-request>) ostream)
  "Serializes a message object of type '<Planner-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'robotIDs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'robotIDs))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'startPosition) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goalPosition) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Planner-request>) istream)
  "Deserializes a message object of type '<Planner-request>"
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'startPosition) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goalPosition) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Planner-request>)))
  "Returns string type for a service object of type '<Planner-request>"
  "mstar/PlannerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Planner-request)))
  "Returns string type for a service object of type 'Planner-request"
  "mstar/PlannerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Planner-request>)))
  "Returns md5sum for a message object of type '<Planner-request>"
  "2c33b00954b55861c63aadbc1c315126")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Planner-request)))
  "Returns md5sum for a message object of type 'Planner-request"
  "2c33b00954b55861c63aadbc1c315126")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Planner-request>)))
  "Returns full string definition for message of type '<Planner-request>"
  (cl:format cl:nil "int8[] robotIDs~%Pose2DList startPosition~%Pose2DList goalPosition~%~%================================================================================~%MSG: mstar/Pose2DList~%Pose2D[] poses~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Planner-request)))
  "Returns full string definition for message of type 'Planner-request"
  (cl:format cl:nil "int8[] robotIDs~%Pose2DList startPosition~%Pose2DList goalPosition~%~%================================================================================~%MSG: mstar/Pose2DList~%Pose2D[] poses~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Planner-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'robotIDs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'startPosition))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goalPosition))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Planner-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Planner-request
    (cl:cons ':robotIDs (robotIDs msg))
    (cl:cons ':startPosition (startPosition msg))
    (cl:cons ':goalPosition (goalPosition msg))
))
;//! \htmlinclude Planner-response.msg.html

(cl:defclass <Planner-response> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type mstar-msg:Belief
    :initform (cl:make-instance 'mstar-msg:Belief)))
)

(cl:defclass Planner-response (<Planner-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Planner-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Planner-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mstar-srv:<Planner-response> is deprecated: use mstar-srv:Planner-response instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <Planner-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-srv:path-val is deprecated.  Use mstar-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Planner-response>) ostream)
  "Serializes a message object of type '<Planner-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'path) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Planner-response>) istream)
  "Deserializes a message object of type '<Planner-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'path) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Planner-response>)))
  "Returns string type for a service object of type '<Planner-response>"
  "mstar/PlannerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Planner-response)))
  "Returns string type for a service object of type 'Planner-response"
  "mstar/PlannerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Planner-response>)))
  "Returns md5sum for a message object of type '<Planner-response>"
  "2c33b00954b55861c63aadbc1c315126")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Planner-response)))
  "Returns md5sum for a message object of type 'Planner-response"
  "2c33b00954b55861c63aadbc1c315126")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Planner-response>)))
  "Returns full string definition for message of type '<Planner-response>"
  (cl:format cl:nil "Belief path~%~%================================================================================~%MSG: mstar/Belief~%Path2D[] belief~%~%================================================================================~%MSG: mstar/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Planner-response)))
  "Returns full string definition for message of type 'Planner-response"
  (cl:format cl:nil "Belief path~%~%================================================================================~%MSG: mstar/Belief~%Path2D[] belief~%~%================================================================================~%MSG: mstar/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Planner-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Planner-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Planner-response
    (cl:cons ':path (path msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Planner)))
  'Planner-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Planner)))
  'Planner-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Planner)))
  "Returns string type for a service object of type '<Planner>"
  "mstar/Planner")