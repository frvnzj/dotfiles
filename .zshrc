# Directorios de ejecutables
path+=('/home/frvnzj/.scripts')
path+=('/home/frvnzj/.cargo/bin')
export PATH

# Variables
export TERMINAL="wezterm"
export BAT_THEME="OneHalfDark"
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export CALCURSE_EDITOR="lvim"
export SKIM_DEFAULT_OPTIONS="--reverse"
export FZF_DEFAULT_OPTS="--reverse --height=50% --border=rounded"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--reverse --height=100% --border=rounded"

export NNN_PLUG='i:imgview;p:preview-tui;d:dragdrop'
export NNN_FIFO="/tmp/nnn.fifo"

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

autoload -Uz compinit
compinit -u

# Alias
[[ -f $HOME/.zshrc-personal ]] && . $HOME/.zshrc-personal

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
# plug "zap-zsh/atmachine-prompt"

# Prompt & cd->z
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
