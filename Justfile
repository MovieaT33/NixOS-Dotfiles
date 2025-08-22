# Config
PROFILE := "personal"

# Aliases
alias i := install

alias s := sync
alias u := update
alias g := upgrade
alias v := verify
alias c := clean

default: upgrade

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

# upgrade: runs update then sync
upgrade: sync update

# verify nix store integrity and repair if needed
verify:
    sudo nix-store --verify --check-contents --repair

# clean nix garbage cache
clean:
    sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
    sudo nix-collect-garbage -d
