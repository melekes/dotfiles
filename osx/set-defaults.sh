# Sets reasonable OS X defaults.
#
# The original idea were grabbed from:
#   https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
#
# Run ./set-defaults.sh and you'll be good to go.

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write NSGlobalDomain InitialKeyRepeat -int 15
