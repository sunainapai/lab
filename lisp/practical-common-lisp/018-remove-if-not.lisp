(format t "~a~%" (remove-if-not #'evenp '(1 2 3 4 5 6)))

(defun multiple-of-3 (x)
  (= 0 (mod x 3)))

(format t "~a~%" (remove-if-not #'multiple-of-3 '(1 2 3 4 5 6)))

(format t "~a~%" (remove-if-not #'(lambda (x) (= 0 (mod x 3))) '(1 2 3 4 5 6)))
