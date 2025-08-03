PROFILE := "personal"
NIXOS_USER := "/etc/nixos-user"

clean:
    nix-collect-garbage -d

update:
    git fetch origin main --depth 1
    git reset --hard origin/main

sync-user:
    cp -r {{NIXOS_USER}}/* .
    git add .

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

full-update: update sync-user

upgrade: full-update sync
