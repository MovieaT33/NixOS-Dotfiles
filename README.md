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
- **Security:** ClamAV + Lynis audit (score: 74/100)  
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
   nix-shell -p just python314

2. Clone this repository:
   ```bash
   git clone https://github.com/MovieaT33/NixOS-Dotfiles --depth 1

3. `cd NixOS-Dotfiles`

4. `chmod +x install_nixos.py`

5. Run installation script:
   ```bash
   just i

*Rebooting...*

### Dotfiles

6. Enter to `root` account

7. Install dependencies:
   ```bash
   nix-shell -p git just

8. `cd /etc`

9. `rm -rf nixos`

10. Clone dotfiles:
    ```bash
    git clone https://github.com/MovieaT33/NixOS-Dotfiles nixos

11. `cd nixos`

12. In label `update` of `justfile` change `doas` to `sudo` using nano editor: `nano justfile`

13. Sync NixOS with the configuration:
    ```bash
    just u

14. Change password for user:
    ```bash
    passwd <username>

15. Reboot system:
    ```bash
    reboot now

*README.md in processing...*
