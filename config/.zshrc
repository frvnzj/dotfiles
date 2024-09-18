# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║     
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝


#    __                _____   ___        
#   / /  ___  ___ ____/ / _ | / (_)__ ____
#  / /__/ _ \/ _ `/ _  / __ |/ / / _ `(_-<
# /____/\___/\_,_/\_,_/_/ |_/_/_/\_,_/___/

[[ -f $HOME/.zshrc-personal ]] && . $HOME/.zshrc-personal


# export VENV_HOME="$HOME/.virtualenvs"
# [[ -d $VENV_HOME ]] || mkdir $VENV_HOME
#
# lsvenv() {
#   ls -1 $VENV_HOME
# }
#
# venv() {
#   if [ $# -eq 0 ]
#     then
#       echo "Please provide venv name"
#     else
#       source "$VENV_HOME/$1/bin/activate"
#   fi
# }
#
# mkvenv() {
#   if [ $# -eq 0 ]
#     then
#       echo "Please provide venv name"
#     else
#       python3 -m venv $VENV_HOME/$1
#   fi
# }
#
# rmvenv() {
#   if [ $# -eq 0 ]
#     then
#       echo "Please provide venv name"
#     else
#       rm -r $VENV_HOME/$1
#   fi
# }


#    ____          __  _____     __     
#   / __/_ _____  / /_/ ___/__ _/ /____ 
#  _\ \/ // / _ \/ __/ /__/ _ `/ __/ _ \
# /___/\_, /_//_/\__/\___/\_,_/\__/ .__/
#     /___/                      /_/    

source "$HOME/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh"


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
plug "zsh-users/zsh-history-substring-search"


#    ___                      __      __         __    __     ____
#   / _ \_______  __ _  ___  / /_   _/_/ _______/ / ___\ \   /_  /
#  / ___/ __/ _ \/  ' \/ _ \/ __/ _/_/  / __/ _  / /___/> >   / /_
# /_/  /_/  \___/_/_/_/ .__/\__/ /_/    \__/\_,_/      /_/   /___/

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
