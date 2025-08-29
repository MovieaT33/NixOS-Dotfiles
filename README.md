# NixOS Dotfiles

![NixOS](https://img.shields.io/badge/NixOS-000?style=for-the-badge&logo=nixos&logoColor=white)<br>
[![GitHub commit](https://img.shields.io/github/commit-activity/m/MovieaT33/NixOS-Dotfiles?label=acivity)](https://github.com/MovieaT33/NixOS-Dotfiles/commits)
[![GitHub last commit](https://img.shields.io/github/last-commit/MovieaT33/NixOS-Dotfiles)](https://github.com/MovieaT33/NixOS-Dotfiles/commits)
[![License: GPL v3.0](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

My NixOS dotfiles:

**OS**: NixOS (in virt-manager on WSL)
**Disk**: 6 partitions + swap
**Sudo**: doas
**Antivirus**: ClamAV
**Security (lynis audit)**: 74 / 100
**User**: `mvt33` (you can change it in configs)
**Shell**: Zsh
**Editor**: Neovim
**Window Manager**: Hyprland

## Usage

### NixOS Installation 

1. `nix-shell -p just python314`

2. `git clone https://github.com/MovieaT33/NixOS-Dotfiles --depth 1`

3. `cd NixOS-Dotfiles`

4. `chmod +x install_nixos.py`

5. `just i`

*Rebooting...*

### Dotfiles

6. Enter to `root` account

7. `nix-shell -p git just`

8. `cd /etc`

9. `rm -rf nixos`

10. `git clone https://github.com/MovieaT33/NixOS-Dotfiles nixos`

11. `cd nixos`

12. In label `update` of `justfile` change `doas` to `sudo` using nano editor: `nano justfile`

13. `just u`

14. `passwd mvt33`

15. `reboot now`

*README.md in processing...*
