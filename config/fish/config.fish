# Oh My Fish!
set fish_path $HOME/.oh-my-fish
set fish_theme l
set fish_plugins z vi-mode tmux replace extract
. $fish_path/oh-my-fish.fish

set -U EDITOR vim

# Load scripts from bin
set PATH $PATH $HOME/.bin

set -U Z_SCRIPT_PATH ~/.plugin_data/z.sh

# aliases
if test -e ~/.aliases
  source ~/.aliases
end

# Local config
if test -e ~/.config/fish/config.fish.local
  source ~/.config/fish/config.fish.local
end

# alias tmux for proper coloring
alias tmux="env TERM=screen-256color-bce tmux"
