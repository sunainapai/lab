(format t "~a~%" (getf (list :a 1 :b 2 :c 3) :b))
(format t "~a~%" (getf (list :a 1 :b 2 :c 3 :b 4) :b))
(format t "~a~%" (getf (list :a 1 :b 2 :c 3) :d))
