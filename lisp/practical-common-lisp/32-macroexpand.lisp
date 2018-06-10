(defmacro backwards (&rest expr)
  (reverse expr))

(defmacro infix (a op b)
  (list op a b))

(defmacro addval (a b)
  (infix a + b))

(defmacro addexpr (a b)
  `(infix ,a + ,b))

(format t "~a~%" (backwards 1 + 2 infix))
(format t "~a~%" (macroexpand-1 '(backwards 1 + 2 infix)))
(format t "~a~%" (macroexpand '(backwards 1 + 2 infix)))
(format t "~%")
; (backwards 1 + 2 infix) => (infix 2 + 1) => (+ 2 1)

(format t "~a~%" (backwards 3 4 addval))
(format t "~a~%" (macroexpand-1 '(backwards 3 4 addval)))
(format t "~a~%" (macroexpand '(backwards 3 4 addval)))
(format t "~%")
; (backwards 3 4 addval) => (addval 4 3) => 7

(format t "~a~%" (backwards 5 6 addexpr))
(format t "~a~%" (macroexpand-1 '(backwards 5 6 addexpr)))
(format t "~a~%" (macroexpand '(backwards 5 6 addexpr)))
; (backwards 5 6 addexpr) => (addexpr 6 5) => (infix 6 5) => (+ 6 5)
