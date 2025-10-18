#!/bin/bash

# ==================================================================================
# My Hyprland DE - Complete Installation Script (v4 - Final)
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
# Using arrays is more robust than multi-line commands with backslashes.
packages_pacman=(
    # Core Desktop & Utilities
    hyprland waybar wofi kitty dolphin pavucontrol blueman
    # Theming & Fonts
    kvantum qt5ct qt6ct ttf-firacode-nerd
    # System & Services
    bluez bluez-utils pipewire wireplumber xdg-utils desktop-file-utils
    # Screenshot & Media
    grim slurp swappy mpv imv
    # Screen Recording
    obs-studio xdg-desktop-portal-hyprland luajit
    # Engineering & Electronics
    kicad # The main KiCad package now includes all libraries and footprints
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

# --- Copy Configuration Files (
