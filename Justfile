# Variables
PROFILE := "personal"

# Aliases
alias v := version
alias i := install
alias s := sync
alias f := update-flake
alias u := update
alias U := fast-update
alias r := repair
alias c := clean
alias l := list
alias g := upgrade
alias G := fast-upgrade

# default target: `upgrade`
default: upgrade

# shows the latest repository commit
version:
    doas git log -1 --oneline

# install nixos
install:
    sudo ./install_nixos.py

# sync local repository with remote
sync:
    doas git fetch --depth 1
    doas git reset --hard origin/main

# update flake.lock to the latest versions
update-flake:
    doas nix flake update

# rebuild NixOS with current profile
update:
    doas nixos-rebuild switch --flake .#{{PROFILE}}

# fast update: rebuild without re-exec
fast-update:
    doas nixos-rebuild switch --flake .#{{PROFILE}} --no-reexec

# verify Nix store integrity and repair if necessary
repair:
    doas nix-store --verify --check-contents --repair

# clean old generations and garbage
clean:
    doas nix-env --delete-generations old --profile /nix/var/nix/profiles/system
    doas nix-collect-garbage -d

# list all system generations (profiles)
list:
    doas nix-env -p /nix/var/nix/profiles/system --list-generations

# sync repository, update flake.lock, rebuild NixOS, and show current version 
upgrade: sync update-flake update version

# sync repository, rebuild without re-exec, and show current version
fast-upgrade: sync fast-update version
