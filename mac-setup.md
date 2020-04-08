install brew (it now installs the xcode command line tools for you wtf)
hide menu bar
hide dock, shrink, move to left (there's scripts to make it appear and disappear faster that you found on Snazzy Labs YouTube, big 90 min video)
user account in /etc/sudoers: czeluff ALL = (ALL) NOPASSWD: ALL
iTerm2, perhaps some configuration files for it?
max out iTerm scrolling speed (left/right)
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

maybes:
daisydisk (you have a license for it)
deckset
redacted
sip (is Kelir a better version?)
Slack (necessary evil?)
Transmit
Visual Studio Code?
keka
helium
discord
speedtest-cli
ack

download dotfiles, then just make your dotfiles point to the repo's dotfiles via symlinks

Finder Preferences: New Finder windows open Home, hide all icons, keep folders on top, show hidden files, show Path bar

defaults write com.apple.dock expose-animation-duration -int 0 # removes Expose animation time
defaults write com.apple.universalaccess reduceMotion -bool true
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 30
defaults write -g PMPrintingExpandedStateForPrint -bool true
sudo nvram StartupMute=%00

defaults write com.apple.dock autohide-delay -float 0; killall Dock (reduces delay)
defaults write com.apple.dock autohide-time-modifier -float 0; killall Dock (removes animation)

https://github.com/zellwk/dotfiles has example of calling right setup script for mac vs pc, symlinking dotfiles properly, 
