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

# set git config for pull rebase
init:
    sudo git config pull.rebase true

# update the repository
update: init
    sudo git pull origin main  --depth 1

# sync nixos configuration with profile
sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

# upgrade: runs update then sync
upgrade: update sync

# clean nix garbage cache
clean:
    sudo nix-collect-garbage -d
