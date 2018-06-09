(defmacro backwards (expr) (reverse expr))
(backwards ("foo~%" t format))

(defun fbackwards (expr) (reverse expr))

; 3: (ERROR SB-INT:COMPILED-PROGRAM-ERROR
; :MESSAGE "illegal function ; call" :SOURCE "(\"foo~%\" T FORMAT)")
;
; (fbackwards ("foo~%" t format))

(format t "~a~%" (fbackwards '("foo~%" t format)))

(defmacro calc (a op b) (funcall op a b))
(format t "~a~%" (calc 1 + 2))
