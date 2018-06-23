; All legal list forms start with a symbol. In this case,
; (cube-function 2) is a legal list form that starts with a symbol not
; defined yet, so cube-function is assumed to be a function name.
(defun call-cube-function ()
  (format t "~a~%" (cube-function 2)))

; In this case as well, (cube-macro 3) is a legal list form but
; cube-macro has not been defined yet, so it is assumed to be a function
; name.
(defun call-cube-macro ()
  (format t "~a~%" (cube-macro 3)))

; This defines a function named cube-function which is consistent with
; the first assumption that cube-function is a function name.
(defun cube-function (x)
  (* x x x))

; This defines a macro named cube-macro which contradicts the earlier
; assumption that cube-macro is a function name.
(defmacro cube-macro (x)
  (* x x x))

; This runs fine because call-cube-function invokes a function named
; cube-function which is now defined.
(call-cube-function)

; This fails with the following error because call-cube-function invokes
; a function named cube-macro but no such function exists (a macro by
; that name exists but no function exists by that name):
;
; The function COMMON-LISP-USER::CUBE-MACRO is undefined.
; (call-cube-macro)
