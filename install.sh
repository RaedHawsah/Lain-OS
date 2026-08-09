#!/bin/bash
sudo pacman -Syu --needed - < pkglist-repo.txt
paru -S --needed - < pkglist-aur.txt

if ! command -v zen-browser &> /dev/null && ! flatpak list | grep -q "zen_browser"; then
    paru -S --noconfirm zen-browser-bin 2>/dev/null || flatpak install -y flathub io.github.zen_browser.zen
fi

mkdir -p ~/.config
cp -r .config/* ~/.config/

[ -f .zshrc ] && cp .zshrc ~/
[ -f .bashrc ] && cp .bashrc ~/

mkdir -p ~/.local/share/fonts ~/Pictures/Wallpapers
cp -r local/share/fonts/* ~/.local/share/fonts/ 2>/dev/null
cp -r wallpapers/* ~/Pictures/Wallpapers/ 2>/dev/null

if [ -d ".zen-profile" ]; then
    ZEN_TARGET=$(ls -d ~/.var/app/io.github.zen_browser.zen/.zen/*.default* ~/.zen/*.default* 2>/dev/null | head -n 1)
    if [ -n "$ZEN_TARGET" ]; then
        cp -r .zen-profile/* "$ZEN_TARGET/" 2>/dev/null
    else
        mkdir -p ~/.zen/default.default
        cp -r .zen-profile/* ~/.zen/default.default/ 2>/dev/null
    fi
fi

fc-cache -fv
