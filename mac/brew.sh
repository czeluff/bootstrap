#! /usr/bin/env bash

# Install Homebrew
echo "Installing Homebrew."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
brew upgrade

# Install Packages
echo "Installing packages."
brew install gsed

echo "Finished installing packages."
