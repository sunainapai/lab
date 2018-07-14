; eq
(defvar *a* 3)
(defvar *b* 3)
(format t "(eq *a* *b*): ~a~%" (eq *a* *b*))

(defvar *c* 3)
(defvar *d* (+ 1 2))
(format t "(eq *c* *d*): ~a~%" (eq *c* *d*))

(format t "(eq 1 1): ~a~%" (eq 2 2))
(format t "(eq 1 1.0): ~a~%" (eq 1 1.0))
(format t "(eq \"foo\" \"foo\"): ~a~%" (eq "foo" "foo"))
(format t "(eq (list 1 2) (list 1 2)): ~a~%" (eq (list 1 2) (list 1 2)))
(format t "(eq '(1 2) '(1 2)): ~a~%" (eq '(1 2) '(1 2)))
(format t "(eq nil ()): ~a~%" (eq nil ()))
(format t "~%")

; eql
(format t "(eql 1 1): ~a~%" (eql 1 1))
(format t "(eql 1 1.0): ~a~%" (eql 1 1.0))

(format t "(eql \"foo\" \"foo\"): ~a~%" (eql "foo" "foo"))
(format t "(eql \"foo\" \"FoO\"): ~a~%" (eql "foo" "FoO"))
(format t "(eql (list 1 2) (list 1 2)): ~a~%" (eql (list 1 2) (list 1 2)))
(format t "(eql '(1 2) '(1 2)): ~a~%" (eql '(1 2) '(1 2)))
(format t "(eql nil ()): ~a~%" (eql nil ()))
(format t "~%")

; equal
(format t "(equal 1 1): ~a~%" (equal 1 1))
(format t "(equal 1 1.0): ~a~%" (equal 1 1.0))
(format t "(equal \"foo\" \"foo\"): ~a~%" (equal "foo" "foo"))
(format t "(equal \"foo\" \"FoO\"): ~a~%" (equal "foo" "FoO"))
(format t "(equal (list 1 2) (list 1 2)): ~a~%" (equal (list 1 2) (list 1 2)))
(format t "(equal '(1 2) '(1 2)): ~a~%" (equal '(1 2) '(1 2)))
(format t "(equal nil ()): ~a~%" (equal nil ()))
(format t "~%")

; equalp
(format t "(equalp 1 1): ~a~%" (equalp 1 1))
(format t "(equalp 1 1.0): ~a~%" (equalp 1 1.0))
(format t "(equalp \"foo\" \"foo\"): ~a~%" (equalp "foo" "foo"))
(format t "(equalp \"foo\" \"FoO\"): ~a~%" (equalp "foo" "FoO"))
(format t "(equalp (list 1 2) (list 1.0 2)): ~a~%" (equalp (list 1 2) (list 1.0 2)))
(format t "(equalp '(1 2) '(1 2)): ~a~%" (equalp '(1 2) '(1 2)))
(format t "(equalp nil ()): ~a~%" (equalp nil ()))
(format t "~%")
