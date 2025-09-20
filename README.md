# NixOS Dotfiles

![NixOS](https://img.shields.io/badge/NixOS-000?style=for-the-badge&logo=nixos&logoColor=white)<br>
[![GitHub commit](https://img.shields.io/github/commit-activity/m/MovieaT33/NixOS-Dotfiles?label=acivity)](https://github.com/MovieaT33/NixOS-Dotfiles/commits)
[![GitHub last commit](https://img.shields.io/github/last-commit/MovieaT33/NixOS-Dotfiles)](https://github.com/MovieaT33/NixOS-Dotfiles/commits)
[![License: GPL v3.0](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

> **My personal dotfiles and system configurations for NixOS**, including environment setup, scripts, and essential tools for quick system deployment.

---

## 📌 Project Overview

This repository contains my personal **dotfiles** and configurations for **NixOS**, including:

- **Shell:** Zsh  
- **Editor:** Neovim  
- **Window Manager:** Hyprland  
- **Security:** ClamAV + Lynis audit (score: 73/100)  
- **Privilege Management:** `doas`  
- **Disk Layout:** 6 partitions + swap  

> You can change the default username (`mvt33`) in the configuration files to your own.

---

## ⚡ Features

- Automated installation using `just`
- Easy update of dotfiles via `just G`
- Supports switching `doas` to `sudo` for compatibility with other systems
- Organized structure for quick NixOS setup

---

## 🛠 Installation

## WSL

If you use Windows install WSL and virt-manager first.

1. Install WSL:
   ```bash
   wsl --install

2. Install **Ubuntu distribution**:
   ```bash
   wsl --install -d Ubuntu-25.04

3. Install virt-manager
   ```bash
   sudo apt install virt-manager

## Virt-manager

4. Install **minimal ISO image** from [NixOS Download](https://nixos.org/download/) using **virt-manager**

5. Change firmware to **UEFI x86_64: /usr/share/OVMF/OVMF_CODE_4M.fd**

---

### NixOS Installation 

1. Install dependencies to LiveCD:
   ```bash
   nix-shell -p just

2. Clone this repository:
   ```bash
   git clone https://github.com/MovieaT33/NixOS-Dotfiles --depth 1

3. `cd NixOS-Dotfiles`

4. Run installation script:
   ```bash
   just i

*Rebooting...*

### Dotfiles

5. Install dependencies:
   ```bash
   nix-shell -p git just

6. `cd /etc`

7. `rm -rf nixos`

8. Clone dotfiles:
    ```bash
    git clone https://github.com/MovieaT33/NixOS-Dotfiles nixos --depth 1

9. `cd nixos`

10. In label `update` of `justfile` change `doas` to `sudo` using nano editor: `sudo nano justfile`

11. Sync NixOS with the configuration:
    ```bash
    just u

12. Change password for user:
    ```bash
    passwd <user>

13. Reboot system:
    ```bash
    sudo reboot now

*README.md in processing...*
