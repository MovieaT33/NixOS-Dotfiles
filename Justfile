PROFILE := "personal"
NIXOS_USER := "/etc/nixos-user"

clean:
    nix-collect-garbage -d

update:
    git fetch --depth 1
    git reset --hard

sync-user:
    cp -r {{NIXOS_USER}}/* .
    git add .

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

full-update: update sync-user

upgrade: full-update sync
