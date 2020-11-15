#! /usr/bin/env bash

# Install Homebrew
echo "Installing Homebrew."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
brew upgrade

# Install Packages
echo "Installing packages."

# Mac Brew Specific
brew install mas
brew install gsed
brew install zsh-syntax-highlighting

# Mac App Store - redacted, helium, apple developer, pages, numbers, keynote, xcode
mas install 984968384
mas install 1054607607
mas install 640199958
mas install 409201541
mas install 409203825
mas install 409183694
mas install 497799835

# Mac Cask Tap
brew tap epk/epk
brew cask install font-sf-mono-nerd-font
brew cask install iterm2
brew cask install discord
brew cask install slack
brew cask install daisydisk
brew cask install visual-studio-code 
brew cask install sketch
brew cask install transmit
brew cask install keka
brew cask install amethyst
brew cask install vanilla

# Linux
brew install elixir
brew install go
brew install python3
brew install youtube-dl
brew install tldr
brew install ack
brew install figlet
brew install neofetch
brew install tmux
brew install speedtest-cli

# Cloned

mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/undo

# Pure ZSH prompt
git clone https://github.com/sindresorhus/pure.git "$HOME/.config/zsh/pure"

# Vim Plug
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Finished installing packages."
