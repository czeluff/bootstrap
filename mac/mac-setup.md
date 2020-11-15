Update first-line instructions that download and install
install global gitignore in .config

download dotfiles, then just make your dotfiles point to the repo's dotfiles via symlinks

https://github.com/zellwk/dotfiles has example of calling right setup script for mac vs pc, symlinking dotfiles properly, 
another goot dotfiler https://github.com/vitorgalvao/dotfiles
brew.sh needs to utilize the CSV that contains the list of programs to install, and install actual package (both regular and casks)
link-dotfiles doesn't look for dotfiles in right place, or symlink the source properly. (destination is fine)

dotfiles: .vimrc .zshrc .gitconfig .gitignore .aliases .tmux.conf
