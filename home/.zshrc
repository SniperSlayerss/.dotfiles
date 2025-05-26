export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/nvim-linux64/bin:$PATH"

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"
# eval "$(pyenv virtualenv-init -)"

export FZF_CTRL_R_OPTS="--height 10"
export FZF_ALT_C_OPTS='--no-height --no-reverse'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fzf_open() {
  local file
  file=$(find . -type f | sed 's|^\./||' | fzf --multi)
  [ -n "$file" ] && nvim $file
}

fzf_dir() {
  zle fzf-cd-widget
  clear
}

tms_open() {
  zle -I
  BUFFER="tms"
  zle accept-line
}

zle -N fzf_open
zle -N fzf_dir
zle -N tms_open
bindkey '^x' fzf_open
bindkey '^f' fzf_dir
bindkey '\er' tms_open

alias code="code --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"
alias vi="nvim"
# eval $(opam env)
