;; Auto-generated. Do not edit!


(when (boundp 'test_pkg::wheels_rpm)
  (if (not (find-package "TEST_PKG"))
    (make-package "TEST_PKG"))
  (shadow 'wheels_rpm (find-package "TEST_PKG")))
(unless (find-package "TEST_PKG::WHEELS_RPM")
  (make-package "TEST_PKG::WHEELS_RPM"))

(in-package "ROS")
;;//! \htmlinclude wheels_rpm.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass test_pkg::wheels_rpm
  :super ros::object
  :slots (_header _rpm_fl _rpm_fr _rpm_rr _rpm_rl ))

(defmethod test_pkg::wheels_rpm
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:rpm_fl __rpm_fl) 0.0)
    ((:rpm_fr __rpm_fr) 0.0)
    ((:rpm_rr __rpm_rr) 0.0)
    ((:rpm_rl __rpm_rl) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _rpm_fl (float __rpm_fl))
   (setq _rpm_fr (float __rpm_fr))
   (setq _rpm_rr (float __rpm_rr))
   (setq _rpm_rl (float __rpm_rl))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:rpm_fl
   (&optional __rpm_fl)
   (if __rpm_fl (setq _rpm_fl __rpm_fl)) _rpm_fl)
  (:rpm_fr
   (&optional __rpm_fr)
   (if __rpm_fr (setq _rpm_fr __rpm_fr)) _rpm_fr)
  (:rpm_rr
   (&optional __rpm_rr)
   (if __rpm_rr (setq _rpm_rr __rpm_rr)) _rpm_rr)
  (:rpm_rl
   (&optional __rpm_rl)
   (if __rpm_rl (setq _rpm_rl __rpm_rl)) _rpm_rl)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _rpm_fl
    8
    ;; float64 _rpm_fr
    8
    ;; float64 _rpm_rr
    8
    ;; float64 _rpm_rl
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _rpm_fl
       (sys::poke _rpm_fl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rpm_fr
       (sys::poke _rpm_fr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rpm_rr
       (sys::poke _rpm_rr (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _rpm_rl
       (sys::poke _rpm_rl (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _rpm_fl
     (setq _rpm_fl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rpm_fr
     (setq _rpm_fr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rpm_rr
     (setq _rpm_rr (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _rpm_rl
     (setq _rpm_rl (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get test_pkg::wheels_rpm :md5sum-) "cb85f5cc617f2c19f53f5347bdd97298")
(setf (get test_pkg::wheels_rpm :datatype-) "test_pkg/wheels_rpm")
(setf (get test_pkg::wheels_rpm :definition-)
      "Header header
float64 rpm_fl
float64 rpm_fr
float64 rpm_rr
float64 rpm_rl

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :test_pkg/wheels_rpm "cb85f5cc617f2c19f53f5347bdd97298")


