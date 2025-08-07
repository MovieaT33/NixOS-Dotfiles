PROFILE := "personal"

default: upgrade

install:
    ./install_nixos.py

update:
    sudo git pull

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

upgrade: update sync

clean:
    nix-collect-garbage -d
