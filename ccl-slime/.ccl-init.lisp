
;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))


(ql:quickload :swank)
(ql:quickload :cl-fad)

(let ((port (ccl:getenv "SLIME_PORT")))
  (swank:create-server :port (if port (parse-integer port) 4005)
		       :dont-close t))

(setf swank:*use-dedicated-output-stream* nil)

(let ((ql-source-dir (ccl:getenv "QL_SOURCE_DIRS")))
  (if ql-source-dir
      (mapcar #'(lambda (source-dir)
		  (cl-fad:walk-directory (first (directory source-dir))
					 #'(lambda (dir)
					     (if (not (position #\. (directory-namestring dir)))
						 (push dir asdf:*central-registry*))) 
					 :test #'cl-fad:directory-pathname-p))
	      (uiop/utility:split-string  ql-source-dir :separator ":"))))


