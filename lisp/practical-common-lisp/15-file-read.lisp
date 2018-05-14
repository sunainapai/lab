; The 'in' in the code below is the name of the variable that will hold
; the file stream.
(with-open-file (in "foo.db")
  (with-standard-io-syntax
    (format t "~a~%" (read in))
    (format t "~a~%" (read in))))
