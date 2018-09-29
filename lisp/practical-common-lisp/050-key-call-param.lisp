(defun f (&key a (b a) (c (+ a b)))
  (format t "a: ~a; b: ~a; c: ~a~%" a b c))

(f :a 10) ; a: 10; b: 10; c: 20

; Keyword used by caller is different from the name of the actual
; parameter. For example, caller calls with :box, but the actual
; parameter is b.
(defun g (&key a ((:box b) a)  ((:cat c) (+ a b) c-supplied-p))
  (format t "a: ~a; b: ~a; c: ~a; c-supplied-p: ~a~%" a b c c-supplied-p))

; Unknown &KEY argument: :B
; (g :a 10 :b 20)

(g :a 10 :box 20) ; a: 10; b: 20; c: 30; c-supplied-p: NIL
(g :a 10 :box 20 :cat 100) ; a: 10; b: 20; c: 100; c-supplied-p: T
