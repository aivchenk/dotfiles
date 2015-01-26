# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# aivchenk version

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

echo "*** bashrc read !" >&2

############
# Settings #
############

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Gcc stuff
export GCCROOT=/usr
export GCC_COLORS=always
export CCACHE_DISABLE=YES

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# To switch off C-s (hatred!)
stty ixoff -ixon

###########
# Aliases #
###########

function call_gud_gdb {
    emacs -gud-gdb "gdb --fullname $1"
}

alias emacs='emacs -nw'
alias egdb=call_gud_gdb

alias grep="grep --color=always"
alias less="less -R"
alias ll="ls -a -l --color -h"
alias rm="rm -I"

#########
# Promt #
#########

tty=`tty`
# Func to gen PS1 after CMDs
export PROMPT_COMMAND=__prompt_command

function __prompt_command() {
    # This needs to be first
    local EXIT="$?"

    # Reset color
    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local Pur='\[\e[0;35m\]'
    local BGre='\[\e[1;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'

    PS1="${Gre}["    # Insert [
    PS1+="${Gre}\u"  # User name
    PS1+="${BGre}@"  # "at"
    PS1+="${Gre}\h"  # host name
    PS1+=" ${Pur}\W" # local directory
    PS1+="${Gre}]"   # closing ]
    # Add red/green ">", depending on the return code
    if [ $EXIT != 0 ]; then
        PS1+="${Red}>${RCol} "
    else
        PS1+="${Gre}>${RCol} "
    fi
}

if [ -f ~/.bash_private ]; then
    source ~/.bash_private
fi
