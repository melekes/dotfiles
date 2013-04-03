# ~akalyaev dotfiles

Usually I am working within the vagrant, but nonetheless, on my local
machine I also need zsh for comfortable navigation and vim for demonstration purposes. This
repository is designed to keep most of my working settings.

## install

Run this:

```sh
git clone https://github.com/akalyaev/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
PWD=~/.dotfiles rake install
```

This will symlink the appropriate files in `.dotfiles` to your home
directory. Everything is configured and tweaked within `~/.dotfiles`.

## Thanks

These dotfiles is heavily inspired by [holman does
dotfiles](https://github.com/holman/dotfiles).
