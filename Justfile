# Vars
PROFILE := "personal"

# Aliases
alias i := install

alias v := version
alias s := sync
alias u := update
alias U := fast-update
alias g := upgrade
alias G := fast-upgrade
alias r := repair
alias c := clean

# upgrade
default: upgrade

# shows the latest git commit
version:
    sudo git log -1 --oneline

# install nixos
install:
    ./install_nixos.py

# sync local repo with remote
sync:
    sudo git fetch --depth 1
    sudo git reset --hard origin/main

# sync nixos with profile
update:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

# fast update
fast-update:
    sudo nixos-rebuild switch --flake .#{{PROFILE}} --no-reexec

# runs update then sync
upgrade: sync update version

# fast upgrade
fast-upgrade: sync fast-update version

# verify nix store integrity and repair if needed
repair:
    sudo nix-store --verify --check-contents --repair

# clean nix garbage cache
clean:
    sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
    sudo nix-collect-garbage -d
