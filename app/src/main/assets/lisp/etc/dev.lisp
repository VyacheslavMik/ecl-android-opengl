(in-package :cl-user)

(defun sysinfo (&optional (out *standard-output*))
  "Print the current environment to a stream."
  (declare (stream out))
  (format out "~&~%~75~~%~75,,,'-:@<<{[ The current environment ]}>~>~%~
Implementation:~20t~a~%~7tversion:~20t~a~%Machine:  type:~20t~a
~7tversion:~20t~a~%~6tinstance:~20t~a~%Opeating System:~19t"
          (lisp-implementation-type) (lisp-implementation-version)
          (machine-type) (machine-version) (machine-instance))
  #+darwin (princ " Darwin")
  #+unix (princ " Unix")
  (format out "~%Software: type:~20t~a~%~7tversion:~20t~a~%Site:~20t~a (~a)
User home:~20t~a~%Default pathname:~20t~a~%"
          (software-type) (software-version) (long-site-name)
          (short-site-name) (user-homedir-pathname)
          *default-pathname-defaults*)
  (format out "Features: ~s.
Modules:~s.~%
Current package:~s~%"
          *features* *modules* *package*)
  (flet ((exdi (fl) (integer-length (nth-value 1 (decode-float fl)))))
    (format out "Fixnum length:~25t~3d bits
Short Floats:~25t~3d bits exponent, ~3d bits significand (mantissa)
Single Floats:~25t~3d bits exponent, ~3d bits significand (mantissa)
Double Floats:~25t~3d bits exponent, ~3d bits significand (mantissa)
Long Floats:~25t~3d bits exponent, ~3d bits significand (mantissa)~%"
            (integer-length most-positive-fixnum)
            (exdi most-positive-short-float)
            (float-digits most-positive-short-float)
            (exdi most-positive-single-float)
            (float-digits most-positive-single-float)
            (exdi most-positive-double-float)
            (float-digits most-positive-double-float)
            (exdi most-positive-long-float)
            (float-digits most-positive-long-float)))
  (dolist (sy '(array-total-size-limit array-rank-limit array-dimension-limit
                lambda-parameters-limit call-arguments-limit
                multiple-values-limit char-code-limit))
    (format out " ~a:~30t~15:d~%" sy (symbol-value sy)))
  (format out "lambda-list-keywords:~s~%"
          lambda-list-keywords)
  (format out "Internal time unit:~25t~f sec~%*gensym-counter*:~25t~:d
Current time:~25t" (/ internal-time-units-per-second) *gensym-counter*)
  (format out "~a" (get-universal-time))
  (format out "~%~75~~%") (room) (values))

(sysinfo)

;; Quicklisp

(defun get-quicklisp ()
  (format t "Loading the quicklisp subsystem~%")
  (require '#:ecl-quicklisp)
  (require '#:deflate)
  (require '#:ql-minitar)
  ;; Replace the interpreted function with the precompiled equivalent
  ;; from DEFLATE
  (eval (read-from-string
         "(setf (symbol-function 'ql-gunzipper:gunzip) #'deflate:gunzip))"))
  (format t "Finished loading the quicklisp sybsystem~%"))

(get-quicklisp)

(defparameter *native-output* *standard-output*)

(format t "Loading :swank")

;; Swank

(format t "Preparing swank~%")
(ql:quickload 'swank :verbose t)
(swank-loader:init :load-contribs t :setup t :delete t :quiet t)

;; The following "patches" swank to work correctly on android/iOS
(in-package :swank/backend)
(defimplementation lisp-implementation-program ()
  "Return the argv[0] of the running Lisp process, or NIL."
  "org.lisp.ecl")

(defun start-swank ()
  (format t "Starting swank server~%")
  (mp:process-run-function
   "SLIME-listener"
   (lambda ()
     (let ((swank::*loopback-interface* "0.0.0.0"))
       (swank:create-server :port 4105
                            :dont-close t
                            ;; :style nil #|:spawn|#
                            )))))

(defun stop-swank ()
  (format t "Stopping swank server~%")
  (swank:stop-server 4105)
  (format t ";; Swank off-line~%"))

(start-swank)

;; adb forward tcp:40005 tcp:4105

(format t "Swank server started")

(require '#:cffi)
