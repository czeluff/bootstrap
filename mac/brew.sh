#! /usr/bin/env bash

# Install Homebrew
echo "Installing Homebrew."
exit 0
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# Install Packages
echo "Installing packages."

echo "Finished installing packages."
