#!/bin/bash
echo "🌸 جاري تثبيت وتجهيز توزيعة Lain-OS لـ CachyOS 🌸"

sudo pacman -Syu --needed - < pkglist-repo.txt
paru -S --needed - < pkglist-aur.txt

if ! command -v zen-browser &> /dev/null && ! flatpak list | grep -q "zen_browser"; then
    echo "🌐 متصفح Zen غير مثبت، جاري تثبيته..."
    paru -S --noconfirm zen-browser-bin 2>/dev/null || flatpak install -y flathub io.github.zen_browser.zen
fi

echo "⚙️ جاري نسخ الإعدادات والواجهة..."
mkdir -p ~/.config
cp -r .config/* ~/.config/

[ -f .zshrc ] && cp .zshrc ~/
[ -f .bashrc ] && cp .bashrc ~/

mkdir -p ~/.local/share/fonts ~/Pictures/Wallpapers
cp -r local/share/fonts/* ~/.local/share/fonts/ 2>/dev/null
cp -r wallpapers/* ~/Pictures/Wallpapers/ 2>/dev/null
[ -d .icons ] && cp -r .icons ~/
[ -d .themes ] && cp -r .themes ~/

if [ -d ".zen-profile" ]; then
    echo "🎨 جاري تطبيق تخصيص Zen Browser الخارق..."
    ZEN_DIR=$(ls -d ~/.var/app/io.github.zen_browser.zen/.zen/*.default* ~/.zen/*.default* 2>/dev/null | head -n 1)
    if [ -n "$ZEN_DIR" ]; then
        cp -r .zen-profile/* "$ZEN_DIR/" 2>/dev/null
    else
        mkdir -p ~/.zen/default.default
        cp -r .zen-profile/* ~/.zen/default.default/ 2>/dev/null
    fi
fi

fc-cache -fv
echo "✅ تم تثبيت كل شيء بنجاح! استمتع بنظامك الخارق."

if [ -d "limine-config" ]; then
    echo "⚡ ضبط وتثبيت تخصيص Limine Bootloader..."
    sudo cp -r limine-config/limine /boot/ 2>/dev/null
    sudo cp -r limine-config/limine /efi/ 2>/dev/null
    [ -f "limine-config/limine.conf" ] && sudo cp limine-config/limine.conf /boot/ 2>/dev/null
    [ -f "limine-config/limine.conf" ] && sudo cp limine-config/limine.conf /efi/ 2>/dev/null
fi
