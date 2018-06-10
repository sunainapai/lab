; A regular function.
(defun f (x)
  (format t "f: x: ~a~%" x))

(f 10)
(f #'f) ; Pass function
(f 'f)  ; Pass function name
(format t "~%")

(f #'(lambda (x) x)) ; Pass lambda
(f '(lambda (x) x))  ; Pass lambda name
(f (lambda (x) x))   ; Also seems to pass lambda
(format t "~%")

; (f f) ; The variable F is unbound.

; A higher order function
(defun invoker (fn arg1)
  (funcall fn arg1))

; The value 10 is not of type (OR FUNCTION SYMBOL)
; (invoker 10 "foo")

; Call the higher order function with a function and a string.
(invoker #'f "bar") ; funcall can invoke a function
(invoker 'f "baz")  ; funcall can invoke a function by name too
(format t "~%")

; Instead of a named function, pass a lambda (anonymous function) this time.
(invoker #'(lambda (x)
             (format t "lambda: x: ~a~%" x)) 10)

; The value (LAMBDA (X) (FORMAT T "lambda: x: ~a~%" X)) is not of type
; (OR FUNCTION SYMBOL)
; (invoker '(lambda (x)
;             (format t "lambda: x: ~a~%" x)) 20)

(invoker (lambda (x)
           (format t "lambda: x: ~a~%" x)) 30)
(format t "~%")

(defun g (x)
  (format t "g: x: ~a~%" x)

  ; An inner function has access to the outer scope, e.g., h can make
  ; use of x when it is called later by the invoker function.
  (defun h (y)
    (format t "g: x + y: ~a~%" (+ x y)))

  (invoker #'h 30) 

  ; Similarly, a lambda has access to variables of the outer scope.
  (invoker #'(lambda (z)
               (format t "lambda: x + z: ~a~%" (+ x z))) 30))

(g 40)
(format t "~%")

(h 100) ; h is available in this scope.
(fmakunbound 'g)
(h 200) ; h is still available even if g isn't anymore.
