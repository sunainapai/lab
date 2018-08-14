(defun avg (&rest args)
  (if (equal (list-length args) 0)
      (return-from avg 0))
  (let ((sum 0))
      (loop for item in args
            do (setf sum (+ sum item)))
      (/ sum (list-length args))))

(format t "~a~%" (avg 1 2 3 4 5)) 
(format t "~a~%" (avg 1 2 5))
(format t "~a~%" (avg))
