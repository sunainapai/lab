(defvar *a* nil)
(push 10 *a*)
(push 20 *a*)
(push 30 *a*)
(format t "~a~%" (loop while *a*
                   collecting (pop *a*)))
