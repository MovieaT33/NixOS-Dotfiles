PROFILE := "personal"
NIXOS_USER := "/etc/nixos-user"

clean:
    nix-collect-garbage -d

update:
    sudo git fetch --depth 1
    sudo git reset --hard origin/main

sync-user:
    cp -r {{NIXOS_USER}}/* .
    sudo git add .

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

full-update: update sync-user

upgrade: full-update sync
