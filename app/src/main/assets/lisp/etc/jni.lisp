(in-package :cl-user)

(cffi:defcstruct jvm-attach-args
  (version :int)
  (name :pointer)
  (group :pointer))

(cffi:defcstruct jni-native-interface
  (reserved0 :pointer)
  (reserved1 :pointer)
  (reserved2 :pointer)
  (reserved3 :pointer)

  (GetVersion :pointer)
  (DefineClass :pointer)
  (FindClass :pointer)
  (FromReflectedMethod :pointer)
  (FromReflectedField :pointer)
  (ToReflectedMethod :pointer)
  (GetSuperclass :pointer)
  (IsAssignableFrom :pointer)
  (ToReflectedField :pointer)
  (Throw :pointer)
  (ThrowNew :pointer)
  (ExceptionOccurred :pointer)
  (ExceptionDescribe :pointer)
  (ExceptionClear :pointer)
  (FatalError :pointer)
  (PushLocalFrame :pointer)
  (PopLocalFrame :pointer)
  (NewGlobalRef :pointer)
  (DeleteGlobalRef :pointer)
  (DeleteLocalRef :pointer)
  (IsSameObject :pointer)
  (NewLocalRef :pointer)
  (EnsureLocalCapacity :pointer)
  (AllocObject :pointer)
  (NewObject :pointer)
  (NewObjectV :pointer)
  (NewObjectA :pointer)
  (GetObjectClass :pointer)
  (IsInstanceOf :pointer)
  (GetMethodID :pointer)
  (CallObjectMethod :pointer)
  (CallObjectMethodV :pointer)
  (CallObjectMethodA :pointer)
  (CallBooleanMethod :pointer)
  (CallBooleanMethodV :pointer)
  (CallBooleanMethodA :pointer)
  (CallByteMethod :pointer)
  (CallByteMethodV :pointer)
  (CallByteMethodA :pointer)
  (CallCharMethod :pointer)
  (CallCharMethodV :pointer)
  (CallCharMethodA :pointer)
  (CallShortMethod :pointer)
  (CallShortMethodV :pointer)
  (CallShortMethodA :pointer)
  (CallIntMethod :pointer)
  (CallIntMethodV :pointer)
  (CallIntMethodA :pointer)
  (CallLongMethod :pointer)
  (CallLongMethodV :pointer)
  (CallLongMethodA :pointer)
  (CallFloatMethod :pointer)
  (CallFloatMethodV :pointer)
  (CallFloatMethodA :pointer)
  (CallDoubleMethod :pointer)
  (CallDoubleMethodV :pointer)
  (CallDoubleMethodA :pointer)
  (CallVoidMethod :pointer)
  (CallVoidMethodV :pointer)
  (CallVoidMethodA :pointer)
  (CallNonvirtualObjectMethod :pointer)
  (CallNonvirtualObjectMethodV :pointer)
  (CallNonvirtualObjectMethodA :pointer)
  (CallNonvirtualBooleanMethod :pointer)
  (CallNonvirtualBooleanMethodV :pointer)
  (CallNonvirtualBooleanMethodA :pointer)
  (CallNonvirtualByteMethod :pointer)
  (CallNonvirtualByteMethodV :pointer)
  (CallNonvirtualByteMethodA :pointer)
  (CallNonvirtualCharMethod :pointer)
  (CallNonvirtualCharMethodV :pointer)
  (CallNonvirtualCharMethodA :pointer)
  (CallNonvirtualShortMethod :pointer)
  (CallNonvirtualShortMethodV :pointer)
  (CallNonvirtualShortMethodA :pointer)
  (CallNonvirtualIntMethod :pointer)
  (CallNonvirtualIntMethodV :pointer)
  (CallNonvirtualIntMethodA :pointer)
  (CallNonvirtualLongMethod :pointer)
  (CallNonvirtualLongMethodV :pointer)
  (CallNonvirtualLongMethodA :pointer)
  (CallNonvirtualFloatMethod :pointer)
  (CallNonvirtualFloatMethodV :pointer)
  (CallNonvirtualFloatMethodA :pointer)
  (CallNonvirtualDoubleMethod :pointer)
  (CallNonvirtualDoubleMethodV :pointer)
  (CallNonvirtualDoubleMethodA :pointer)
  (CallNonvirtualVoidMethod :pointer)
  (CallNonvirtualVoidMethodV :pointer)
  (CallNonvirtualVoidMethodA :pointer)
  (GetFieldID :pointer)
  (GetObjectField :pointer)
  (GetBooleanField :pointer)
  (GetByteField :pointer)
  (GetCharField :pointer)
  (GetShortField :pointer)
  (GetIntField :pointer)
  (GetLongField :pointer)
  (GetFloatField :pointer)
  (GetDoubleField :pointer)
  (SetObjectField :pointer)
  (SetBooleanField :pointer)
  (SetByteField :pointer)
  (SetCharField :pointer)
  (SetShortField :pointer)
  (SetIntField :pointer)
  (SetLongField :pointer)
  (SetFloatField :pointer)
  (SetDoubleField :pointer)
  (GetStaticMethodID :pointer)
  (CallStaticObjectMethod :pointer)
  (CallStaticObjectMethodV :pointer)
  (CallStaticObjectMethodA :pointer)
  (CallStaticBooleanMethod :pointer)
  (CallStaticBooleanMethodV :pointer)
  (CallStaticBooleanMethodA :pointer)
  (CallStaticByteMethod :pointer)
  (CallStaticByteMethodV :pointer)
  (CallStaticByteMethodA :pointer)
  (CallStaticCharMethod :pointer)
  (CallStaticCharMethodV :pointer)
  (CallStaticCharMethodA :pointer)
  (CallStaticShortMethod :pointer)
  (CallStaticShortMethodV :pointer)
  (CallStaticShortMethodA :pointer)
  (CallStaticIntMethod :pointer)
  (CallStaticIntMethodV :pointer)
  (CallStaticIntMethodA :pointer)
  (CallStaticLongMethod :pointer)
  (CallStaticLongMethodV :pointer)
  (CallStaticLongMethodA :pointer)
  (CallStaticFloatMethod :pointer)
  (CallStaticFloatMethodV :pointer)
  (CallStaticFloatMethodA :pointer)
  (CallStaticDoubleMethod :pointer)
  (CallStaticDoubleMethodV :pointer)
  (CallStaticDoubleMethodA :pointer)
  (CallStaticVoidMethod :pointer)
  (CallStaticVoidMethodV :pointer)
  (CallStaticVoidMethodA :pointer)
  (GetStaticFieldID :pointer)
  (GetStaticObjectField :pointer)
  (GetStaticBooleanField :pointer)
  (GetStaticByteField :pointer)
  (GetStaticCharField :pointer)
  (GetStaticShortField :pointer)
  (GetStaticIntField :pointer)
  (GetStaticLongField :pointer)
  (GetStaticFloatField :pointer)
  (GetStaticDoubleField :pointer)
  (SetStaticObjectField :pointer)
  (SetStaticBooleanField :pointer)
  (SetStaticByteField :pointer)
  (SetStaticCharField :pointer)
  (SetStaticShortField :pointer)
  (SetStaticIntField :pointer)
  (SetStaticLongField :pointer)
  (SetStaticFloatField :pointer)
  (SetStaticDoubleField :pointer)
  (NewString :pointer)
  (GetStringLength :pointer)
  (GetStringChars :pointer)
  (ReleaseStringChars :pointer)
  (NewStringUTF :pointer)
  (GetStringUTFLength :pointer)
  (GetStringUTFChars :pointer)
  (ReleaseStringUTFChars :pointer)
  (GetArrayLength :pointer)
  (NewObjectArray :pointer)
  (GetObjectArrayElement :pointer)
  (SetObjectArrayElement :pointer)
  (NewBooleanArray :pointer)
  (NewByteArray :pointer)
  (NewCharArray :pointer)
  (NewShortArray :pointer)
  (NewIntArray :pointer)
  (NewLongArray :pointer)
  (NewFloatArray :pointer)
  (NewDoubleArray :pointer)
  (GetBooleanArrayElements :pointer)
  (GetByteArrayElements :pointer)
  (GetCharArrayElements :pointer)
  (GetShortArrayElements :pointer)
  (GetIntArrayElements :pointer)
  (GetLongArrayElements :pointer)
  (GetFloatArrayElements :pointer)
  (GetDoubleArrayElements :pointer)
  (ReleaseBooleanArrayElements :pointer)
  (ReleaseByteArrayElements :pointer)
  (ReleaseCharArrayElements :pointer)
  (ReleaseShortArrayElements :pointer)
  (ReleaseIntArrayElements :pointer)
  (ReleaseLongArrayElements :pointer)
  (ReleaseFloatArrayElements :pointer)
  (ReleaseDoubleArrayElements :pointer)
  (GetBooleanArrayRegion :pointer)
  (GetByteArrayRegion :pointer)
  (GetCharArrayRegion :pointer)
  (GetShortArrayRegion :pointer)
  (GetIntArrayRegion :pointer)
  (GetLongArrayRegion :pointer)
  (GetFloatArrayRegion :pointer)
  (GetDoubleArrayRegion :pointer)
  (SetBooleanArrayRegion :pointer)
  (SetByteArrayRegion :pointer)
  (SetCharArrayRegion :pointer)
  (SetShortArrayRegion :pointer)
  (SetIntArrayRegion :pointer)
  (SetLongArrayRegion :pointer)
  (SetFloatArrayRegion :pointer)
  (SetDoubleArrayRegion :pointer)
  (RegisterNatives :pointer)
  (UnregisterNatives :pointer)
  (MonitorEnter :pointer)
  (MonitorExit :pointer)
  (GetJavaVM :pointer)
  (GetStringRegion :pointer)
  (GetStringUTFRegion :pointer)
  (GetPrimitiveArrayCritical :pointer)
  (ReleasePrimitiveArrayCritical :pointer)
  (GetStringCritical :pointer)
  (ReleaseStringCritical :pointer)
  (NewWeakGlobalRef :pointer)
  (DeleteWeakGlobalRef :pointer)
  (ExceptionCheck :pointer)
  (NewDirectByteBuffer :pointer)
  (GetDirectBufferAddress :pointer)
  (GetDirectBufferCapacity :pointer)
  (GetObjectRefType :pointer))

