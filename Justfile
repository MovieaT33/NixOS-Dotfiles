# Aliases
alias v := version
alias i := install

alias s := sync
alias u := update
alias d := deploy
alias D := fast-deploy

alias r := repair
alias c := clean

alias l := profiles

alias p := packages-upgrade
alias g := upgrade
alias G := fast-upgrade

# default target: `upgrade`
default: upgrade

# shows the latest repository commit
version:
    sudo git log -1 --oneline

# install nixos using bash script
install:
    chmod +x ./scripts/{install_nixos,cleanup}
    ./scripts/install_nixos

# sync local repository with remote
sync:
    sudo git fetch --depth 1
    sudo git reset --hard origin/main

# update flake.lock to the latest version
update:
    sudo nix flake update

# deploy configuration with current profile
deploy:
    sudo nixos-rebuild switch --flake nixos --quiet

# deploy without re-exec
fast-deploy:
    sudo nixos-rebuild switch --flake nixos --quiet --no-reexec

# verify nix store integrity and repair if necessary
repair:
    sudo nix-store --verify --check-contents --repair

# clean old generations and garbage
clean:
    sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system
    sudo nix-collect-garbage -d

# list all profiles
profiles:
    sudo nix-env -p /nix/var/nix/profiles/system --list-generations

# upgrade all system packages and rebuild NixOS
packages-upgrade:
    sudo nixos-rebuild switch --upgrade

# sync repository, rebuild NixOS, update flake.lock, and show current version 
upgrade: sync deploy update version

# sync repository, rebuild without re-exec, and show current version
fast-upgrade: sync fast-deploy version
