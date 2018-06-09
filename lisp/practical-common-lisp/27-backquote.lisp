(format t "~a~%" (list 1 2 3))
(format t "~a~%" '(1 2 3))
(format t "~a~%" `(1 2 3))
(format t "~%")

(format t "~a~%" (reverse (list (+ 1 1) (+ 2 2) (* 2 3))))
(format t "~a~%" (reverse '(2 4 6)))
(format t "~a~%" (reverse `(,(+ 1 1) ,(+ 2 2) ,(* 2 3))))
(format t "~%")

(format t "~a~%" '(reverse '(1 2 3)))
(format t "~a~%" (eval '(reverse '(1 2 3))))
(format t "~%")

(format t "~a~%" `(reverse '(,(+ 1 1) ,(+ 2 2) ,(* 2 3))))
(format t "~a~%" (eval `(reverse '(,(+ 1 1) ,(+ 2 2) ,(* 2 3)))))
(format t "~%")