(cffi:defcstruct jni-invoke-interface
  (reserved0 :pointer)
  (reserved1 :pointer)
  (reserved2 :pointer)

  (DestroyJavaVM :pointer)
  (AttachCurrentThread :pointer)
  (DetachCurrentThread :pointer)
  (GetEnv :pointer)
  (AttachCurrentThreadAsDaemon :pointer))

(defmacro def-jni-method (method &rest args)
  (let* ((fname (loop for c across method
		      for res = (list (char-downcase c))
			then (append res (if (and (upper-case-p c)
						  (not upcase-prev-p))
					     (list #\- (char-downcase c))
					     (list c)))
		      for upcase-prev-p = (upper-case-p c)
		      finally (return (intern
				       (string-upcase
					(format nil "jni/~a" (coerce res 'string)))))))

	 (mname       (intern
		       (string-upcase method)))
	 (varargs-p   (eq (car (last args)) :varargs))
	 (args        (if varargs-p
			  (butlast args)
			  args)))
    (if varargs-p
	(let* ((lambda-list (mapcar #'car (cdr args)))
	       (call-args   (mapcan (lambda (l)
				      (list (cadr l) (car l)))
				    (cdr args)))
	       (ret-type    (car args)))
	  `(defmacro ,fname (env ,@lambda-list &rest args)
	     `(cffi:foreign-funcall-pointer
	       (cffi:foreign-slot-value (cffi:mem-ref
					 (cffi:mem-ref ,env :pointer)
					 :pointer)
					'(:struct jni-native-interface)
					',',mname)
	       ()
	       :pointer (cffi:mem-ref ,env :pointer)
	       ,@(list ,@call-args)
	       ,@(mapcan (lambda (arg)
			   (if (and (listp arg) (member (car arg) '(:int :string)))
			       arg
	       		       (list :pointer arg)))
	       		 args)
	       ,,ret-type)))
	(let ((lambda-list (cons 'env (mapcar #'car (cdr args))))
	      (call-args   (mapcan (lambda (l)
				     (list (cadr l) (car l)))
				   (cons '((cffi:mem-ref env :pointer) :pointer)
					 (cdr args))))
	      (ret-type    (car args)))
	  `(defun ,fname ,lambda-list
	     (cffi:foreign-funcall-pointer
	      (cffi:foreign-slot-value (cffi:mem-ref
					(cffi:mem-ref env :pointer)
					:pointer)
				       '(:struct jni-native-interface)
				       ',mname)
	      ()
	      ,@call-args
	      ,ret-type))))))

;; Must do all logic in the attached thread.
(def-jni-method "GetVersion" :int)
(def-jni-method "ExceptionOccurred" :pointer)
(def-jni-method "ExceptionDescribe" :void)
(def-jni-method "ExceptionClear" :void)

(def-jni-method "FindClass" :pointer
  (name :string))
(def-jni-method "GetMethodID" :pointer
  (class :pointer)
  (name :string)
  (sig :string))
(def-jni-method "GetStaticMethodID" :pointer
  (class :pointer)
  (name :string)
  (sig :string))
(def-jni-method "CallStaticObjectMethod" :pointer
  (class :pointer)
  (method-id :pointer)
  :varargs)
(def-jni-method "CallObjectMethod" :pointer
  (object :pointer)
  (method-id :pointer)
  :varargs)
(def-jni-method "CallVoidMethod" :void
  (object :pointer)
  (method-id :pointer)
  :varargs)
(def-jni-method "GetObjectClass" :pointer
  (object :pointer))
(def-jni-method "GetStringUTFChars" :string
  (string :pointer)
  (copy-p :pointer))
(def-jni-method "NewStringUTF" :pointer
  (string :string))
(def-jni-method "GetFieldID" :pointer
  (class :pointer)
  (name :string)
  (sig :string))
(def-jni-method "GetStaticFieldID" :pointer
  (class :pointer)
  (name :string)
  (sig :string))
(def-jni-method "GetStaticIntField" :int
  (class :pointer)
  (field-id :pointer))
(def-jni-method "GetStaticObjectField" :pointer
  (class :pointer)
  (field-id :pointer))
(def-jni-method "NewObject" :pointer
  (class :pointer)
  (method-id :pointer)
  :varargs)

(defun class-loader/find-class (env name)
  (cffi:foreign-funcall-pointer
   *find-class-ptr*
   () 
   :pointer (cffi:mem-ref env :pointer)
   :string name
   :pointer))

(defparameter *log-exceptions* t)

(defun exception-clear (env)
  (let ((ex (jni/exception-occurred env)))
    (when *log-exceptions*
      (jni/exception-describe env))
    (jni/exception-clear env)
    (unless (cffi:null-pointer-p ex)
      ex)))

(defmacro with-attached-thread ((env-var) &body body)
  (let ((env  (gensym "env"))
	(args (gensym "args"))
	(res  (gensym "res"))
	(ex   (gensym "ex")))
    `(cffi:with-foreign-object (,env :pointer)
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
		(,ex      (exception-clear ,env)))

	   (cffi:foreign-funcall-pointer
	    (cffi:foreign-slot-value (cffi:mem-ref *jvm* :pointer)
				     '(:struct jni-invoke-interface)
				     'DetachCurrentThread)
	    () 
	    :pointer *jvm*
	    :int)

	   (values ,res ,ex))))))

(defmacro with-env ((env-var) &body body)
  (let ((env  (gensym "env"))
	(args (gensym "args")))
    `(cffi:with-foreign-object (,env :pointer)
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

	 (let ((,env-var ,env))
	   ,@body)))))

;; Maybe I can cache found methods for improve performance.
(defun android/get-context (env)
  (let* ((activity-thread (jni/find-class env "android/app/ActivityThread"))
	 (x (print activity-thread))
	 (current-activity-thread (jni/get-static-method-id
				   env
				   activity-thread
				   "currentActivityThread"
				   "()Landroid/app/ActivityThread;"))
	 (y (print current-activity-thread))
	 (at (jni/call-static-object-method env
					    activity-thread
					    current-activity-thread))
	 (z (print at))

	 (get-application (jni/get-method-id env
					     activity-thread
					     "getApplication"
					     "()Landroid/app/Application;"))
	 (w (print get-application))
	 (context (jni/call-object-method env at get-application))

	 (object (jni/find-class env "java/lang/Object"))
	 (to-string (jni/get-method-id env
				       object
				       "toString"
				       "()Ljava/lang/String;"))
	 (string (jni/call-object-method env context to-string)))
    (print (jni/get-string-utfchars env string (cffi:null-pointer)))))

(defun get-hello-ecl-activity-class (env)
  (class-loader/find-class env "com/example/ecl_android_test/HelloEclActivity"))

(defun get-hello-ecl-activity (env class)
  (let* ((method (jni/get-static-method-id
		  env
		  class
		  "getInstance"
		  "()Lcom/example/ecl_android_test/HelloEclActivity;")))
    (jni/call-static-object-method env class method)))

(defun get-activity-class (env)
  (class-loader/find-class env "ru/betelgeuse/dunpixpar/JNIActivity"))

(defun get-activity (env class)
  (let* ((method (jni/get-static-method-id
		  env
		  class
		  "getInstance"
		  "()Lru/betelgeuse/dunpixpar/JNIActivity;")))
    (jni/call-static-object-method env class method)))

(defun jni/get-asset-manager (env)
  (let* ((class (get-activity-class env))
	 (field (jni/get-static-field-id env
					 class
					 "sAssetManager"
					 "Landroid/content/res/AssetManager;")))
    (print (list field class))
    (jni/get-static-object-field env class field)))

(defun get-id (env id)
  (let* ((class (class-loader/find-class env "com/example/ecl_android_test/R$id"))
	 (field (jni/get-static-field-id env class id "I")))
    (jni/get-static-int-field env class field)))

(defun find-view-by-id (env class activity id)
  (let ((method (jni/get-method-id
		 env
		 class
		 "findViewById"
		 "(I)Landroid/view/View;")))
    (jni/call-object-method env activity method (:int (get-id env id)))))

(defun text-view/set-text (env view text)
  (let* ((class (jni/find-class env "android/widget/TextView"))
	 (method (jni/get-method-id env class "setText" "(Ljava/lang/CharSequence;)V")))
    (jni/call-void-method env view method (jni/new-string-utf env text))))

(defun make-callback (env method-id)
  (let* ((class (class-loader/find-class env "com/example/ecl_android_test/NativeRunnable"))
	 (ctor (jni/get-method-id env class "<init>" "(I)V")))
    (jni/new-object env class ctor (:int method-id))))

(defun native/run-method (method-id)
  (print "run native/run-method")
  (print method-id)
  (with-env (env)
    (let* ((class (get-hello-ecl-activity-class env))
	   (activity (get-hello-ecl-activity env class))
	   (text-view (find-view-by-id env class activity "sample_text")))
      (text-view/set-text env text-view "Hello from ECL")))
  (print "native/run-method finished"))
