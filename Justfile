PROFILE := "personal"

update:
    sudo git pull

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

upgrade: update sync
