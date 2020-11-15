#!/bin bash

for f in dotfiles/\.[^.]*; do
	FILE="$(basename $f)"
	ln -sf "$PWD/dotfiles/$FILE" "$HOME/.config"
	[[ "$FILE" != ".gitignore_global" ]] && ln -sf "$HOME/.config/$FILE" "$HOME"
done

