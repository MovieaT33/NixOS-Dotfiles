PROFILE := "personal"

upgrade: update sync

update:
    sudo git pull

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}
