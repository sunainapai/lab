(defun f (x a b)
  (format t "~a ~a ~a~%" x a b))

(f t (format t "part1~%") (format t "part2~%"))
(format t "---~%")
(if t (format t "part1~%") (format t "part2~%"))
(format t "---~%~%")

(format t "~a~%" (if t 10 20))   ; 10
(format t "~a~%" (if nil 10 20)) ; 20
(format t "~a~%" (if t 30))      ; 30
(format t "~a~%" (if nil 40))    ; 40
(format t "~%")

(format t "~a~%" (quote (+ 1 2)))
(format t "~a~%" '(+ 1 2))
(format t "~%")

(format t "~a~%" (let ((x 10)) (+ x x)))
(format t "~a~%" (let ((x 10) (y 20)) (+ x y)))

; x and y are undefined outside the let expression.

; The variable X is unbound.
; (format t "~a~%" x)

; The variable Y is unbound.
; (format t "~a~%" y)
