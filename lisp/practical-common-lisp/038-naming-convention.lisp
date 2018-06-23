; Hyphenated names.
(defvar hello-world "hello, world")
(format t "~a~%" hello-world)

; Global variables start and end with *.
(defvar *state* t)
(format t "~a~%" *state*)

; Constants start and end with +.
(defvar +pi+ 3.1415926)
(format t "~a~%" +pi+)

; Some programmers will name particularly low-level functions with names
; that start with % or even %%. 
(defun %llf ()
  (format t "I am a low level function.~%"))
(defun %%llf ()
  (format t "I am also a low level function.~%"))
(%llf)
(%%llf)

; The names defined in the language standard use only the alphabetic
; characters (A-Z) plus *, +, -, /, 1, 2, <, =, >, and &.
