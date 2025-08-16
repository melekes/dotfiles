export ZSH=~/.oh-my-zsh

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git vi-mode tmux z zsh-autosuggestions rust golang gh fzf encode64 docker docker-compose brew)
source $ZSH/oh-my-zsh.sh

# User configuration

eval "$(starship init zsh)"

export ZSH_TMUX_AUTOSTART=true

export VISUAL=nvim
export EDITOR=$VISUAL

if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
