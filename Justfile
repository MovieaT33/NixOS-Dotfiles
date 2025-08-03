PROFILE := "personal"

clean:
    nix-collect-garbage -d

update:
    git config pull.rebase true
    git pull --depth 1

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

upgrade: update sync
