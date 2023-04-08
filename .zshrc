# Directorios de ejecutables
export PATH="$HOME/.scripts:$PATH"

# Variables
export TERMINAL="wezterm"
export BAT_THEME="Dracula"
export EDITOR="lvim"
export VISUAL="lvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export CALCURSE_EDITOR="lvim"
export SKIM_DEFAULT_OPTIONS="--reverse"

export NNN_PLUG='i:imgview'
export MCFLY_PROMPT="❯"

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# Alias
[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

# ZAP plugin
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Plugins
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"

# Prompt & cd->z
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(mcfly init zsh)"

source /home/frvnzj/.config/broot/launcher/bash/br
