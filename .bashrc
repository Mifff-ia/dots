rcdir="$XDG_CONFIG_HOME/sh"

[ -f $rcdir/aliases ] && . $rcdir/aliases

HISTFILE="$XDG_CACHE_HOME/shell-histfile"
HISTSIZE=1000
HISTCONTROL=ignoreboth:erasedups

umask 022

set -o vi
shopt -s histverify
bind -f $rcdir/inputrc

function virtualenv_info(){
    # is pwd in a virtual env?
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
				venv="${venv%-*}"

        echo "[v:$venv] "
    fi
}

VENV="\$(virtualenv_info)"
export PS1="\[\e[35m\]${VENV}\[\e[m\]\[\e[34m\]\W\[\e[m\] | "

export GPG_TTY=$(tty)

eval "$(zoxide init bash --cmd cd)"

trap 'echo -ne "\033]2;$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g")\007"' DEBUG

alias luamake=/home/max/opt/clone/lua-language-server/3rd/luamake/luamake
