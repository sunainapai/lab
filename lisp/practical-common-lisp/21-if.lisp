(if t (format t "true~%") (format t "false~%"))
(if nil (format t "true~%") (format t "false~%"))

(defvar *a* "hello")
(if (equal *a* "hello") (format t "true~%") (format t "false~%"))
(if (equal *a* "world") (format t "true~%") (format t "false~%"))
(if (not (equal *a* "hello")) (format t "true~%") (format t "false~%"))
(if (not (equal *a* "world")) (format t "true~%") (format t "false~%"))
