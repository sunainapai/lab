(defun infix-eval (a op b)
  (funcall op a b))

(format t "~a~%" (infix-eval 1 '+ 1))
(format t "~a~%" (infix-eval 2 #'+ 2))

; ("undefined function" 1 2)
; (format t "~a~%" (infix-eval 1 + 2))

(defun infix-expr (a op b)
  (list op a b))

(format t "expr: ~a~%" (infix-expr 3 '+ 3))
(format t "eval: ~a~%" (eval (infix-expr 4 '+ 4)))

(defun infix-expr2 (a op b)
  (list 'funcall op a b))

(format t "expr: ~a~%" (infix-expr2 5 #'+ 5))
(format t "eval: ~a~%" (eval (infix-expr2 6 #'+ 6)))
(format t "eval: ~a~%" (eval (list '+ 7 7)))
(format t "eval: ~a~%" (eval '(+ 8 8)))
