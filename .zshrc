# Directorios de ejecutables
export PATH="$HOME/.scripts":$PATH

# Variables
export BAT_THEME="Dracula"
export EDITOR=lvim
export VISUAL=lvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

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
