
(cl:in-package :asdf)

(defsystem "path_db-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :path_db-msg
)
  :components ((:file "_package")
    (:file "QueryDB" :depends-on ("_package_QueryDB"))
    (:file "_package_QueryDB" :depends-on ("_package"))
  ))