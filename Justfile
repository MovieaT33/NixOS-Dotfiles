PROFILE := "personal"

default: upgrade

install:
    ./install_nixos.py

init:
    sudo git config pull.rebase true

update: init
    sudo git pull --depth 1

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

upgrade: update sync

clean:
    nix-collect-garbage -d
