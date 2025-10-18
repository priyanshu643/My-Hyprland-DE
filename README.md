# My Custom Hyprland DE

A complete set of dotfiles and an installation script for a personalized, glass-themed Hyprland desktop on Arch Linux. This setup is designed to be minimal, aesthetically pleasing, and functional for a development and electronics workflow. 🖥️✨

![Desktop Preview](https://i.imgur.com/your-screenshot-url.png)

## ✨ Features

* **Modern Hyprland Setup:** A fast, fluid, and customizable Wayland compositor.
* **Unified Frosted Glass Theme:** A consistent blur effect across the Waybar, terminal (Kitty), and application launcher (Wofi).
* **Lightweight & Performant:** All components are chosen for their speed and low resource usage.
* **Pre-configured Keybinds:** Sensible shortcuts for launching apps, managing windows, and controlling the system.
* **Automated Installation:** A single command to deploy the entire environment on a fresh Arch Linux install.

***

## 🧱 Core Components

This desktop environment is built by combining several individual components, each with a specific purpose:

| Component | Software Used | Purpose |
| :--- | :--- | :--- |
| **Window Manager** | `Hyprland` | The core that draws and manages all windows. |
| **Status Bar** | `Waybar` | Displays workspaces, system info, time, etc. |
| **Application Launcher**| `Wofi` | A fast, keyboard-driven menu to launch apps. |
| **Wallpaper Manager** | `Waypaper` | A GUI tool for setting and managing wallpapers. |
| **Terminal Emulator** | `Kitty` | A fast, feature-rich, GPU-accelerated terminal. |
| **File Manager** | `Dolphin` | The default file manager. |
| **Screenshot Tool** | `grim` + `slurp` | Lightweight utilities for capturing the screen. |
| **Screenshot Editor** | `swappy` | A simple tool for editing screenshots. |
| **Audio/Bluetooth Control**| `pavucontrol`/`blueman`| GUI tools for managing audio and Bluetooth devices. |

***

## 🚀 Installation Guide

The process is two steps: performing a minimal Arch Linux installation, then running the deployment script.

### Step 1: Base Arch Linux Installation

First, follow the official Arch Linux installation guide. When you install packages with `pacstrap`, you only need a minimal set of tools.

Your `pacstrap` command should look something like this:
```bash
# pacstrap -K /mnt base linux linux-firmware networkmanager git nano
