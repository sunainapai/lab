(defun f (a b &optional c d &rest e)
  (format t "a: ~a; b: ~a; c: ~a; d: ~a; e: ~a~%" a b c d e))

(f 1 2) ; a: 1; b: 2; c: NIL; d: NIL; e: NIL
(f 1 2 3) ; a: 1; b: 2; c: 3; d: NIL; e: NIL
(f 1 2 3 4 5) ; a: 1; b: 2; c: 3; d: 4; e: (5)
(f 1 2 3 4 5 6 7) ; a: 1; b: 2; c: 3; d: 4; e: (5 6 7)

; misplaced &OPTIONAL in lambda list: (A B &REST C &OPTIONAL D E)
; (defun g (a b &rest c &optional d e) ())
