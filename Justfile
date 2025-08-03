PROFILE := "personal"

clean:
    nix-collect-garbage -d

update:
    git fetch --depth 1
    git reset --hard

sync:
    git add system/modules/hardware.nix
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

upgrade: update sync
