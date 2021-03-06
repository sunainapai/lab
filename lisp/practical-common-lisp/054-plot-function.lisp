(defun plot (fn min max step)
  (loop for i from min to max by step do
        (loop repeat (funcall fn i) do
              (format t "*"))
        (format t "~%")))

(plot #'exp 0 4 1/2)
(format t "~%")

(plot #'log 10 150 10)
(format t "~%")
