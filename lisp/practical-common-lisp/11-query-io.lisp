(format *query-io* "Enter a string: ")
(force-output *query-io*)
(format t "You entered: ~a~%" (read-line *query-io*))
