set -U EDITOR vim

if test -e ~/.aliases
  source ~/.aliases
end

# alias tmux for proper coloring
alias tmux="env TERM=screen-256color-bce tmux"

switch (uname)
    case Linux
            set fisher_home ~/.local/share/fisherman
    case Darwin
            set fisher_home ~/.local/share/fisherman
end
set fisher_config ~/.config/fisherman
set fisher_file ~/.fishfile
source $fisher_home/config.fish

if test -e ~/.config/fish/config.fish.local
  source ~/.config/fish/config.fish.local
end
