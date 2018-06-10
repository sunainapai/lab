(defvar *a* nil)
(setf *a* "hello, world~%")
(format t *a*)

(defvar *b* (list :a 1 :b 2 :c 3))
(format t "*b*: ~a~%" *b*)

(format t ":a of *b*: ~a~%" (getf *b* :a))
(setf (getf *b* :a) 4)
(format t "*b*: ~a~%" *b*)
