; Auto-generated. Do not edit!


(cl:in-package test_pkg-srv)


;//! \htmlinclude Position-request.msg.html

(cl:defclass <Position-request> (roslisp-msg-protocol:ros-message)
  ((new_x_pos
    :reader new_x_pos
    :initarg :new_x_pos
    :type cl:float
    :initform 0.0)
   (new_y_pos
    :reader new_y_pos
    :initarg :new_y_pos
    :type cl:float
    :initform 0.0)
   (new_theta_pos
    :reader new_theta_pos
    :initarg :new_theta_pos
    :type cl:float
    :initform 0.0))
)

(cl:defclass Position-request (<Position-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Position-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Position-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name test_pkg-srv:<Position-request> is deprecated: use test_pkg-srv:Position-request instead.")))

(cl:ensure-generic-function 'new_x_pos-val :lambda-list '(m))
(cl:defmethod new_x_pos-val ((m <Position-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_pkg-srv:new_x_pos-val is deprecated.  Use test_pkg-srv:new_x_pos instead.")
  (new_x_pos m))

(cl:ensure-generic-function 'new_y_pos-val :lambda-list '(m))
(cl:defmethod new_y_pos-val ((m <Position-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_pkg-srv:new_y_pos-val is deprecated.  Use test_pkg-srv:new_y_pos instead.")
  (new_y_pos m))

(cl:ensure-generic-function 'new_theta_pos-val :lambda-list '(m))
(cl:defmethod new_theta_pos-val ((m <Position-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_pkg-srv:new_theta_pos-val is deprecated.  Use test_pkg-srv:new_theta_pos instead.")
  (new_theta_pos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Position-request>) ostream)
  "Serializes a message object of type '<Position-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'new_x_pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'new_y_pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'new_theta_pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Position-request>) istream)
  "Deserializes a message object of type '<Position-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'new_x_pos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'new_y_pos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'new_theta_pos) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Position-request>)))
  "Returns string type for a service object of type '<Position-request>"
  "test_pkg/PositionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Position-request)))
  "Returns string type for a service object of type 'Position-request"
  "test_pkg/PositionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Position-request>)))
  "Returns md5sum for a message object of type '<Position-request>"
  "d68d51930d623abd15f8d498c7c8fc85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Position-request)))
  "Returns md5sum for a message object of type 'Position-request"
  "d68d51930d623abd15f8d498c7c8fc85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Position-request>)))
  "Returns full string definition for message of type '<Position-request>"
  (cl:format cl:nil "float32 new_x_pos~%float32 new_y_pos~%float32 new_theta_pos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Position-request)))
  "Returns full string definition for message of type 'Position-request"
  (cl:format cl:nil "float32 new_x_pos~%float32 new_y_pos~%float32 new_theta_pos~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Position-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Position-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Position-request
    (cl:cons ':new_x_pos (new_x_pos msg))
    (cl:cons ':new_y_pos (new_y_pos msg))
    (cl:cons ':new_theta_pos (new_theta_pos msg))
))
;//! \htmlinclude Position-response.msg.html

(cl:defclass <Position-response> (roslisp-msg-protocol:ros-message)
  ((old_x_pos
    :reader old_x_pos
    :initarg :old_x_pos
    :type cl:float
    :initform 0.0)
   (old_y_pos
    :reader old_y_pos
    :initarg :old_y_pos
    :type cl:float
    :initform 0.0)
   (old_theta
    :reader old_theta
    :initarg :old_theta
    :type cl:float
    :initform 0.0))
)

(cl:defclass Position-response (<Position-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Position-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Position-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name test_pkg-srv:<Position-response> is deprecated: use test_pkg-srv:Position-response instead.")))

(cl:ensure-generic-function 'old_x_pos-val :lambda-list '(m))
(cl:defmethod old_x_pos-val ((m <Position-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_pkg-srv:old_x_pos-val is deprecated.  Use test_pkg-srv:old_x_pos instead.")
  (old_x_pos m))

(cl:ensure-generic-function 'old_y_pos-val :lambda-list '(m))
(cl:defmethod old_y_pos-val ((m <Position-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_pkg-srv:old_y_pos-val is deprecated.  Use test_pkg-srv:old_y_pos instead.")
  (old_y_pos m))

(cl:ensure-generic-function 'old_theta-val :lambda-list '(m))
(cl:defmethod old_theta-val ((m <Position-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test_pkg-srv:old_theta-val is deprecated.  Use test_pkg-srv:old_theta instead.")
  (old_theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Position-response>) ostream)
  "Serializes a message object of type '<Position-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'old_x_pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'old_y_pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'old_theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Position-response>) istream)
  "Deserializes a message object of type '<Position-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'old_x_pos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'old_y_pos) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'old_theta) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Position-response>)))
  "Returns string type for a service object of type '<Position-response>"
  "test_pkg/PositionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Position-response)))
  "Returns string type for a service object of type 'Position-response"
  "test_pkg/PositionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Position-response>)))
  "Returns md5sum for a message object of type '<Position-response>"
  "d68d51930d623abd15f8d498c7c8fc85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Position-response)))
  "Returns md5sum for a message object of type 'Position-response"
  "d68d51930d623abd15f8d498c7c8fc85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Position-response>)))
  "Returns full string definition for message of type '<Position-response>"
  (cl:format cl:nil "float32 old_x_pos~%float32 old_y_pos~%float32 old_theta~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Position-response)))
  "Returns full string definition for message of type 'Position-response"
  (cl:format cl:nil "float32 old_x_pos~%float32 old_y_pos~%float32 old_theta~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Position-response>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Position-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Position-response
    (cl:cons ':old_x_pos (old_x_pos msg))
    (cl:cons ':old_y_pos (old_y_pos msg))
    (cl:cons ':old_theta (old_theta msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Position)))
  'Position-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Position)))
  'Position-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Position)))
  "Returns string type for a service object of type '<Position>"
  "test_pkg/Position")