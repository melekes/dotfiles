# ~melekes dotfiles

## What I am using

* [neovim](https://neovim.io/) +
  [vim-plug](https://github.com/junegunn/vim-plug)
* [tmux](http://robots.thoughtbot.com/a-tmux-crash-course) (prefix is `Ctrl-f`) +
  [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
* zsh + [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)

*Be sure, you had these installed before proceeding.*

## Install

Clone onto your laptop:

    git clone git://github.com/melekes/dotfiles.git

(Or, [fork and keep your fork
updated](http://robots.thoughtbot.com/keeping-a-github-fork-updated)).

Install [rcm](https://github.com/thoughtbot/rcm):

    brew install rcm

Install:

    rcup -d dotfiles -x README.md -x LICENSE

This will create symlinks for config files in your home directory. The
`-x` options, which exclude the `README.md` and `LICENSE` files, are
needed during installation but can be skipped once the `.rcrc`
configuration file is symlinked in.

You can safely run `rcup` multiple times to update:

    rcup

## After steps

Install Vim plugins: open Vim and type `:PlugInstall`.

Install Tmux plugins: run tmux and hit `Ctrl-f + I`.

## Make your own customizations

Put your customizations in dotfiles appended with `.local`:

* `~/.aliases.local`
* `~/.gitconfig.local`
* `~/.tmux.conf.local`
* `~/.zshrc.local`
* `~/.config/nvim/init.vim.local`

For example, your `~/.aliases.local` might look like this:

    # Productivity
    alias todo='$EDITOR ~/.todo'

Your `~/.gitconfig.local` might look like this:

    [alias]
      l = log --pretty=colored
    [pretty]
      colored = format:%Cred%h%Creset %s %Cgreen(%cr) %C(boldblue)%an%Creset
    [user]
      name = Joe Black
      email = joe@black.com

Your `~/.config/fish/config.fish.local` might look like this:

    set PATH $PATH /usr/local/bin

## Shell aliases

* `e` for $EDITOR
* git aliases (`gst`, `gci`, `ga`, etc.)

## Thanks

These dotfiles are heavily inspired by [holman does
dotfiles](https://github.com/holman/dotfiles). Installation process is
now handled by awesome [thougtbot/rcm](https://github.com/thoughtbot/rcm).
