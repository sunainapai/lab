; the value of the last expression is returned as the value of the
; function.
(defun f ()
  (+ 1 2)
  (+ 3 4))

(format t "~a~%" (f)) ; 7


; the RETURN-FROM special operator can be used to return immediately
; from anywhere in a function
(defun g ()
  (+ 1 2)
  (return-from g (+ 3 4))
  (+ 5 6))

(format t "~a~%" (g)) ; 7
