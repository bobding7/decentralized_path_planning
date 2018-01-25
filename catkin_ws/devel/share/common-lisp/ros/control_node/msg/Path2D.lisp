; Auto-generated. Do not edit!


(cl:in-package control_node-msg)


;//! \htmlinclude Path2D.msg.html

(cl:defclass <Path2D> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (poses
    :reader poses
    :initarg :poses
    :type (cl:vector control_node-msg:Pose2D)
   :initform (cl:make-array 0 :element-type 'control_node-msg:Pose2D :initial-element (cl:make-instance 'control_node-msg:Pose2D))))
)

(cl:defclass Path2D (<Path2D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Path2D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Path2D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name control_node-msg:<Path2D> is deprecated: use control_node-msg:Path2D instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Path2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_node-msg:id-val is deprecated.  Use control_node-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <Path2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_node-msg:timestamp-val is deprecated.  Use control_node-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'poses-val :lambda-list '(m))
(cl:defmethod poses-val ((m <Path2D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader control_node-msg:poses-val is deprecated.  Use control_node-msg:poses instead.")
  (poses m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Path2D>) ostream)
  "Serializes a message object of type '<Path2D>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'timestamp)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'poses))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Path2D>) istream)
  "Deserializes a message object of type '<Path2D>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timestamp) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'poses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'control_node-msg:Pose2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Path2D>)))
  "Returns string type for a message object of type '<Path2D>"
  "control_node/Path2D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Path2D)))
  "Returns string type for a message object of type 'Path2D"
  "control_node/Path2D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Path2D>)))
  "Returns md5sum for a message object of type '<Path2D>"
  "30794f2563bb2475cd7dbbb749b5cb73")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Path2D)))
  "Returns md5sum for a message object of type 'Path2D"
  "30794f2563bb2475cd7dbbb749b5cb73")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Path2D>)))
  "Returns full string definition for message of type '<Path2D>"
  (cl:format cl:nil "int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: control_node/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Path2D)))
  "Returns full string definition for message of type 'Path2D"
  (cl:format cl:nil "int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: control_node/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Path2D>))
  (cl:+ 0
     1
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Path2D>))
  "Converts a ROS message object to a list"
  (cl:list 'Path2D
    (cl:cons ':id (id msg))
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':poses (poses msg))
))
