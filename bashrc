#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
# PS1='[\u@\h]\$ '
# PS1='\[\e[35;1m\] > \[\e[0m\]'
PS1='
\w
\[\e[32;1m\]> \[\e[0m\]'
export PATH=/home/eclipse/.local/bin:$PATH

HISTFILESIZE=100
HISTSIZE=100
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S"

