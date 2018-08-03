(defun f ()
  "Documentation string of function f."
  (format t "hello world~%"))

(f)
(format t "~a~%" (documentation 'f 'function))
(format t "~a~%" (documentation #'f 'function))
