(defun f (&rest args)
  (format t "args: ~a~%" args))

(f 10 20 30)

; expected lambda list keyword at A in: (&REST ARGS A)
;
; (defun g (&rest args a)
;   (format t "args: ~a; a: ~a~%" args a))

(defun h (a b &rest args)
  (format t "a: ~a; b: ~a; args: ~a~%" a b args))

(h 10 20 30 40 50)
