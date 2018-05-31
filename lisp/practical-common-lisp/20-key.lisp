; The &key in the beginning makes the parameter list keyword parameters.
(defun foo (&key a b c)
  (list a b c))

(defun bar (&key a b c)
  (format t "a: ~a; b: ~a; c: ~a~%" a b c))

(format t "~a~%" (foo :a 1 :b 2 :c 3))
(format t "~a~%" (foo :a 1 :b 2))
(format t "~a~%" (foo :a 1 :c 2))
(format t "~a~%" (foo :a 1 :b nil :c 2))
(format t "~a~%" (foo))

; Unknown &KEY argument: :D
; (format t "~a~%" (foo :d 4))

(bar :a 1 :b 2 :c 3)
(bar :a 1 :b 2)
(bar :a 1 :c 2)
(bar :a 1 :b nil :c 2)
(bar)

(format t "~%")

; c-p and d-p are called supplied-p parameters. A supplied-p parameter
; is set to true if an argument is actually passed for the corresponding
; keyword parameter (even if the argument passed matches the
; default value), otherwise it is set to nil.
(defun foo (&key a (b "default-b") (c "default-c" c-p) (d nil d-p))
  (format t "a: ~a~%" a)
  (format t "b: ~a~%" b)
  (format t "c: ~a; c-p: ~a~%" c c-p)
  (format t "d: ~a; d-p: ~a~%" d d-p)
  (format t "---~%"))

(foo :a 1)
(foo :a 1 :b 2)
(foo :a 1 :b 2 :c 3)
(foo :a 1 :b 2 :c 3 :d 4)

(format t "~%")

(foo)
(foo :c "default-c") ; c-p is set to T because we are specifying a value for c.
(foo :d nil)         ; d-p is set to T because we are specifying a value for d.
