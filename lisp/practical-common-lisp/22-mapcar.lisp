(defun square (x)
  (* x x))

(format t "~a~%" (mapcar #'square (list 1 2 3 4 5)))
(format t "~a~%" (mapcar 'square (list 1 2 3 4 5)))
(format t "~a~%" (mapcar #'(lambda (x) (* x x)) (list 1 2 3 4 5)))
(format t "~a~%" (mapcar (lambda (x) (* x x)) (list 1 2 3 4 5)))

; (LAMBDA (X) (* X X)) fell through ETYPECASE expression. Wanted one of
; (FUNCTION SYMBOL).
;
; (format t "~a~%" (mapcar '(lambda (x) (* x x)) (list 1 2 3 4 5)))
