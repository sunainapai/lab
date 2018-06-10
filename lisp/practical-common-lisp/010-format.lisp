(format t "~a ~a ~a ~a~%" :foo 10 :bar "twenty")
(format t "~{~a: ~a~%~}" (list :foo 10 :bar "twenty"))

(defvar a (format nil "foo"))
(format t "a: ~a~%" a)
(format t "~%")

(format t "~a~10t~a~%~a~10t~a~%" "foo" "bar" "12345678" "bar")
(format t "~a~10t~a~%~a~10t~a~%" "123456789" "bar" "1234567890" "bar")
(format t "~a~10t~a~%~a~10t~a~%" "12345678901" "bar" "123456789012" "bar")
(format t "~%")

(format t "12,345,678,901,234,567,890: ~r~%" 12345678901234567890)
