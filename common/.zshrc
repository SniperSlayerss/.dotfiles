export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.cargo/bin:$PATH"
export FZF_BASE="~/.fzh"
ZSH_THEME="robbyrussell"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"

# Source fzf if it exists
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_CTRL_R_OPTS="--height 10"
export FZF_ALT_C_OPTS='--no-height --no-reverse'

fzf_open() {
  local file
  file=$(find . -type f | sed 's|^\./||' | fzf --multi)
  [ -n "$file" ] && nvim $file
}

fzf_dir() {
  zle fzf-cd-widget
  clear
}

zle -N fzf_open
zle -N fzf_dir
bindkey '^x' fzf_open
bindkey '^f' fzf_dir 