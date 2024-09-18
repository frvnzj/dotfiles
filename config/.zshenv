# ███████╗███████╗██╗  ██╗███████╗███╗   ██╗██╗   ██╗
# ╚══███╔╝██╔════╝██║  ██║██╔════╝████╗  ██║██║   ██║
#   ███╔╝ ███████╗███████║█████╗  ██╔██╗ ██║██║   ██║
#  ███╔╝  ╚════██║██╔══██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝
# ███████╗███████║██║  ██║███████╗██║ ╚████║ ╚████╔╝ 
# ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝  


#    ____        _   __           
#   / __/__ _  _| | / /__ ________
#  / _// _ \ |/ / |/ / _ `/ __(_-<
# /___/_//_/___/|___/\_,_/_/ /___/

export TERMINAL='wezterm'
export BROWSER="firefox"
export BAT_THEME='Catppuccin Mocha'
export EDITOR='nvim'
export VISUAL='nvim'
export CALCURSE_EDITOR='nvim'
export NNN_PLUG="i:imgview;p:preview-tui;d:dragdrop"
export NNN_FIFO='/tmp/nnn.fifo'
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#11111b,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--reverse --height=100% --border=rounded"
export SKIM_DEFAULT_OPTIONS="$SKIM_DEFAULT_OPTIONS \
--color=fg:#cdd6f4,bg:#1e1e2e,matched:#313244,matched_bg:#f2cdcd,current:#cdd6f4,current_bg:#45475a,current_match:#1e1e2e,current_match_bg:#f5e0dc,spinner:#a6e3a1,info:#cba6f7,prompt:#89b4fa,cursor:#f38ba8,selected:#eba0ac,header:#94e2d5,border:#6c7086"
export DENO_INSTALL="/home/frvnzj/.deno"
export GOPATH=$HOME/Documentos/go
export TEXMFHOME=$HOME/.texmf


#    ___  _     ____               
#   / _ \(_)___/ __/_ _____ _______
#  / // / / __/ _/ \ \ / -_) __(_-<
# /____/_/_/ /___//_\_\\__/\__/___/

PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH; export PATH 
MANPATH=/usr/local/texlive/2024/texmf-dist/doc/man:$MANPATH; export MANPATH 
INFOPATH=/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH; export INFOPATH

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$DENO_INSTALL/bin:$PATH"
