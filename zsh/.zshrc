export DOTFILES="$HOME/dotfiles"

for file in exports aliases functions os_detect; do
    echo "Loading ${file}..."
    [ -f "$DOTFILES/shell/${file}.sh" ] && source "$DOTFILES/shell/${file}.sh"
done

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh