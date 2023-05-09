# Directorios de ejecutables
export PATH="$HOME/.scripts:$PATH"

# Variables
export TERMINAL="wezterm"
export BAT_THEME="OneHalfDark"
export EDITOR="lvim"
export VISUAL="lvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export CALCURSE_EDITOR="lvim"
export SKIM_DEFAULT_OPTIONS="--reverse"

export NNN_PLUG='i:imgview;p:preview-tui;d:dragdrop'
export NNN_FIFO="/tmp/nnn.fifo"

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# Alias
[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

# ZAP plugin
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Plugins
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "Aloxaf/fzf-tab"

# Prompt & cd->z
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
