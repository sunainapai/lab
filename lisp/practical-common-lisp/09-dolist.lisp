; Create a list.
(defvar *a* nil)
(push 60 *a*)
(push 50 *a*)
(push 40 *a*)
(push 30 *a*)
(push 20 *a*)
(push 10 *a*)

; Print the entire list.
(format t "list: ~a~%" *a*)
(format t "~%")

; Iterate over each item with dolist.
(dolist (item *a*)
  (format t "item: ~a~%" item))
(format t "~%")

; Iterate over each item with format directive.
(format t "~{item: ~a~%~}" *a*)
(format t "~%")

; Iterate over two items at once with format directive.
(format t "~{pair: ~a, ~a~%~}" *a*)
(format t "~%")

; Create a list of lists.
(defvar *b* nil)
(push (list 10 11 12 13 14 15) *b*)
(push (list 20 21 22 23 24 25) *b*)

; Iterate over each list item with dolist, then iterate over three items
; at once in each inner item-list with format.
(dolist (item-list *b*)
  (format t "~{triple: ~a, ~a, ~a~%~}" item-list))
