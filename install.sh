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

# نسخ السكربتات الإضافية
if [ -d ".local/bin" ]; then
    mkdir -p ~/.local/bin
    cp -r .local/bin/* ~/.local/bin/
    chmod +x ~/.local/bin/*
fi

if [ -d ".zen-profile" ]; then
    echo "إعداد متصفح Zen Browser الخارق..."
    ZEN_DIR=$(ls -d ~/.var/app/io.github.zen_browser.zen/.zen/*.default* ~/.zen/*.default* 2>/dev/null | head -n 1)
    if [ -n "$ZEN_DIR" ]; then
        cp -r .zen-profile/* "$ZEN_DIR/" 2>/dev/null
    fi
fi
