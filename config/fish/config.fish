set theme_color_scheme solarized
set -x GOPATH ~/go
set -x PATH $PATH $GOPATH/bin

if test -n "$DESKTOP_SESSION"
    set (gnome-keyring-daemon --start | string split "=")
end
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/keyring/ssh"
