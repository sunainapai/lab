Set up SBCL + Slimv for Lisp Development Environment
----------------------------------------------------
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
