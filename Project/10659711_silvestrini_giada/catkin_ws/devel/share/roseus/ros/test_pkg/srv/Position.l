;; Auto-generated. Do not edit!


(when (boundp 'test_pkg::Position)
  (if (not (find-package "TEST_PKG"))
    (make-package "TEST_PKG"))
  (shadow 'Position (find-package "TEST_PKG")))
(unless (find-package "TEST_PKG::POSITION")
  (make-package "TEST_PKG::POSITION"))
(unless (find-package "TEST_PKG::POSITIONREQUEST")
  (make-package "TEST_PKG::POSITIONREQUEST"))
(unless (find-package "TEST_PKG::POSITIONRESPONSE")
  (make-package "TEST_PKG::POSITIONRESPONSE"))

(in-package "ROS")





(defclass test_pkg::PositionRequest
  :super ros::object
  :slots (_new_x_pos _new_y_pos _new_theta_pos ))

(defmethod test_pkg::PositionRequest
  (:init
   (&key
    ((:new_x_pos __new_x_pos) 0.0)
    ((:new_y_pos __new_y_pos) 0.0)
    ((:new_theta_pos __new_theta_pos) 0.0)
    )
   (send-super :init)
   (setq _new_x_pos (float __new_x_pos))
   (setq _new_y_pos (float __new_y_pos))
   (setq _new_theta_pos (float __new_theta_pos))
   self)
  (:new_x_pos
   (&optional __new_x_pos)
   (if __new_x_pos (setq _new_x_pos __new_x_pos)) _new_x_pos)
  (:new_y_pos
   (&optional __new_y_pos)
   (if __new_y_pos (setq _new_y_pos __new_y_pos)) _new_y_pos)
  (:new_theta_pos
   (&optional __new_theta_pos)
   (if __new_theta_pos (setq _new_theta_pos __new_theta_pos)) _new_theta_pos)
  (:serialization-length
   ()
   (+
    ;; float32 _new_x_pos
    4
    ;; float32 _new_y_pos
    4
    ;; float32 _new_theta_pos
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _new_x_pos
       (sys::poke _new_x_pos (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _new_y_pos
       (sys::poke _new_y_pos (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _new_theta_pos
       (sys::poke _new_theta_pos (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _new_x_pos
     (setq _new_x_pos (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _new_y_pos
     (setq _new_y_pos (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _new_theta_pos
     (setq _new_theta_pos (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass test_pkg::PositionResponse
  :super ros::object
  :slots (_old_x_pos _old_y_pos _old_theta ))

(defmethod test_pkg::PositionResponse
  (:init
   (&key
    ((:old_x_pos __old_x_pos) 0.0)
    ((:old_y_pos __old_y_pos) 0.0)
    ((:old_theta __old_theta) 0.0)
    )
   (send-super :init)
   (setq _old_x_pos (float __old_x_pos))
   (setq _old_y_pos (float __old_y_pos))
   (setq _old_theta (float __old_theta))
   self)
  (:old_x_pos
   (&optional __old_x_pos)
   (if __old_x_pos (setq _old_x_pos __old_x_pos)) _old_x_pos)
  (:old_y_pos
   (&optional __old_y_pos)
   (if __old_y_pos (setq _old_y_pos __old_y_pos)) _old_y_pos)
  (:old_theta
   (&optional __old_theta)
   (if __old_theta (setq _old_theta __old_theta)) _old_theta)
  (:serialization-length
   ()
   (+
    ;; float32 _old_x_pos
    4
    ;; float32 _old_y_pos
    4
    ;; float32 _old_theta
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _old_x_pos
       (sys::poke _old_x_pos (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _old_y_pos
       (sys::poke _old_y_pos (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _old_theta
       (sys::poke _old_theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _old_x_pos
     (setq _old_x_pos (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _old_y_pos
     (setq _old_y_pos (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _old_theta
     (setq _old_theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass test_pkg::Position
  :super ros::object
  :slots ())

(setf (get test_pkg::Position :md5sum-) "d68d51930d623abd15f8d498c7c8fc85")
(setf (get test_pkg::Position :datatype-) "test_pkg/Position")
(setf (get test_pkg::Position :request) test_pkg::PositionRequest)
(setf (get test_pkg::Position :response) test_pkg::PositionResponse)

(defmethod test_pkg::PositionRequest
  (:response () (instance test_pkg::PositionResponse :init)))

(setf (get test_pkg::PositionRequest :md5sum-) "d68d51930d623abd15f8d498c7c8fc85")
(setf (get test_pkg::PositionRequest :datatype-) "test_pkg/PositionRequest")
(setf (get test_pkg::PositionRequest :definition-)
      "float32 new_x_pos
float32 new_y_pos
float32 new_theta_pos
---
float32 old_x_pos
float32 old_y_pos
float32 old_theta

")

(setf (get test_pkg::PositionResponse :md5sum-) "d68d51930d623abd15f8d498c7c8fc85")
(setf (get test_pkg::PositionResponse :datatype-) "test_pkg/PositionResponse")
(setf (get test_pkg::PositionResponse :definition-)
      "float32 new_x_pos
float32 new_y_pos
float32 new_theta_pos
---
float32 old_x_pos
float32 old_y_pos
float32 old_theta

")



(provide :test_pkg/Position "d68d51930d623abd15f8d498c7c8fc85")


