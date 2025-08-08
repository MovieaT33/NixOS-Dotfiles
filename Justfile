PROFILE := "personal"

alias i := install
alias u := update
alias s := sync
alias g := upgrade
alias c := clean

default: upgrade

# install nixos
install:
    ./install_nixos.py

# update the repository
update:
    sudo git fetch --depth 1
    sudo git reset --hard origin/main

# sync nixos configuration with profile
sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

# upgrade: runs update then sync
upgrade: update sync

# clean nix garbage cache
clean:
    sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
    sudo nix-collect-garbage -d
