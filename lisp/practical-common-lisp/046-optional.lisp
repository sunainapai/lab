(defun f1 (a b &optional c d)
  (format t "a: ~a; b: ~a; c: ~a; d: ~a~%" a b c d))

; invalid number of arguments: 1
; (f1 1)

(f1 1 2)
(f1 1 2 3)
(f1 1 2 3 4)

; invalid number of arguments: 5
; (f1 1 2 3 4 5)

(format t "~%")

(defun f2 (a b &optional (c 10) (d 20))
  (format t "a: ~a; b: ~a; c: ~a; d: ~a~%" a b c d))


(f2 1 2)
(f2 1 2 3)
(f2 1 2 3 4)
(format t "~%")

(defun calc-area (width &optional (height width))
  (* width height))

(format t "(calc-area 10): ~a~%" (calc-area 10))
(format t "(calc-area 10 20): ~a~%" (calc-area 10 20))
(format t "~%")

(defun cats-and-dogs (cats &optional (dogs 0))
  (if (equal dogs 0)
      (format t "~a cats~%" cats)
      (format t "~a cats and ~a dogs~%" cats dogs)))

(cats-and-dogs 2)
(cats-and-dogs 2 3)
(cats-and-dogs 2 0)
(format t "~%")

; In the above example, the function is unable to distinguish between
; the first call and the third call. To overcome this, we use a
; "-suppied-p" parameter.

(defun cats-and-dogs2 (cats &optional (dogs 0 dogs-supplied-p))
  (if (equal dogs-supplied-p nil)
      (format t "~a cats~%" cats)
      (format t "~a cats and ~a dogs~%" cats dogs)))

(cats-and-dogs2 2)
(cats-and-dogs2 2 3)
(cats-and-dogs2 2 0)
