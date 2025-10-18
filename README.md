# My Custom Hyprland DE
A complete set of dotfiles and an installation script for a personalized, glass-themed Hyprland desktop on Arch Linux. This setup is designed to be minimal, aesthetically pleasing, and functional for a development and electronics workflow. 🖥️✨

## ✨ Features

- Modern Hyprland Setup: A fast, fluid, and customizable Wayland compositor.
- Unified Frosted Glass Theme: A consistent blur effect across the Waybar, terminal (Kitty), and application launcher (Wofi).

- Lightweight & Performant: All components are chosen for their speed and low resource usage.

- Pre-configured Keybinds: Sensible shortcuts for launching apps, managing windows, and controlling the system.

- Automated Installation: A single command to deploy the entire environment on a fresh Arch Linux install.

## Core Components

This desktop environment is built by combining several individual components, each with a specific purpose:

| Component | Software Used |	Purpose |
| --- | --- | --- |
| Component | Software Used | Purpose |
| Window Manager | Hyprland | The core that draws and manages all windows. |
| Status Bar | Waybar | "Displays workspaces, system info, time, etc." |
| Application Launcher | Wofi | "A fast, keyboard-driven menu to launch apps." |
| Wallpaper Manager | Waypaper | A GUI tool for setting and managing wallpapers. |
| Terminal Emulator | Kitty | "A fast, feature-rich | GPU-accelerated terminal."|
| File Manager | Dolphin | The default file manager. |
| Screenshot Tool | grim + slurp | Lightweight utilities for capturing the screen. |
| Screenshot Editor | swappy | A simple tool for editing screenshots. |
|Audio/Bluetooth Control | pavucontrol/blueman | GUI tools for managing audio and Bluetooth devices.|

## Installation Guide

The process is two steps: performing a minimal Arch Linux installation, then running the deployment script.


### Step 1: Base Arch Linux Installation
First, follow the official Arch Linux installation guide. When you install packages with pacstrap, you only need a minimal set of tools.

Your pacstrap command should look something like this:

```bash
# pacstrap -K /mnt base linux linux-firmware networkmanager git nano
```

### Important:
- You must install git to be able to clone repositories.

- You must install a network manager like NetworkManager to have internet access after rebooting.

- You do not need to install audio (pipewire) or Bluetooth (bluez) packages. The installation script will handle this automatically.

### Step 2: Run the Installer Script

After you have completed the base Arch install, rebooted, and logged in as a regular user, you need to install an AUR helper like yay. You can find instructions here.

Once yay is installed, run the following single command to deploy the entire desktop environment:

```bash
curl -sSL https://raw.githubusercontent.com/priyanshu643/My-Hyprland-DE/main/my-hyprland-de/install.sh | bash

```

After the script finishes, it will prompt you to reboot your system. A reboot is required for all changes to take effect.

## ⌨️ Custom Keybindings

The main modifier key is the Super key (also known as the Windows key). The following table outlines the custom keybindings configured for this environment.

| Keybinding | Action |
| --- | --- |
| Application Launchers |	
| SUPER + Return | Open Terminal (Kitty)|
| SUPER + Space | Launch application menu (Wofi)|
| SUPER + E	| Open File Manager (Dolphin) |
| SUPER + B	| Launch Browser (Google Chrome) |
| SUPER + T	| Launch System Monitor (btop) |
| SUPER + V	| Launch VS Code |
| SUPER + K	| Launch KiCad |
| SUPER + A	| Launch Arduino IDE 1.8 |
| Window Management	|
| SUPER + W	| Close active window |
| SUPER + [Arrow Keys] | Move focus between windows |
| SUPER + P	| Toggle pseudo-tiling |
| SUPER + J	| Toggle split direction (dwindle layout)|
| Workspace Management |
| SUPER + [1-9]	| Switch to workspace 1-9 |
| SUPER + SHIFT + [1-9]	| Move active window to workspace 1-9 |
| System & Utilities	|
| SUPER + SHIFT + P |	Take a screenshot of a selected region (Swappy) |
| SUPER + S	| Edit Hyprland config (hyprland.conf) |

## Full Software List

The installation script will automatically install the following software:

- Core Desktop: Hyprland, Waybar, Wofi, Kitty, Dolphin

- Utilities: pavucontrol, blueman, grim + slurp + swappy

- Development: google-chrome, arduino-legacy-1.8

- Engineering: kicad with full libraries

- Media: mpv, imv, obs-studio

- Theming: kvantum, qt5ct, fallout-grub-theme-git, ttf-firacode-nerd
