; Auto-generated. Do not edit!


(cl:in-package collision_checker-srv)


;//! \htmlinclude Checker-request.msg.html

(cl:defclass <Checker-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Checker-request (<Checker-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Checker-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Checker-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name collision_checker-srv:<Checker-request> is deprecated: use collision_checker-srv:Checker-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Checker-request>) ostream)
  "Serializes a message object of type '<Checker-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Checker-request>) istream)
  "Deserializes a message object of type '<Checker-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Checker-request>)))
  "Returns string type for a service object of type '<Checker-request>"
  "collision_checker/CheckerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Checker-request)))
  "Returns string type for a service object of type 'Checker-request"
  "collision_checker/CheckerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Checker-request>)))
  "Returns md5sum for a message object of type '<Checker-request>"
  "9bcc07d248949c25d6230c96a8ef5699")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Checker-request)))
  "Returns md5sum for a message object of type 'Checker-request"
  "9bcc07d248949c25d6230c96a8ef5699")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Checker-request>)))
  "Returns full string definition for message of type '<Checker-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Checker-request)))
  "Returns full string definition for message of type 'Checker-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Checker-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Checker-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Checker-request
))
;//! \htmlinclude Checker-response.msg.html

(cl:defclass <Checker-response> (roslisp-msg-protocol:ros-message)
  ((ids
    :reader ids
    :initarg :ids
    :type collision_checker-msg:CollisionIDs
    :initform (cl:make-instance 'collision_checker-msg:CollisionIDs)))
)

(cl:defclass Checker-response (<Checker-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Checker-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Checker-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name collision_checker-srv:<Checker-response> is deprecated: use collision_checker-srv:Checker-response instead.")))

(cl:ensure-generic-function 'ids-val :lambda-list '(m))
(cl:defmethod ids-val ((m <Checker-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader collision_checker-srv:ids-val is deprecated.  Use collision_checker-srv:ids instead.")
  (ids m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Checker-response>) ostream)
  "Serializes a message object of type '<Checker-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ids) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Checker-response>) istream)
  "Deserializes a message object of type '<Checker-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ids) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Checker-response>)))
  "Returns string type for a service object of type '<Checker-response>"
  "collision_checker/CheckerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Checker-response)))
  "Returns string type for a service object of type 'Checker-response"
  "collision_checker/CheckerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Checker-response>)))
  "Returns md5sum for a message object of type '<Checker-response>"
  "9bcc07d248949c25d6230c96a8ef5699")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Checker-response)))
  "Returns md5sum for a message object of type 'Checker-response"
  "9bcc07d248949c25d6230c96a8ef5699")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Checker-response>)))
  "Returns full string definition for message of type '<Checker-response>"
  (cl:format cl:nil "CollisionIDs ids~%~%================================================================================~%MSG: collision_checker/CollisionIDs~%int8[] colAgents~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Checker-response)))
  "Returns full string definition for message of type 'Checker-response"
  (cl:format cl:nil "CollisionIDs ids~%~%================================================================================~%MSG: collision_checker/CollisionIDs~%int8[] colAgents~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Checker-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ids))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Checker-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Checker-response
    (cl:cons ':ids (ids msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Checker)))
  'Checker-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Checker)))
  'Checker-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Checker)))
  "Returns string type for a service object of type '<Checker>"
  "collision_checker/Checker")