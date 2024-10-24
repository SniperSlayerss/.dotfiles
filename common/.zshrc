# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.cargo/bin:$PATH"
export FZF_BASE="~/.fzh"
export VK_DRIVER_FILES="/usr/share/vulkan/icd.d/nvidia_icd.json"
ZSH_THEME="robbyrussell"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

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
