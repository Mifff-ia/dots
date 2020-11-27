. $HOME/.config/sh/env
. $HOME/.bashrc

[ -d "$XDG_RUNTIME_DIR" ] || mkdir "$XDG_RUNTIME_DIR"

# alsactl --file "$XDG_CONFIG_HOME/asound.state" restore

[ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ] && sx
