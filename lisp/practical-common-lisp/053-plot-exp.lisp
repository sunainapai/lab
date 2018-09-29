(defun plot (min max step)
  (loop for x from min to max by step do
        (loop repeat (exp x) do
              (format t "*"))
        (format t "~%")))

(plot 0 4 1/2)
