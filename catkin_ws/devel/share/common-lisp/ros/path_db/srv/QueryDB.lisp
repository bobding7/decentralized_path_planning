; Auto-generated. Do not edit!


(cl:in-package path_db-srv)


;//! \htmlinclude QueryDB-request.msg.html

(cl:defclass <QueryDB-request> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:string
    :initform "")
   (in_belief
    :reader in_belief
    :initarg :in_belief
    :type path_db-msg:Belief
    :initform (cl:make-instance 'path_db-msg:Belief)))
)

(cl:defclass QueryDB-request (<QueryDB-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QueryDB-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QueryDB-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_db-srv:<QueryDB-request> is deprecated: use path_db-srv:QueryDB-request instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <QueryDB-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_db-srv:type-val is deprecated.  Use path_db-srv:type instead.")
  (type m))

(cl:ensure-generic-function 'in_belief-val :lambda-list '(m))
(cl:defmethod in_belief-val ((m <QueryDB-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_db-srv:in_belief-val is deprecated.  Use path_db-srv:in_belief instead.")
  (in_belief m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QueryDB-request>) ostream)
  "Serializes a message object of type '<QueryDB-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'in_belief) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QueryDB-request>) istream)
  "Deserializes a message object of type '<QueryDB-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'in_belief) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QueryDB-request>)))
  "Returns string type for a service object of type '<QueryDB-request>"
  "path_db/QueryDBRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QueryDB-request)))
  "Returns string type for a service object of type 'QueryDB-request"
  "path_db/QueryDBRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QueryDB-request>)))
  "Returns md5sum for a message object of type '<QueryDB-request>"
  "14d424e88a7c969764a42fa104686aa4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QueryDB-request)))
  "Returns md5sum for a message object of type 'QueryDB-request"
  "14d424e88a7c969764a42fa104686aa4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QueryDB-request>)))
  "Returns full string definition for message of type '<QueryDB-request>"
  (cl:format cl:nil "string type~%Belief in_belief~%~%================================================================================~%MSG: path_db/Belief~%Path2D[] belief~%~%================================================================================~%MSG: path_db/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: path_db/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QueryDB-request)))
  "Returns full string definition for message of type 'QueryDB-request"
  (cl:format cl:nil "string type~%Belief in_belief~%~%================================================================================~%MSG: path_db/Belief~%Path2D[] belief~%~%================================================================================~%MSG: path_db/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: path_db/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QueryDB-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'type))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'in_belief))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QueryDB-request>))
  "Converts a ROS message object to a list"
  (cl:list 'QueryDB-request
    (cl:cons ':type (type msg))
    (cl:cons ':in_belief (in_belief msg))
))
;//! \htmlinclude QueryDB-response.msg.html

(cl:defclass <QueryDB-response> (roslisp-msg-protocol:ros-message)
  ((out_belief
    :reader out_belief
    :initarg :out_belief
    :type path_db-msg:Belief
    :initform (cl:make-instance 'path_db-msg:Belief)))
)

(cl:defclass QueryDB-response (<QueryDB-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QueryDB-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QueryDB-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_db-srv:<QueryDB-response> is deprecated: use path_db-srv:QueryDB-response instead.")))

(cl:ensure-generic-function 'out_belief-val :lambda-list '(m))
(cl:defmethod out_belief-val ((m <QueryDB-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_db-srv:out_belief-val is deprecated.  Use path_db-srv:out_belief instead.")
  (out_belief m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QueryDB-response>) ostream)
  "Serializes a message object of type '<QueryDB-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'out_belief) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QueryDB-response>) istream)
  "Deserializes a message object of type '<QueryDB-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'out_belief) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QueryDB-response>)))
  "Returns string type for a service object of type '<QueryDB-response>"
  "path_db/QueryDBResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QueryDB-response)))
  "Returns string type for a service object of type 'QueryDB-response"
  "path_db/QueryDBResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QueryDB-response>)))
  "Returns md5sum for a message object of type '<QueryDB-response>"
  "14d424e88a7c969764a42fa104686aa4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QueryDB-response)))
  "Returns md5sum for a message object of type 'QueryDB-response"
  "14d424e88a7c969764a42fa104686aa4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QueryDB-response>)))
  "Returns full string definition for message of type '<QueryDB-response>"
  (cl:format cl:nil "Belief out_belief~%~%~%================================================================================~%MSG: path_db/Belief~%Path2D[] belief~%~%================================================================================~%MSG: path_db/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: path_db/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QueryDB-response)))
  "Returns full string definition for message of type 'QueryDB-response"
  (cl:format cl:nil "Belief out_belief~%~%~%================================================================================~%MSG: path_db/Belief~%Path2D[] belief~%~%================================================================================~%MSG: path_db/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: path_db/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QueryDB-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'out_belief))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QueryDB-response>))
  "Converts a ROS message object to a list"
  (cl:list 'QueryDB-response
    (cl:cons ':out_belief (out_belief msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'QueryDB)))
  'QueryDB-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'QueryDB)))
  'QueryDB-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QueryDB)))
  "Returns string type for a service object of type '<QueryDB>"
  "path_db/QueryDB")