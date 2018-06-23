; Almost any character can appear in a name.
(defvar foo~!@#$%^&*-=12?/<>. "special characters")
(format t "~a~%" foo~!@#$%^&*-=12?/<>.)

(defvar ~~.~~ "bird")
(format t "~a~%" ~~.~~)

(defvar ..1 "dotdot1")
(format t "~a~%" ..1)

; The reader converts all unescaped characters in a name to their
; uppercase equivalents.
(defvar foo1 "foo1")
(format t "~a ~a ~a~%" foo1 Foo1 FOO1)

(defvar \f\o\o "escaped")
(format t "~a ~a ~a~%" |foo| \f\o\o \f|\oo|)

(defvar |bar| "bars")
(format t "~a ~a ~a~%" |bar| \b\a\r \b|\ar|)

; The variable FOO is unbound.
; (format t "~a~%" foo) ; Undefined because "foo" is converted to "FOO".
; (format t "~a~%" bar) ; Undefined because "bar" is converted to "BAR".

; invalid number of elements in "dot"
; (defvar . "dot")

; The value 0.1 is not of type SYMBOL when binding SYMBOL
; (defvar .1 "dot1")

; too many dots
; (defvar .. "dotdotdot")

; Ten characters that serve other syntactic purposes can't appear in
; names: open and close parentheses, double and single quotes, backtick,
; comma, colon, semicolon, backslash, and vertical bar.

; The value "a" is not of type SYMBOL when binding SYMBOL
; (defvar "a" "quoted-name")

(defvar \"a\" "quoted-name")
(format t "~a~%" \"A\")

; And even those characters can, if you're willing to escape them by
; preceding the character to be escaped with a backslash or by surrounding
; the part of the name containing characters that need escaping with
; vertical bars. 
(defvar \(\)\"\'\`\,\:\;\\\| "escaped special characters")
(format t "~a~%" \(\)\"\'\`\,\:\;\\\|)
(format t "~a~%" |()"'`,:;\\\||)
