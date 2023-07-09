# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║     
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝


#    ___  _     ____               
#   / _ \(_)___/ __/_ _____ _______
#  / // / / __/ _/ \ \ / -_) __(_-<
# /____/_/_/ /___//_\_\\__/\__/___/

path+=('/home/frvnzj/.scripts')
path+=('/home/frvnzj/.cargo/bin')
export PATH


#    ____        _   __           
#   / __/__ _  _| | / /__ ________
#  / _// _ \ |/ / |/ / _ `/ __(_-<
# /___/_//_/___/|___/\_,_/_/ /___/

export TERMINAL="wezterm"
export BAT_THEME="OneHalfDark"
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export CALCURSE_EDITOR="lvim"
export NNN_PLUG='i:imgview;p:preview-tui;d:dragdrop'
export NNN_FIFO="/tmp/nnn.fifo"
export SKIM_DEFAULT_OPTIONS="--reverse"
export FZF_DEFAULT_OPTS="--reverse --height=50% --border=rounded"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--reverse --height=100% --border=rounded"


#    __                _____   ___        
#   / /  ___  ___ ____/ / _ | / (_)__ ____
#  / /__/ _ \/ _ `/ _  / __ |/ / / _ `(_-<
# /____/\___/\_,_/\_,_/_/ |_/_/_/\_,_/___/

[[ -f $HOME/.zshrc-personal ]] && . $HOME/.zshrc-personal


#    ____          __  _____     __     
#   / __/_ _____  / /_/ ___/__ _/ /____ 
#  _\ \/ // / _ \/ __/ /__/ _ `/ __/ _ \
# /___/\_, /_//_/\__/\___/\_,_/\__/ .__/
#     /___/                      /_/    

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh


#  ____  ___   ___     ____  ______ __
# /_  / / _ | / _ \___/_  / / __/ // /
#  / /_/ __ |/ ___/___// /__\ \/ _  / 
# /___/_/ |_/_/       /___/___/_//_/  

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/completions"


#    ___                      __      __         __    __     ____
#   / _ \_______  __ _  ___  / /_   _/_/ _______/ / ___\ \   /_  /
#  / ___/ __/ _ \/  ' \/ _ \/ __/ _/_/  / __/ _  / /___/> >   / /_
# /_/  /_/  \___/_/_/_/ .__/\__/ /_/    \__/\_,_/      /_/   /___/

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
