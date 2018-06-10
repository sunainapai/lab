; Without splicing
(format t "~a~%" `(1 2 ,'(3 4) 5 6))
(format t "~a~%" `(1 2 ,(list 3 4) 5 6))

; With splicing
(format t "~a~%" `(1 2 ,@'(3 4) 5 6))
(format t "~a~%" `(1 2 ,@(list 3 4) 5 6))

(defun f (a b c)
  (format t "a: ~a; b: ~a; c: ~a; ~%" a b c))

; Without splicing
(f 10 20 30)

; With splicing
(eval `(f ,@(list 10 20 30)))

; With splicing
(defvar *L* (list 10 20 30))
(eval `(f ,@*L*))
