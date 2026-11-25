# ~/dotfiles/zsh/.zshrc (and the top of ~/dotfiles/bash/.bashrc)
export DOTFILES="$HOME/dotfiles"

for file in exports aliases functions os_detect; do
    echo "Loading ${file}..."
    [ -f "$DOTFILES/shell/${file}.sh" ] && source "$DOTFILES/shell/${file}.sh"
done