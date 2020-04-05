#!/bin/bash
# Chad's Arch Setup Script
# by Chad Zeluff <czeluff@gmail.com>

### OPTIONS AND VARIABLES ###

while getopts ":h:r:p" o; do case "${o}" in
	h) printf "Optional arguments for custom use:\\n  -p: Dependencies and programs csv (local file or url)\\n  -r: Dotfiles repository (local file or url)\\n  -h: Show this message\\n" && exit ;;
	r) dotfilesrepo=${OPTARG} ;;
	p) progsfile=${OPTARG} ;;
	*) printf "Invalid option -%s\\n" "$OPTARG" && exit ;;
esac done

[ -z "$dotfilesrepo" ] && dotfilesrepo="https://github.com/czeluff/dotfiles.git"
[ -z "$progsfile" ] && progsfile="https://raw.githubusercontent.com/czeluff/progs/master/archprogs.csv"

### FUNCTIONS ###

installpkg() { pacman --noconfirm --needed -S "$1" >/dev/null 2>&1; }

error() { clear; printf "ERROR:\\n%s\\n" "$1"; exit; }

getuserandpass() {
	printf "Enter a name for the user account: "; read -r name;
	while ! echo "$name" | grep "^[a-z][a-z0-9_-]*$" >/dev/null 2>&1; do
		printf "Invalid username. Must begin with lowercase letter, followed by lowercase letters, - or _: "; read -r name;
	done
	printf "Enter a password for %s: " "$name"; read -rs pass1; echo;
	printf "Re-enter the password: "; read -rs pass2; echo;
	while ! [ "$pass1" = "$pass2" ]; do
		unset pass2
		printf "Passwords did not match. Enter a password for %s: " "$name"; read -rs pass1; echo;
		printf "Re-enter the password: "; read -rs pass2; echo;
	done
}

adduserandpass() {
	printf "Creating user %s\\n" "$name"
	useradd -m -g wheel "$name" ||
		usermod -a -G wheel "$name" && mkdir -p /home/"$name" && chown "$name":wheel /home/"$name"
	repodir="/home/$name/.local/src"; mkdir -p "$repodir"; chown -R "$name":wheel "$repodir"
	echo "$name:$pass1" | chpasswd
	unset pass1 pass2
}

installessentials() {
	printf "Installing essential packages\\n"
	for pkg in "$@"; do
		installpkg "$pkg"
	done
}

synchronizeclock() {
	printf "Synchronizing clock\\n"
	ntp 0.us.pool.ntp.org >/dev/null 2>&1
}

setsudoers() {
	printf "Adjusting sudoers to run sudo without a password\\n"
	[ -f /etc/sudoers.pacnew ] && cp /etc/sudoers.pacnew /etc/sudoers
	sed -i "/^%wheel ALL=(ALL) NOPASSWD: ALL/s/^#//" /etc/sudoers
}

adjustmakeflags() {
	printf "Increasing CPU cores used in compilation to %s\\n" "$(nproc)"
	sed -i "s/-j2/-j$(nproc)/;s/^#MAKEFLAGS/MAKEFLAGS/" /etc/makepkg.conf
}

installyay() {
	printf "Installing 'yay' if not previously installed\\n"
	[ -f "/usr/bin/yay" ] || (
	cd /tmp || exit
	rm -rf /tmp/yay*
	curl -sO https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz &&
	sudo -u "$name" tar -xvf yay.tar.gz >/dev/null 2>&1 &&
	cd yay &&
	sudo -u "$name" makepkg --noconfim -si >/dev/null 2>&1
	cd /tmp || return)
}

aurinstall() {
	printf "Installing '%s' (%s of %s) from the AUR. %s %s\\n" "$1" "$n" "$total" "$1" "$2"
	echo "$aurinstalled" | grep "^$1$" >/dev/null 2>&1 && return
	sudo -u "$name" yay -S --noconfirm "$1" >/dev/null 2>&1
}

gitmakeinstall() {
	progname="$(basename "$1")"
	dir="$repodir/$progname"
	printf "Installing '%s' (%s of %s) via 'git' and 'make'. %s %s\\n" "$progname" "$n" "$total" "$progname" "$2"
	sudo -u "$name" git clone --depth 1 "$1" "$dir" >/dev/null 2>&1 || { cd "$dir" || return; sudo -u "$name" git pull --force origin master; }
	cd "$dir" || exit
	make >/dev/null 2>&1
	make install >/dev/null 2>&1
	cd /tmp || return
}

maininstall() {
	printf "Installing '%s' (%s of %s). %s %s\\n" "$1" "$n" "$total" "$1" "$2"
	installpkg "$1"
}

installationloop() {
	printf "Beginning installation of software specified at %s\\n" "$progsfile"
	([ -f "$progsfile" ] && cp "$progsfile" /tmp/progs.csv) || curl -Ls "$progsfile" | sed '/^#/d' | eval grep "^[GA]*," > /tmp/progs/csv
	total=$(wc -l < /tmp/progs.csv)
	aurinstalled=$(pacman -Qqm)
	while IFS=, read -r tag program comment; do
		n=$((n+1))
		echo "$comment" | grep "^\".*\"$" >/dev/null 2>&1 && comment="$(echo "$comment" | sed "s/\(^\"\|\"$\)//g")"
		case "$tag" in
			"A") aurinstall "$program" "$comment" ;;
			"G") gitmakeinstall "$program" "$comment" ;;
			*) maininstall "$program" "$comment" ;;
		esac
	done < /tmp/progs.csv
}

fixcoloremoji() {
	printf "Installing 'libxft-bgra' to enable color emoji in suckless software\\n"
	yes | sudo -u "$name" yay -S libxft-bgra >/dev/null 2>&1
}

installdotfiles() {
	printf "Installing dotfiles from %s into home directory\\n" "$dotfilesrepo"
	putgitrepo "$dotfilesrepo" "/home/$name"
	rm -f "/home/$name/README.md" "/home/$name/LICENSE"
}

activatezsh() {
	printf "Setting the default shell to zsh.\\n"
	sed -i "s/^$name:\(.*\):\/bin\/.*/$name:\1:\/bin\/zsh/" /etc/passwd
}

setwm() {
	# echo "$edition" > "/home/$name/.local/share/larbs/wm"; chown -R "$name":wheel "/home/$name/.local"
	true;
}

### THE ACTUAL SCRIPT ###

# Get and verify username and password.
# getuserandpass || error "User exited."

# Create or update user.
# adduserandpass || error "User exited."

# Add essentials for program installation.
# installessentials curl base-devel git ntp

# Synchronize clock.
# synchronizeclock()

# Set sudoers.
# setsudoers()

# Use all cores to compile.
# adjustmakeflags()

# Install yay.
# installyay()

# Install additional software.
# installationloop()

# Fix color emoji in suckless software.
# fixcoloremoji()

# Install dotfiles.
# installdotfiles()

# Enable zsh as the default shell.
# activatezsh()

# Set the active window manager.
# setwm()
