(format t "~a~%" (parse-integer "12"))

; Unhandled SB-INT:SIMPLE-PARSE-ERROR in thread #<SB-THREAD:THREAD "main
; thread" RUNNING {10005605B3}>: junk in string "12a"
;
; (format t "~a~%" (parse-integer "12a"))

(format t "~a~%" (parse-integer "12a" :junk-allowed t))
(format t "~a~%" (parse-integer "a12b" :junk-allowed t))
(format t "~a~%" (or (parse-integer "a12b" :junk-allowed t) 0))
