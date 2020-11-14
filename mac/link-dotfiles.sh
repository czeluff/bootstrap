#!/bin bash

for f in dotfiles/\.[^.]*; do
	FILE="$(basename $f)"
#	ln -sf "$PWD/dotfiles/$FILE" "$HOME"
done

