case "$(uname -s)" in
    Darwin)
        [ -f "$DOTFILES/os/macos.sh" ] && source "$DOTFILES/os/macos.sh"
        ;;
    Linux)
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            case "$ID" in
                cachyos|arch)
                    [ -f "$DOTFILES/os/arch.sh" ] && source "$DOTFILES/os/arch.sh"
                    ;;
                linuxmint|ubuntu|debian)
                    [ -f "$DOTFILES/os/debian.sh" ] && source "$DOTFILES/os/debian.sh"
                    ;;
            esac
        fi
        ;;
esac