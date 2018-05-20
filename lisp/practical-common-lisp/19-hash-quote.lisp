; A regular function.
(defun f (x)
  (format t "f: x: ~a~%" x))

(f 10)
(f #'f)

; (f f) ; The variable F is unbound.

; A higher order function
(defun invoker (fn arg1)
  (funcall fn arg1))

; Call the higher order function with a function and a string.
(invoker #'f "baz")

; Instead of a named function, pass a lambda (anonymous function) this time.
(invoker #'(lambda (x)
             (format t "lambda: x: ~a~%" x)) 20)

(defun g (x)
  (format t "g: x: ~a~%" x)

  ; An inner function has access to the outer scope, e.g., h can make
  ; use of x when it is called later by the invoker function.
  (defun h (y)
    (format t "g: x + y: ~a~%" (+ x y)))
  (invoker #'h 30) 

  ; Similarly, a lambda has access to variables of the outer scope.
  (invoker #'(lambda (z)
               (format t "lambda: x + z: ~a~%" (+ x z))) 30)
  )

(g 40)

; The inner function h seems to be available globally.
(h 100)
