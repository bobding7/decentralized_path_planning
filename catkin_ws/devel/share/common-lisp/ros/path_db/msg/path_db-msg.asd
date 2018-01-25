
(cl:in-package :asdf)

(defsystem "path_db-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Pose2D" :depends-on ("_package_Pose2D"))
    (:file "_package_Pose2D" :depends-on ("_package"))
    (:file "Path2D" :depends-on ("_package_Path2D"))
    (:file "_package_Path2D" :depends-on ("_package"))
    (:file "Belief" :depends-on ("_package_Belief"))
    (:file "_package_Belief" :depends-on ("_package"))
  ))