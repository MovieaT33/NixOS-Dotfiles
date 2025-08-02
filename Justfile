PROFILE := "personal"

clean:
    nix-collect-garbage -d

update:
    git pull

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

upgrade: update sync
