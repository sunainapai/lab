(format t "~a~%" call-arguments-limit)

; 4611686018427387903 with SBCL 1.4.6
; 4096 with GNU CLISP 2.49

; This number is implementation dependent but guaranteed to be at least
; 50. And in current implementations it ranges from 4,096 to
; 536,870,911.
