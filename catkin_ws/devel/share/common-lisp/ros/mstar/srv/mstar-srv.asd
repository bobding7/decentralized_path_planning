
(cl:in-package :asdf)

(defsystem "mstar-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :mstar-msg
)
  :components ((:file "_package")
    (:file "Planner" :depends-on ("_package_Planner"))
    (:file "_package_Planner" :depends-on ("_package"))
    (:file "PriorityPlan" :depends-on ("_package_PriorityPlan"))
    (:file "_package_PriorityPlan" :depends-on ("_package"))
  ))