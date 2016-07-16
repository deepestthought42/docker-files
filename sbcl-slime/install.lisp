;;; install slynk packages needed

(defvar *dist-url* "http://beta.quicklisp.org/dist/quicklisp/2016-04-21/distinfo.txt")

(load "quicklisp.lisp")

(quicklisp-quickstart:install :path "~/lisp/quicklisp/" :dist-url *dist-url*)



(ql:quickload :swank)
