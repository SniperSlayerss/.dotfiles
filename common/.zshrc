export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.cargo/bin:$PATH"
export FZF_BASE="~/.fzh"
ZSH_THEME="robbyrussell"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"

# Source fzf if it exists
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fzf_open() {
  local file
  file=$(find . -type f | sed 's|^\./||' | fzf --multi)
  [ -n "$file" ] && nvim $file
}

zle -N fzf_open
bindkey '^f' fzf_open

[ -f "/home/jack/.ghcup/env" ] && . "/home/jack/.ghcup/env" # ghcup-env
