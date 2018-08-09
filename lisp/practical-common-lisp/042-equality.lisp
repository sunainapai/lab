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

; you should never use EQ to compare values that may be numbers or
; characters. It may seem to work in a predictable way for certain
; values in a particular implementation, but you have no guarantee that
; it will work the same way if you switch implementations.


; eql
(format t "(eql 1 1): ~a~%" (eql 1 1))
(format t "(eql 1 1.0): ~a~%" (eql 1 1.0))

(format t "(eql \"foo\" \"foo\"): ~a~%" (eql "foo" "foo"))
(format t "(eql \"foo\" \"FoO\"): ~a~%" (eql "foo" "FoO"))
(format t "(eql (list 1 2) (list 1 2)): ~a~%" (eql (list 1 2) (list 1 2)))
(format t "(eql '(1 2) '(1 2)): ~a~%" (eql '(1 2) '(1 2)))
(format t "(eql nil ()): ~a~%" (eql nil ()))
(format t "~%")

; Common Lisp defines EQL to behave like EQ except that it also is
; guaranteed to consider two objects of the same class representing the
; same numeric or character value to be equivalent.


; equal
(format t "(equal 1 1): ~a~%" (equal 1 1))
(format t "(equal 1 1.0): ~a~%" (equal 1 1.0))
(format t "(equal \"foo\" \"foo\"): ~a~%" (equal "foo" "foo"))
(format t "(equal \"foo\" \"FoO\"): ~a~%" (equal "foo" "FoO"))
(format t "(equal (list 1 2) (list 1 2)): ~a~%" (equal (list 1 2) (list 1 2)))
(format t "(equal '(1 2) '(1 2)): ~a~%" (equal '(1 2) '(1 2)))
(format t "(equal nil ()): ~a~%" (equal nil ()))
(format t "~%")

; EQUAL loosens the discrimination of EQL to consider lists equivalent
; if they have the same structure and contents, recursively, according
; to EQUAL. EQUAL also considers strings equivalent if they contain the
; same characters. It also defines a looser definition of equivalence
; than EQL for bit vectors and pathnames, ... For all other types, it
; falls back on EQL.


; equalp
(format t "(equalp 1 1): ~a~%" (equalp 1 1))
(format t "(equalp 1 1.0): ~a~%" (equalp 1 1.0))
(format t "(equalp \"foo\" \"foo\"): ~a~%" (equalp "foo" "foo"))
(format t "(equalp \"foo\" \"FoO\"): ~a~%" (equalp "foo" "FoO"))
(format t "(equalp (list 1 2) (list 1.0 2)): ~a~%" (equalp (list 1 2) (list 1.0 2)))
(format t "(equalp '(1 2) '(1 2)): ~a~%" (equalp '(1 2) '(1 2)))
(format t "(equalp nil ()): ~a~%" (equalp nil ()))
(format t "~%")

; EQUALP is similar to EQUAL except it's even less discriminating. It
; considers two strings equivalent if they contain the same characters,
; ignoring differences in case. It also considers two characters
; equivalent if they differ only in case. Numbers are equivalent under
; EQUALP if they represent the same mathematical value. ... Lists with
; EQUALP elements are EQUALP; likewise, arrays with EQUALP elements are
; EQUALP.
