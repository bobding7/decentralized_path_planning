; Auto-generated. Do not edit!


(cl:in-package collision_checker-msg)


;//! \htmlinclude CollisionIDs.msg.html

(cl:defclass <CollisionIDs> (roslisp-msg-protocol:ros-message)
  ((colAgents
    :reader colAgents
    :initarg :colAgents
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass CollisionIDs (<CollisionIDs>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CollisionIDs>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CollisionIDs)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name collision_checker-msg:<CollisionIDs> is deprecated: use collision_checker-msg:CollisionIDs instead.")))

(cl:ensure-generic-function 'colAgents-val :lambda-list '(m))
(cl:defmethod colAgents-val ((m <CollisionIDs>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader collision_checker-msg:colAgents-val is deprecated.  Use collision_checker-msg:colAgents instead.")
  (colAgents m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CollisionIDs>) ostream)
  "Serializes a message object of type '<CollisionIDs>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'colAgents))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'colAgents))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CollisionIDs>) istream)
  "Deserializes a message object of type '<CollisionIDs>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'colAgents) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'colAgents)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CollisionIDs>)))
  "Returns string type for a message object of type '<CollisionIDs>"
  "collision_checker/CollisionIDs")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CollisionIDs)))
  "Returns string type for a message object of type 'CollisionIDs"
  "collision_checker/CollisionIDs")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CollisionIDs>)))
  "Returns md5sum for a message object of type '<CollisionIDs>"
  "09c176dbe4cfa163d0f04c6e3f2169c8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CollisionIDs)))
  "Returns md5sum for a message object of type 'CollisionIDs"
  "09c176dbe4cfa163d0f04c6e3f2169c8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CollisionIDs>)))
  "Returns full string definition for message of type '<CollisionIDs>"
  (cl:format cl:nil "int8[] colAgents~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CollisionIDs)))
  "Returns full string definition for message of type 'CollisionIDs"
  (cl:format cl:nil "int8[] colAgents~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CollisionIDs>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'colAgents) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CollisionIDs>))
  "Converts a ROS message object to a list"
  (cl:list 'CollisionIDs
    (cl:cons ':colAgents (colAgents msg))
))
