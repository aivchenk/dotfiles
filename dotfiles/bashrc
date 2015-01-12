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
PS1='\[\033[0;32m\][\u@\h \W] {\!}\$\[\033[0;37m\]> '
PROMPT_COMMAND=

if [ -f ~/.bash_private ]; then
    source ~/.bash_private
fi
