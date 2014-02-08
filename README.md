# ~akalyaev dotfiles

## Requirements

Set zsh as your login shell.

    chsh -s /bin/zsh

## Install

Clone onto your laptop:

    git clone git://github.com/akalyaev/dotfiles.git

(Or, [fork and keep your fork
updated](http://robots.thoughtbot.com/keeping-a-github-fork-updated)).

Install [rcm](https://github.com/thoughtbot/rcm):

    brew bundle rcm

Install:

    rcup -d dotfiles -x README.md -x LICENSE

This will create symlinks for config files in your home directory. The
`-x` options, which exclude the `README.md` and `LICENSE` files, are
needed during installation but can be skipped once the `.rcrc`
configuration file is symlinked in.

You can safely run `rcup` multiple times to update:

    rcup

## Make your own customizations

Put your customizations in dotfiles appended with `.local`:

* `~/.aliases.local`
* `~/.gitconfig.local`
* `~/.tmux.conf.local`
* `~/.zshrc.local`

For example, your `~/.aliases.local` might look like this:

    # Productivity
    alias todo='$EDITOR ~/.todo'

Your `~/.gitconfig.local` might look like this:

    [alias]
      l = log --pretty=colored
    [pretty]
      colored = format:%Cred%h%Creset %s %Cgreen(%cr) %C(bold
blue)%an%Creset
    [user]
      name = Dan Croak
      email = dan@thoughtbot.com

Your `~/.zshrc.local` might look like this:

    # recommended by brew doctor
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

## What I am using

* [vim](http://www.vim.org/)
* -> [Janus](https://github.com/carlhuda/janus)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [tmux](http://robots.thoughtbot.com/a-tmux-crash-course). Prefix is
  `Ctrl-f`

Shell aliases and scripts:

* `b` for `bundle`.
* `g` with no arguments is `git status` and with arguments acts like
  `git`.
* `replace foo bar **/*.rb` to find and replace within a given list of
  files.

## Thanks

These dotfiles is heavily inspired by [holman does
dotfiles](https://github.com/holman/dotfiles). Installation process is
now handled by awesome [thougtbot/rcm](https://github.com/thoughtbot/rcm).
