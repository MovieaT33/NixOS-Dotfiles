PROFILE := "personal"

clean:
    nix-collect-garbage -d

update:
    git fetch --depth 1 origin
    git reset --hard origin/main

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

upgrade: update sync
