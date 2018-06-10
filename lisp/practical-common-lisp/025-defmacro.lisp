(defmacro backwards (expr) (reverse expr))
(backwards ("foo~%" t format))

(defun fbackwards (expr) (reverse expr))

; 3: (ERROR SB-INT:COMPILED-PROGRAM-ERROR
; :MESSAGE "illegal function ; call" :SOURCE "(\"foo~%\" T FORMAT)")
;
; (fbackwards ("foo~%" t format))

(format t "~a~%" (fbackwards '("foo~%" t format)))

(defmacro infix (a op b) (list op a b))
(format t "~a~%" (infix 1 + 2))
