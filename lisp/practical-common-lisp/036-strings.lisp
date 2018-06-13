(format t "foo~%") ; foo
(format t "fo\o~%") ; foo
(format t "fo\\~%") ; fo\
(format t "fo\"~%") ; fo"
(format t "fo\n~%") ; fon
(format t "\f\o\o~%") ; foo

; The only two characters that must be escaped within a string are
; double quotes and the backslash itself.
