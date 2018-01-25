
(cl:in-package :asdf)

(defsystem "collision_checker-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :collision_checker-msg
)
  :components ((:file "_package")
    (:file "Checker" :depends-on ("_package_Checker"))
    (:file "_package_Checker" :depends-on ("_package"))
  ))