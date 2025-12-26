(in-package :cl-user)
(format t "ECL (Embeddable Common-Lisp) ~A (git:~D)~%"
	(lisp-implementation-version)
	(ext:lisp-implementation-vcs-id))

(defvar *ecl-home* *default-pathname-defaults*)

(format t "Loading the modules~%")
(require '#:asdf)
(require '#:sockets)
(require '#:serve-event)

(setf asdf:*user-cache* (merge-pathnames #P"../cache/" *default-pathname-defaults*))

(pushnew (namestring *default-pathname-defaults*)
	 asdf:*central-registry*)

(defmacro defile (fname)
  `(when (probe-file ,(format nil "etc/~a.lisp" fname))
     (handler-case
	 (load ,(format nil "etc/~a" fname))
       (error (c)
	 (format t ,(format nil "Error loading ~a.lisp: ~~a" fname) c)))))

(defile "dev")
(defile "jni")
(defile "user")
