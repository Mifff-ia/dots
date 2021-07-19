. $HOME/etc/sh/env
. $HOME/.bashrc

[ -d "$XDG_RUNTIME_DIR" ] || mkdir -m 700 "$XDG_RUNTIME_DIR"

[ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ] && sway
