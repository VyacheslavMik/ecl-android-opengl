(use-package (find-package 'cffi))

(defun print-pointer ()
  (let* ((env (mem-ref *env* :pointer))
	 (get-version (mem-ref (inc-pointer env 32) :pointer)))
    (list *env* env get-version)))

(defun prepare ()
  (let* ((jvm (mem-ref *jvm* :pointer))
	 (attach-thread (mem-ref (inc-pointer jvm 32) :pointer)))
    (list *jvm* attach-thread)))

(defun get-env-fn ()
  (let* ((jvm (mem-ref *jvm* :pointer))
	 (get-env (mem-ref (inc-pointer jvm 48) :pointer)))
    (list *jvm* get-env)))

(defparameter *env* (cffi:foreign-alloc :pointer))

(defun pointer-mem-ref (pointer)
  (cffi:mem-ref pointer :pointer))

(defun get-env ()
  (let ((env (cffi:foreign-alloc :pointer)))
    (setf (cffi:mem-ref env :pointer) (cffi:foreign-alloc :pointer))
    (destructuring-bind (jvm get-env-fn) (get-env-fn)
      (values
       env
       (cffi:foreign-funcall-pointer get-env-fn () :pointer jvm :pointer env :int #x00010006 :int)))))

(defun get-version2 ()
  (let ((env (cffi:foreign-alloc :pointer)))
    (setf (cffi:mem-ref env :pointer) (cffi:foreign-alloc :pointer))
    (cffi:with-foreign-object (args '(:struct jvm-attach-args))
      (cffi:with-foreign-slots ((version) args (:struct jvm-attach-args))
	(setf version #x00010006))
      (cffi:foreign-funcall-pointer
       (cffi:foreign-slot-value (cffi:mem-ref *jvm* :pointer)
				'(:struct jni-invoke-interface)
				'attach-current-thread)
       () 
       :pointer *jvm*
       :pointer env
       :pointer args
       :int)

      (cffi:foreign-funcall-pointer
       (cffi:foreign-slot-value (cffi:mem-ref
				 (cffi:mem-ref env :pointer)
				 :pointer)
				'(:struct jni-native-interface)
				'get-version)
       () 
       :pointer (cffi:mem-ref env :pointer)
       :int))))

(defun get-version3 ()
  (cffi:with-foreign-object (env :pointer)
    (cffi:with-foreign-object (p :pointer)
      (cffi:with-foreign-object (args '(:struct jvm-attach-args))
	(cffi:with-foreign-slots ((version) args (:struct jvm-attach-args))
	  (setf version #x00010006))

	(cffi:foreign-funcall-pointer
	 (cffi:foreign-slot-value (cffi:mem-ref *jvm* :pointer)
				  '(:struct jni-invoke-interface)
				  'attach-current-thread)
	 () 
	 :pointer *jvm*
	 :pointer env
	 :pointer args
	 :int)

	(cffi:foreign-funcall-pointer
	 (cffi:foreign-slot-value (cffi:mem-ref
				   (cffi:mem-ref env :pointer)
				   :pointer)
				  '(:struct jni-native-interface)
				  'get-version)
	 () 
	 :pointer (cffi:mem-ref env :pointer)
	 :int)))))

;; Need to detach thread after work
(defun attach-current-thread ()
  (let ((env (cffi:foreign-alloc :pointer)))
    (setf (cffi:mem-ref env :pointer) (cffi:foreign-alloc :pointer))
    (print env)
    (print (pointer-mem-ref env))
    (destructuring-bind (jvm attach-thread) (prepare)
      (cffi:with-foreign-object (args '(:struct jvm-attach-args))
	(cffi:with-foreign-slots ((version) args (:struct jvm-attach-args))
	  (setf version #x00010006))
	(values
	 env
	 (foreign-funcall-pointer attach-thread () :pointer jvm :pointer env :pointer args :int))))))

(defun get-version (env)
  (let* ((env         (pointer-mem-ref env))
	 (env%        (pointer-mem-ref env))
	 (get-version (mem-ref (inc-pointer env% 32) :pointer)))
    (cffi:foreign-funcall-pointer get-version () :pointer env :int)))

(defun foo ()
  (let ((env (attach-current-thread)))
    (get-version env)))


(defmacro with-attached-thread ((env-var) &body body)
  (let ((env  (gensym "env"))
	(p    (gensym "p"))
	(args (gensym "args"))
	(res  (gensym "res"))
	(ex   (gensym "ex")))
    `(cffi:with-foreign-object (,env :pointer)
       (cffi:with-foreign-object (,p :pointer)
	 (setf (cffi:mem-ref ,env :pointer) ,p)
	 (cffi:with-foreign-object (,args '(:struct jvm-attach-args))
	   (cffi:with-foreign-slots ((version) ,args (:struct jvm-attach-args))
	     (setf version #x00010006))

	   (cffi:foreign-funcall-pointer
	    (cffi:foreign-slot-value (cffi:mem-ref *jvm* :pointer)
				     '(:struct jni-invoke-interface)
				     'AttachCurrentThread)
	    () 
	    :pointer *jvm*
	    :pointer ,env
	    :pointer ,args
	    :int)

	   (let* ((,env-var ,env)
		  (,res     (progn ,@body))
		  (,ex      (jni/exception-clear ,env)))

	     (cffi:foreign-funcall-pointer
	      (cffi:foreign-slot-value (cffi:mem-ref *jvm* :pointer)
				       '(:struct jni-invoke-interface)
				       'DetachCurrentThread)
	      () 
	      :pointer *jvm*
	      :int)

	     (values ,res ,ex)))))))


(defun jni/find-class (full-class-name)
  (with-attached-thread (env)
    (cffi:with-foreign-string (fstr full-class-name)
      (cffi:foreign-funcall-pointer
       (cffi:foreign-slot-value (cffi:mem-ref
				 (cffi:mem-ref env :pointer)
				 :pointer)
				'(:struct jni-native-interface)
				'FindClass)
       () 
       :pointer (cffi:mem-ref env :pointer)
       :pointer fstr
       :pointer))))

(defun jni/find-class2 (full-class-name)
  (with-attached-thread (env)
    (cffi:foreign-funcall-pointer
     (cffi:foreign-slot-value (cffi:mem-ref
			       (cffi:mem-ref env :pointer)
			       :pointer)
			      '(:struct jni-native-interface)
			      'FindClass)
     () 
     :pointer (cffi:mem-ref env :pointer)
     :string full-class-name
     :pointer)))

(cffi:defcfun "findClass" :pointer
  (env :pointer)
  (name :string))

(cffi:defcfun "findClass" :pointer
  (name :pointer))

(with-attached-thread (env)
  (let* ((c (jni/find-class env "java/lang/ClassLoader"))
	 (m (jni/get-method-id env c "findClass" "(Ljava/lang/String;)Ljava/lang/Class;")))
    (cffi:with-foreign-string (s "com/example/ecl_android_test/HelloEclActivity")
      (print (jni/call-object-method env *class-loader* m s)))))

(with-attached-thread (env)
  (print (cffi:foreign-funcall-pointer *find-class-ptr* () 
				       :pointer (cffi:mem-ref env :pointer)
				       :string "com/example/ecl_android_test/HelloEclActivity"
				       :pointer)))

(with-attached-thread (env)
  (let* ((class (get-hello-ecl-activity-class env))
	 (activity (get-hello-ecl-activity env class))
	 (text-view (find-view-by-id env class activity "sample_text"))
	 (run-on-ui-thread (jni/get-method-id env class "runOnUiThread" "(Ljava/lang/Runnable;)V"))
	 (callback (make-callback env 7)))
    (jni/call-void-method env activity run-on-ui-thread callback)))

;; Parsing gl2.h

(defun make-return-type (s)
  (cond
    ((string= s "GLuint")
     "gl/uint")
	     
    ((string= s "GLenum")
     "gl/enum")
	     
    ((string= s "const GLubyte *")
     ":pointer")
	     
    ((string= s "GLint")
     "gl/int")
	     
    ((string= s "GLboolean")
     "gl/boolean")
	     
    ((string= s "void")
     ":void")
	     
    (t (error "Undefined ~s" s))))

(defun make-parameter-type (s)
  (if (string= s "void")
      ":void"
      (string-downcase (cl-ppcre:regex-replace "GL" s "gl/"))))

(remove-if
 #'not
 (mapcar
  #'parse-parameter
  (mapcan
   #'parse-parameter-list
   *raw-parameters*)))

(defun parse-parameter (s)
  (ecase (count #\* s)
    (0
     (destructuring-bind (type name) (cl-ppcre:split " " s)
       (format nil "(|~a| ~a)" name (make-parameter-type type))))
    (1
     (let ((type (if (search "GLchar" s)
		     ":string"
		     ":pointer"))
	   (name (cl-ppcre:regex-replace
		  "\\*"
		  (car
		   (last
		    (cl-ppcre:split " " s)))
		  "")))
       (format nil "(|~a| ~a)" name type)))
    (2
     (if (search "**" s)
	 "(|pointer| :pointer)"
	 "(|string| :string)"))))

(defun parse-parameter-list (s)
  (if (string= s "void")
      ()
      (mapcar (lambda (s)
		(string-trim " " s))
	      (cl-ppcre:split "," s))))

(defun parse-proc (l)
  (let ((s (car l)))
    (format t "~a~%" s)
    (let ((gl-fun (find-gl-function s)))
      (destructuring-bind (return-type parameters)
	  (cl-ppcre:split gl-fun s)
	(let* ((return-type (make-return-type (string-trim " " return-type)))
	       (parameters (parse-parameter-list
			    (string-trim " " parameters)))
	       (parameters (when parameters
			     (mapcar #'parse-parameter parameters)))
	       (fname (cl-ppcre:regex-replace "\\n" gl-fun "")))
	  (format nil "(cffi:defcfun (~s |~a|) ~a~{~%~a~})"
		  fname fname return-type parameters))))))

(defun find-gl-function (s)
  (let ((fstring (cl-ppcre:scan-to-strings "gl[^\ ]+" s)))
    (assert fstring () "GL function not found")
    fstring))
