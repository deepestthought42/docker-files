(defvar *dist-url* "http://beta.quicklisp.org/dist/quicklisp/2016-04-21/distinfo.txt")

(load "quicklisp.lisp")




(let ((home (ccl:getenv "HOME")))
  (quicklisp-quickstart:install :path (format nil "~a/quicklisp/" home)
				:dist-url *dist-url*))


(ql:quickload :swank)

