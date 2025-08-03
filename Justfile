PROFILE := "personal"
NIXOS_USER := "/etc/nixos-user"

clean:
    nix-collect-garbage -d

update:
    git fetch --depth 1
    git reset --hard

sync-user:
    cp -r {{NIXOS_USER}} .

sync:
    git add system/modules/hardware.nix
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

upgrade: update sync-user sync
