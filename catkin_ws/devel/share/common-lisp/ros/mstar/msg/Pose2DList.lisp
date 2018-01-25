; Auto-generated. Do not edit!


(cl:in-package mstar-msg)


;//! \htmlinclude Pose2DList.msg.html

(cl:defclass <Pose2DList> (roslisp-msg-protocol:ros-message)
  ((poses
    :reader poses
    :initarg :poses
    :type (cl:vector mstar-msg:Pose2D)
   :initform (cl:make-array 0 :element-type 'mstar-msg:Pose2D :initial-element (cl:make-instance 'mstar-msg:Pose2D))))
)

(cl:defclass Pose2DList (<Pose2DList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Pose2DList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Pose2DList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mstar-msg:<Pose2DList> is deprecated: use mstar-msg:Pose2DList instead.")))

(cl:ensure-generic-function 'poses-val :lambda-list '(m))
(cl:defmethod poses-val ((m <Pose2DList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-msg:poses-val is deprecated.  Use mstar-msg:poses instead.")
  (poses m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Pose2DList>) ostream)
  "Serializes a message object of type '<Pose2DList>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'poses))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Pose2DList>) istream)
  "Deserializes a message object of type '<Pose2DList>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'poses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mstar-msg:Pose2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Pose2DList>)))
  "Returns string type for a message object of type '<Pose2DList>"
  "mstar/Pose2DList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pose2DList)))
  "Returns string type for a message object of type 'Pose2DList"
  "mstar/Pose2DList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Pose2DList>)))
  "Returns md5sum for a message object of type '<Pose2DList>"
  "5e69772910d4436923e40502b8e6c939")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Pose2DList)))
  "Returns md5sum for a message object of type 'Pose2DList"
  "5e69772910d4436923e40502b8e6c939")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Pose2DList>)))
  "Returns full string definition for message of type '<Pose2DList>"
  (cl:format cl:nil "Pose2D[] poses~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Pose2DList)))
  "Returns full string definition for message of type 'Pose2DList"
  (cl:format cl:nil "Pose2D[] poses~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Pose2DList>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Pose2DList>))
  "Converts a ROS message object to a list"
  (cl:list 'Pose2DList
    (cl:cons ':poses (poses msg))
))
