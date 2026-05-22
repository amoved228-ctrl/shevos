#!/usr/bin/env bash
set -euo pipefail

# Копирует конфиги в /etc/skel, чтобы Calamares-created user получил готовый Hyprland.
install -Dm644 configs/hypr/hyprland.conf archiso/airootfs/etc/skel/.config/hypr/hyprland.conf
install -Dm644 configs/waybar/config archiso/airootfs/etc/skel/.config/waybar/config
install -Dm644 configs/waybar/style.css archiso/airootfs/etc/skel/.config/waybar/style.css
install -Dm644 configs/kitty/kitty.conf archiso/airootfs/etc/skel/.config/kitty/kitty.conf
install -Dm644 configs/rofi/config.rasi archiso/airootfs/etc/skel/.config/rofi/config.rasi
