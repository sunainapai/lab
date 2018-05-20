; The 'out' in the code below is the name of the variable that will hold
; the file stream.
(defvar *db* (list (list "foo" 1 t) (list "bar" 2 t) "baz" 3))
(with-open-file (out "foo.db"
                 :direction :output
                 :if-exists :supersede)
  (with-standard-io-syntax
    (print *db* out)
    (print "hello" out)))
