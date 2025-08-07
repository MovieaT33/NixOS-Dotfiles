PROFILE := "personal"

default: upgrade

update:
    sudo git pull

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

upgrade: update sync

clean:
    nix-collect-garbage -d
