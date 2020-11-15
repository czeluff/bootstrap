Update first-line instructions that download and install
iTerm2, perhaps some configuration files for it? defaults read com.googlecode.iterm2 
max out iTerm scrolling speed (left/right) - perhaps consider Alacritty as your Terminal, instead
zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md (got it going for macOS, but has different install name for Linux) - put source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh at end of zshrc
iterm2 material design
ZSH Pure prompt
install global gitignore in .config
Plug for vim

download dotfiles, then just make your dotfiles point to the repo's dotfiles via symlinks

Finder Preferences: New Finder windows open Home, hide all icons, keep folders on top, show hidden files, show Path bar

https://github.com/zellwk/dotfiles has example of calling right setup script for mac vs pc, symlinking dotfiles properly, 
another goot dotfiler https://github.com/vitorgalvao/dotfiles
brew.sh needs to utilize the CSV that contains the list of programs to install, and install actual package (both regular and casks)
link-dotfiles doesn't look for dotfiles in right place, or symlink the source properly. (destination is fine)
