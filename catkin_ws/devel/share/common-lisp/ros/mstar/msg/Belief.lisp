; Auto-generated. Do not edit!


(cl:in-package mstar-msg)


;//! \htmlinclude Belief.msg.html

(cl:defclass <Belief> (roslisp-msg-protocol:ros-message)
  ((belief
    :reader belief
    :initarg :belief
    :type (cl:vector mstar-msg:Path2D)
   :initform (cl:make-array 0 :element-type 'mstar-msg:Path2D :initial-element (cl:make-instance 'mstar-msg:Path2D))))
)

(cl:defclass Belief (<Belief>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Belief>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Belief)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mstar-msg:<Belief> is deprecated: use mstar-msg:Belief instead.")))

(cl:ensure-generic-function 'belief-val :lambda-list '(m))
(cl:defmethod belief-val ((m <Belief>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-msg:belief-val is deprecated.  Use mstar-msg:belief instead.")
  (belief m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Belief>) ostream)
  "Serializes a message object of type '<Belief>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'belief))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'belief))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Belief>) istream)
  "Deserializes a message object of type '<Belief>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'belief) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'belief)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mstar-msg:Path2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Belief>)))
  "Returns string type for a message object of type '<Belief>"
  "mstar/Belief")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Belief)))
  "Returns string type for a message object of type 'Belief"
  "mstar/Belief")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Belief>)))
  "Returns md5sum for a message object of type '<Belief>"
  "48eb5de553b40f592849c01a2b98d2d4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Belief)))
  "Returns md5sum for a message object of type 'Belief"
  "48eb5de553b40f592849c01a2b98d2d4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Belief>)))
  "Returns full string definition for message of type '<Belief>"
  (cl:format cl:nil "Path2D[] belief~%~%================================================================================~%MSG: mstar/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Belief)))
  "Returns full string definition for message of type 'Belief"
  (cl:format cl:nil "Path2D[] belief~%~%================================================================================~%MSG: mstar/Path2D~%int8 id~%int32 timestamp~%Pose2D[] poses~%~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Belief>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'belief) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Belief>))
  "Converts a ROS message object to a list"
  (cl:list 'Belief
    (cl:cons ':belief (belief msg))
))
