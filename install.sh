#!/bin/bash
sudo pacman -Syu --needed - < pkglist-repo.txt
paru -S --needed - < pkglist-aur.txt
mkdir -p ~/.config ~/.local/share/fonts ~/Pictures/Wallpapers
cp -r .config/* ~/.config/
[ -f .zshrc ] && cp .zshrc ~/
[ -f .bashrc ] && cp .bashrc ~/
cp -r local/share/fonts/* ~/.local/share/fonts/ 2>/dev/null
cp -r wallpapers/* ~/Pictures/Wallpapers/ 2>/dev/null
[ -d .icons ] && cp -r .icons ~/
[ -d .themes ] && cp -r .themes ~/
fc-cache -fv
