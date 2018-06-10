; Compile-time arithmetic
(defmacro calc (a op b)
  (funcall op a b))

; Compile-time in-fix to pre-fix
(defmacro infix (a op b)
  (list op a b))

; Both macros produce similar result but they work differently.
(format t "~a~%" (calc 1 + 2))  ; (calc 1 + 2) => 3
(format t "~a~%" (infix 1 + 2)) ; (infix 1 + 2) => (+ 1 2)
(format t "~%")

; We cannot see what the macro expands to with plain format calls.
(format t "~a~%" '(calc 1 + 2))
(format t "~a~%" '(infix 1 + 2))
(format t "~%")

; We can see the expanded macros by combining macroexpand-1 and quote.
(format t "~a~%" (macroexpand-1 '(calc 1 + 2)))
(format t "~a~%" (macroexpand-1 '(infix 1 + 2)))
(format t "~%")

; macroexpand calls macroexpand-1 repeatedly until there is no macro.
(format t "~a~%" (macroexpand '(calc 1 + 2)))
(format t "~a~%" (macroexpand '(infix 1 + 2)))
