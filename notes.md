These are the notes for each slide.

These are likely of no use for you `¯\_(ツ)_/¯`

# How does the shell run other programs? #
* Program: cat /etc/shells
* REPL: echo ohai
* Scripting Lang: cat ohai.bash, ./ohai.bash
* Not covering scripting parts today

# Running other Programs #

## Find on disk ##

* Ls echo_args.pl
* ./echo_args.pl
* Pwd (copy paste)
* /Users/dgoldman/teamdevops/shell-talk/bin/echo_args.pl
* ls
* What is ls?
* Which ls
* /bin/ls
* Echo $PATH
* Echo $PATH | tr ‘:’ ‘\n’
* Command on its own vs. command with path
* Run bad_ls.pl
* Add /Users/dgoldman/teamdevops/shell-talk/bin to path and run again
* Ln -s bad_ls.pl ls
* Run ls again
* Which ls
* Now I have bad_ls, which is unfortunate

## invocation args ##

* Invocation arguments
* Echo_args.pl one two three four five
* Echo_args.pl ‘one two’ three\ four 3

## exit status ##

* Exit status
* Echo_args.pl --exit 3
* Echo $?

# Arg Expansion #

## globbing ##

* ls *
* ls *bash
* ls *pl
* ./echo_args.pl *pl
* cd ~/koala/koala-cms
* ls -l src/themes/*/constants/cms/env.tsx

## command substitution ##

* date
* echo $(date)
* grep $(date -j -f'%s' 1547094671 +%H:%M:%S)


## variable expansion ##

* foo=bar
* Echo $bar
* Echo $PWD
* Echo $HOME

## brace expansion ##

* echo foo-{bar,baz} -> foo-bar foo-baz
* echo file{0..3} -> file0 file1 file2 file3
* cp file.{,new}.txt

# which which #

## type vs which ##

* Which echo
* Type echo

## alis vs func vs built-in ##

* Alias ls=/bin/ls
* Cat ls_func.bash
* source ls_func.bash
* What about cd? Will cd work as another program?
* No. cd is a builtin

## your shell vs. subshell ##

* cat ls_func-script.bash
* ./ls_func-script.bash
* Pwd

## sourcing ##

* Import, aka old school php_include
* Like an eval
* The code executed happens to current running shell

# fork exec #

* Emacs fork_exec_wait.pl
* ./fork_exec_wait.pl ls -l *

# Output redirection #

* OUT_FILE=temp ./fork_exec_wait.pl ls -l *

