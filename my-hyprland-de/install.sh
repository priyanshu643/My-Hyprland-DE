#!/bin/bash

# ==================================================================================
# My Hyprland DE - Complete Installation Script (v6 - Final)
# Author: Priyanshu
# This script installs and configures the full desktop environment.
# ==================================================================================

# --- Safety Check: Exit if any command fails ---
set -e

echo "======================================================"
echo "    STARTING INSTALLATION OF YOUR CUSTOM HYPRLAND DE"
echo "======================================================"

# --- Check for AUR Helper (yay) and Git ---
if ! command -v yay &> /dev/null; then
    echo "AUR helper 'yay' not found. Please install it first."
    exit 1
fi
if ! command -v git &> /dev/null;    then
    echo "Git not found. Please install it first with 'sudo pacman -S git'."
    exit 1
fi

# --- Update System ---
echo "[TASK] Updating system packages..."
sudo pacman -Syu --noconfirm

# --- Define Packages to Install ---
packages_pacman=(
    # Core Desktop & Utilities
    hyprland waybar wofi kitty dolphin pavucontrol blueman hyprpaper
    # System Monitors (NEWLY ADDED)
    btop fastfetch
    # Theming & Fonts
    kvantum qt5ct qt6ct ttf-firacode-nerd
    # System & Services
    bluez bluez-utils pipewire wireplumber xdg-utils desktop-file-utils
    # Explicit dependencies to avoid prompts
    pipewire-jack qt6-multimedia-ffmpeg
    # Screenshot & Media
    grim slurp swappy mpv imv
    # Screen Recording
    obs-studio xdg-desktop-portal-hyprland luajit
    # Engineering & Electronics
    kicad kicad-library kicad-library-3d
)

packages_aur=(
    waypaper
    arduino-legacy-1.8
    fallout-grub-theme-git
    google-chrome
)

# --- Install All Main Packages from Official Repos ---
echo "[TASK] Installing all main packages from official repositories..."
sudo pacman -S --noconfirm "${packages_pacman[@]}"

# --- Install All AUR Packages ---
echo "[TASK] Installing all packages from the AUR..."
yay -S --noconfirm "${packages_aur[@]}"

# --- Copy Configuration Files (Dotfiles) ---
echo "[TASK] Copying configuration files..."
mkdir -p ~/.config_backup
echo "Backing up existing configs to ~/.config_backup/"
mv ~/.config/hypr ~/.config_backup/ 2>/dev/null || true
mv ~/.config/waybar ~/.config_backup/ 2>/dev/null || true
mv ~/.config/kitty ~/.config_backup/ 2>/dev/null || true
mv ~/.config/wofi ~/.config_backup/ 2>/dev/null || true
mv ~/.config/mimeapps.list ~/.config_backup/ 2>/dev/null || true

# Copy new configs from the repository
echo "Copying new dotfiles..."
cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r kitty ~/.config/
cp -r wofi ~/.config/
cp mimeapps.list ~/.config/

# --- Enable All System Services ---
echo "[TASK] Enabling system services..."
sudo systemctl enable --now bluetooth.service
echo "Bluetooth service enabled."

# --- Apply the GRUB Theme ---
echo "[TASK] Applying the Fallout GRUB theme..."
# This command now replaces the line whether it starts with '#' or not
sudo sed -i 's|^#*GRUB_THEME=.*|GRUB_THEME="/usr/share/grub/themes/fallout-grub-theme-git/theme.txt"|' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "GRUB theme has been set."

echo "======================================================"
echo "    INSTALLATION COMPLETE!"
echo "    Please reboot your system for all changes to apply."
echo "======================================================"
