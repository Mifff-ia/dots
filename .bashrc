rcdir="$HOME/.config/sh/"

[ -f $rcdir/aliases ] && . $rcdir/aliases

HISTFILE=~/.cache/shell-histfile
HISTSIZE=1000
HISTCONTROL=ignoreboth:erasedups

umask 022

set -o vi
bind -f $rcdir/inputrc

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
				venv="${venv%-*}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "[v:$venv] "
}

VENV="\$(virtualenv_info)"
export PS1="\[\e[35m\]${VENV}\[\e[m\]\[\e[34m\]\W\[\e[m\] | "

export GPG_TTY=$(tty)
