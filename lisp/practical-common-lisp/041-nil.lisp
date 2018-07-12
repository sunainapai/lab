; This example demonstrates the following behaviour:
; if the reader sees (), it reads it as the symbol NIL.
(defun f1 ()
  (format t "hi~%"))
(f1)

(defun f2 nil
  (format t "hi~%"))
(f2)

; (DEFUN F3 (QUOTE ()) (FORMAT T "hi~%"))
; caught ERROR:
;   NIL cannot be used as a local variable.
; (defun f3 'nil
;   (format t "hi~%"))

; (DEFUN F4 (QUOTE ()) (FORMAT T "hi~%"))
; caught ERROR:
;   NIL cannot be used as a local variable.
; (defun f4 '()
;   (format t "hi~%"))

(format t "~a~%" ())
(format t "~a~%" nil)
(format t "~a~%" 'nil)
(format t "~a~%" '())
