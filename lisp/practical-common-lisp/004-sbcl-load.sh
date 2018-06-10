#!/bin/sh

# Press ^D to quit REPL.
sbcl --eval '(format t "hello world")'

# The following two commands are equivalent.
sbcl --eval '(load "02-defun.lisp")'
sbcl --load 02-defun.lisp

# The following command is similar to above but loads the script in a
# clean environment with no startup files invoked and debugger disabled.
# It also exits immediately after executing the script.
sbcl --script 02-defun.lisp
