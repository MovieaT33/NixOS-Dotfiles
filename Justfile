PROFILE := "personal"

update:
    sudo git pull

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

@default
upgrade: update sync
