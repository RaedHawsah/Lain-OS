# Lain-OS: Serial Experiments Lain Rice for CachyOS

## Fast One-Liner Install
```bash
git clone [https://github.com/RaedHawsah/Lain-OS.git](https://github.com/RaedHawsah/Lain-OS.git) ~/Lain-OS && cd ~/Lain-OS && chmod +x install.sh && ./install.sh
```

## System Components
- Window Manager: Hyprland
- Terminal: Kitty
- Multiplexer: Zellij
- Browser: Zen Browser
- Launchers & Bars: Waybar, Rofi, Wofi, Dunst

## Troubleshooting
Black Screen Fix:
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg
