Practical Common Lisp: Examples & Notes
=======================================
This directory contains examples and notes I wrote while reading
[Practical Common Lisp](http://www.gigamonkeys.com/book/) by Peter
Seibel.


Set up SBCL + Slimv for Lisp Development Environment
----------------------------------------------------
These are the steps I followed to install SBCL and Slimv on macOS High
Sierra Version 10.13.5.

 1. Enter the following command to install Steel Bank Common Lisp:

        brew install sbcl

 2. Enter the following command to install Slimv plugin for Vim:

        git clone --depth 1 https://github.com/kovisoft/slimv.git ~/.vim/bundle/slimv

 3. Configure Vim to load the plugin by adding this line to `~/.vimrc`:

        set runtimepath^=~/.vim/bundle/slimv

    Test that the plugin is loaded by opening a Lisp source code file in
    Vim. The presence of a Slimv menu option confirms that the plugin is
    loaded.

 4. Generate the documentation tags, enter this command in the shell:

        vim +"helptags ALL" +q

    Confirm that the documentation works fine by entering this command
    in Vim:

        :help slimv

 5. Finally test Slimv functionality. To do so, open a Lisp source code file
    in Vim and enter this command in normal mode to start a Swank server
    and display the REPL in a new buffer:

        ,c

    Then switch back to the source code buffer (`Ctrl+w+w`) and enter
    this command to execute the buffer content in REPL:

        ,b


Notes
-----
### Chapter 4. Syntax and Semantics
Chapter URL: http://www.gigamonkeys.com/book/syntax-and-semantics.html

#### S-expressions
> The basic elements of s-expressions are *lists* and *atoms*. Lists are
> delimited by parentheses and can contain any number of
> whitespace-separated elements. Atoms are everything else. The elements
> of lists are themselves s-expressions (in other words, atoms or nested
> lists).

> ... the most commonly used kinds of atoms: numbers, strings, and names.

#### S-expressions As Lisp Forms
> Common Lisp's evaluation rule defines a second level of syntax that
> determines which s-expressions can be treated as Lisp forms.

> Any atom--any nonlist or the empty list--is a legal Lisp form as is
> any list that has a symbol as its first element.

> The simplest Lisp forms, atoms, can be divided into two categories:
> symbols and everything else.

> ... atoms--numbers and strings are the kinds you've seen so far--are
> self-evaluating objects.

> It's also possible for symbols to be self-evaluating in the sense that
> the variables they name can be assigned the value of the symbol
> itself. Two important constants that are defined this way are `T` and
> `NIL` ...

> Another class of self-evaluating symbols are the *keyword*
> symbols--symbols whose names start with `:`. When the reader interns
> such a name, it automatically defines a constant variable with the
> name and with the symbol as the value.

> ... three kinds of forms as *function call forms*, *macro forms*, and
> *special forms*.

#### Function Calls
> The evaluation rule for function call forms is simple: evaluate the
> remaining elements of the list as Lisp forms and pass the resulting
> values to the named function.

#### Special Operators
> Because all the arguments to a function are evaluated before the
> function is called, there's no way to write a function that behaves
> like the `IF` operator ...

> There are 25 in all, but only a small handful are used directly in
> day-to-day programming.

> When the first element of a list is a symbol naming a special
> operator, the rest of the expressions are evaluated according to the
> rule for that operator.

#### Macros
> ... a macro is a function that takes s-expressions as arguments and
> returns a Lisp form that's then evaluated in place of the macro form.

> The evaluation of a macro form proceeds in two phases: First, the
> elements of the macro form are passed, unevaluated, to the macro
> function. Second, the form returned by the macro function--called its
> *expansion*--is evaluated according to the normal evaluation rules.

> ... when you compile a whole file of source code with the function
> `COMPILE-FILE`, all the macro forms in the file are recursively
> expanded until the code consists of nothing but function call forms
> and special forms. This macroless code is then compiled into a FASL
> file that the `LOAD` function knows how to load.
