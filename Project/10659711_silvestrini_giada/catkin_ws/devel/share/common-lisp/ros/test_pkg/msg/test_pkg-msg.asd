
(cl:in-package :asdf)

(defsystem "test_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "wheels_rpm" :depends-on ("_package_wheels_rpm"))
    (:file "_package_wheels_rpm" :depends-on ("_package"))
  ))