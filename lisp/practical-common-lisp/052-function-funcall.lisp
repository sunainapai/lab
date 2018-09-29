(defun add (a b)
  (+ a b))

; Using FUNCTION special operator
(format t "(function add): ~a~%" (function add))
(format t "#'add: ~a~%" #'add)
(format t "(funcall (function add) 1 2): ~a~%" (funcall (function add) 1 2))
(format t "(funcall #'add 1 2): ~a~%" (funcall #'add 1 2))
(format t "~%")

; Using QUOTE special operator
(format t "(quote add): ~a~%" (quote add))
(format t "'add: ~a~%" 'add)
(format t "(funcall (quote add) 1 2): ~a~%" (funcall (quote add) 1 2))
(format t "(funcall 'add 1 2): ~a~%" (funcall 'add 1 2))
(format t "~%")
