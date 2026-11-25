# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTFILES="$HOME/dotfiles"

for file in exports aliases functions os_detect; do
    echo "Loading ${file}..."
    [ -f "$DOTFILES/shell/${file}.sh" ] && source "$DOTFILES/shell/${file}.sh"
done

# 3. Zsh-specific settings (completions, history, plugins)
autoload -Uz compinit && compinit

# 4. Load Powerlevel10k theme and your stowed .p10k.zsh config
[ -f "$P10K_THEME_PATH" ] && source "$P10K_THEME_PATH"
[ -f "$HOME/.p10k.zsh" ] && source "$HOME/.p10k.zsh"
