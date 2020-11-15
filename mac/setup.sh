#!/usr/bin/env bash

# Set sudo permissions on user
echo 'czeluff ALL = (ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

# Install apps and binaries with Brew
source mac/brew.sh

# Create symlinks for dotfiles
source mac/link-dotfiles.sh

# Configure macOS defaults
source mac/macos.sh

# Display changes unavailable via Command Line
cat mac/todo.txt
