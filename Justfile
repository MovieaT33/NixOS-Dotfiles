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
    sudo git log -1 --oneline

# install nixos
install:
    ./install_nixos.py

# sync local repository with remote
sync:
    sudo git fetch --depth 1
    sudo git reset --hard origin/main

# update flake.lock to the latest versions
update-flake:
    sudo nix flake update

# rebuild NixOS with current profile
update:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

# fast update: rebuild without re-exec
fast-update:
    sudo nixos-rebuild switch --flake .#{{PROFILE}} --no-reexec

# verify Nix store integrity and repair if necessary
repair:
    sudo nix-store --verify --check-contents --repair

# clean old generations and garbage
clean:
    sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
    sudo nix-collect-garbage -d

# list all system generations (profiles)
list:
    sudo nix-env -p /nix/var/nix/profiles/system --list-generations

# sync repository, update flake.lock, rebuild NixOS, and show current version
upgrade: sync update-flake update version

# sync repository, update flake.lock, rebuild without re-exec, and show current version
fast-upgrade: sync update-flake fast-update version
