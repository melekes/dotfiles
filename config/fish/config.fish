fish_vi_key_bindings

set -x VISUAL nvim
set -x EDITOR $VISUAL

# GPG
if not begin
    # Is the agent running already? Does the agent-info file exist, and if so,
    # is there a process with the pid given in the file?
    [ -f ~/.gpg-agent-info ]
    and kill -0 (cut -d : -f 2 ~/.gpg-agent-info) ^/dev/null
end
    # no, it is not running. Start it!
    gpg-agent --daemon --no-grab --write-env-file ~/.gpg-agent-info >/dev/null ^&1
end
# get the agent info from the info file, and export it so GPG can see it.
set -gx GPG_AGENT_INFO (cut -c 16- ~/.gpg-agent-info)
set -gx GPG_TTY (tty)

if test -e ~/.aliases
  source ~/.aliases
end

# alias tmux for proper coloring
alias tmux="env TERM=xterm-256color tmux"

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

set -g fisher_file ~/.fishfile

if test -e ~/.config/fish/config.fish.local
  source ~/.config/fish/config.fish.local
end
