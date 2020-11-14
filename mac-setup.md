install brew (it now installs the xcode command line tools for you wtf)
user account in /etc/sudoers: czeluff ALL = (ALL) NOPASSWD: ALL
iTerm2, perhaps some configuration files for it? defaults read com.googlecode.iterm2 
max out iTerm scrolling speed (left/right) - perhaps consider Alacritty as your Terminal, instead
elixir
go
python3 (dev things should cover both Linux and macOS, so htop doesnt need to be listed)
amethyst (can i get my configuration exported and imported?)
youtube-dl
tldr
zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
iterm2 material design
ZSH Pure prompt
softe wallpaper by jivebs
Vanilla app
install global gitignore in .config
vscode + all extensions should be installed via cmd line
discord
Slack
daisydisk (you have a license for it)
deckset
redacted
sip (is Kelir a better version?)
Transmit
keka
helium
speedtest-cli
ack
figlet
Plug for vim
neofetch
tmux

download dotfiles, then just make your dotfiles point to the repo's dotfiles via symlinks

Finder Preferences: New Finder windows open Home, hide all icons, keep folders on top, show hidden files, show Path bar

https://github.com/zellwk/dotfiles has example of calling right setup script for mac vs pc, symlinking dotfiles properly, 
another goot dotfiler https://github.com/vitorgalvao/dotfiles
fix shell scripts to specify use of zsh and not bash
brew.sh needs to utilize the CSV that contains the list of programs to install, and install actual package (both regular and casks)
link-dotfiles doesn't look for dotfiles in right place, or symlink the source properly. (destination is fine)
mac-os.sh can ditch the sudo loop at the top if you can properly set /etc/sudoers ahead of time
install gsed, see if Luke had a better way of setting computer name and host name
custom wallpaper image probably doesn't work
