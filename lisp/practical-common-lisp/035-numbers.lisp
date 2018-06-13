; Simple
(format t "~a~%" 1) ; 1
(format t "~a~%" 123) ; 123
(format t "~a~%" 1 + 23) ; 24
(format t "~%")

; Floating-point
(format t "~a~%" 1.0) ; 1.0
(format t "~a~%" (+ 1.0 2.0)) ; 3.0
(format t "~a~%" (+ 1 0.5)) ; 1.5
(format t "~a~%" (+ 2 3.0)) ; 5.0
(format t "~a~%" (equal 2 2.0)) ; NIL
(format t "~a~%" (equal 2 2)) ; T
(format t "~%")

; Exponent marker
(format t "~a~%" 1e0) ; 1.0
(format t "~a~%" 1e2) ; 100.0
(format t "~a~%" 2.3e3) ; 2300.0
(format t "~a~%" 2.3e-3) ; 0.0023
(format t "~a~%" 2.3e8) ; 2.3e8
(format t "~a~%" (+ 1 2.3e3)) ; 2301.0
(format t "~a~%" (equal 1 1e0)) ; NIL
(format t "~a~%" (equal 1.0 1e0)) ; T
(format t "~a~%" (equal 0.0023 2.3e-3)) ; T
(format t "~a~%" (equal 0.000000023 2.3e-8)) ; T
(format t "~%")

; Double-precision
(format t "~a~%" 1d0) ; 1.0d0
(format t "~a~%" 1.23d2) ; 123.0d0
(format t "~a~%" 1.23d8) ; 1.23d8
(format t "~a~%" (+ 1 1.23d8)) ; 1.23000001d8
(format t "~a~%" (equal 1 1d0)) ; NIL
(format t "~a~%" (equal 1.23 1.23d0)) ; NIL
(format t "~a~%" (equal 1.23e0 1.23d0)) ; NIL
(format t "~a~%" (equal 0.123d1 1.23d0)) ; T
(format t "~%")

; Ratio
(format t "~a~%" 1/4) ; 1/4
(format t "~a~%" (+ 1/2 1/3)) ; 5/6
(format t "~a~%" (+ 1 1/2)) ; 3/2
(format t "~a~%" (equal 1/4 0.25)) ; NIL
(format t "~a~%" (equal 1/4 2/8)) ; T
(format t "~a~%" (equal 1 2/2)) ; T
(format t "~a~%" (equal 3 6/2)) ; T
(format t "~%")

; All rationals--integers and ratios--are represented internally in
; "simplified" form.
