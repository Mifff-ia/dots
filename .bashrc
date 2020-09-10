rcdir="$HOME/.config/sh/"

[ -f $rcdir/aliases ] && . $rcdir/aliases

HISTFILE=~/.cache/shell-histfile
HISTSIZE=1000
HISTCONTROL=ignoreboth:erasedups

umask 022

set -o vi
bind -f $rcdir/inputrc

export PS1="\[\e[34m\]\W\[\e[m\] | "
