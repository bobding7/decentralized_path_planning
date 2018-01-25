; Auto-generated. Do not edit!


(cl:in-package mstar-msg)


;//! \htmlinclude Path2DList.msg.html

(cl:defclass <Path2DList> (roslisp-msg-protocol:ros-message)
  ((path_list
    :reader path_list
    :initarg :path_list
    :type (cl:vector mstar-msg:Path2D)
   :initform (cl:make-array 0 :element-type 'mstar-msg:Path2D :initial-element (cl:make-instance 'mstar-msg:Path2D))))
)

(cl:defclass Path2DList (<Path2DList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Path2DList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Path2DList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mstar-msg:<Path2DList> is deprecated: use mstar-msg:Path2DList instead.")))

(cl:ensure-generic-function 'path_list-val :lambda-list '(m))
(cl:defmethod path_list-val ((m <Path2DList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mstar-msg:path_list-val is deprecated.  Use mstar-msg:path_list instead.")
  (path_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Path2DList>) ostream)
  "Serializes a message object of type '<Path2DList>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'path_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'path_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Path2DList>) istream)
  "Deserializes a message object of type '<Path2DList>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'path_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'path_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mstar-msg:Path2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Path2DList>)))
  "Returns string type for a message object of type '<Path2DList>"
  "mstar/Path2DList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Path2DList)))
  "Returns string type for a message object of type 'Path2DList"
  "mstar/Path2DList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Path2DList>)))
  "Returns md5sum for a message object of type '<Path2DList>"
  "9005d07d346652d95a7610b95384ffb2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Path2DList)))
  "Returns md5sum for a message object of type 'Path2DList"
  "9005d07d346652d95a7610b95384ffb2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Path2DList>)))
  "Returns full string definition for message of type '<Path2DList>"
  (cl:format cl:nil "Path2D[] path_list~%~%================================================================================~%MSG: mstar/Path2D~%Pose2D[] poses~%~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Path2DList)))
  "Returns full string definition for message of type 'Path2DList"
  (cl:format cl:nil "Path2D[] path_list~%~%================================================================================~%MSG: mstar/Path2D~%Pose2D[] poses~%~%================================================================================~%MSG: mstar/Pose2D~%float32 x~%float32 y~%float32 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Path2DList>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'path_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Path2DList>))
  "Converts a ROS message object to a list"
  (cl:list 'Path2DList
    (cl:cons ':path_list (path_list msg))
))
