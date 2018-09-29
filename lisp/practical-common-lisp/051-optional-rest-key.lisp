(defun f (a &optional b c &key d e)
  (format t "a: ~a; b: ~a; c: ~a; d: ~a; e: ~a~%" a b c d e))

; Combining &key with either &optional or &rest leads to surprising
; results.

(f 1) ; a: 1; b: NIL; c: NIL; d: NIL; e: NIL
(f 1 2) ; a: 1; b: 2; c: NIL; d: NIL; e: NIL
(f 1 2 3) ; a: 1; b: 2; c: 3; d: NIL; e: NIL
(f 1 2 3 :d 4) ; a: 1; b: 2; c: 3; d: 4; e: NIL

; surprise: b eats :d, c eats 4
(f 1 :d 4) ; a: 1; b: D; c: 4; d: NIL; e: NIL

; surprise: c eats :d, odd number of arguments remain for keyword
; parameters.
;
; odd number of &KEY arguments
; (f 1 2 :d 4)


(format t "~%")

; all the remaining values, which include the keywords themselves, are
; gathered into a list that's bound to the &rest parameter, and the
; appropriate values are also bound to the &key parameters.

(defun g (a &optional b c &rest d &key e f)
  (format t "a: ~a; b: ~a; c: ~a; d: ~a; e: ~a; f: ~a~%" a b c d e f))

(g 1) ; a: 1; b: NIL; c: NIL; d: NIL; e: NIL; f: NIL
(g 1 2 3 :e 10 :f 20) ; a: 1; b: 2; c: 3; d: (E 10 F 20); e: 10; f: 20
