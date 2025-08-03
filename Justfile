PROFILE := "personal"

clean:
    nix-collect-garbage -d

update:
    TMPFILE=$(mktemp) && \
    cp system/modules/hardware.nix "$$TMPFILE" && \
    git fetch --depth 1 origin && \
    git reset --hard origin/main && \
    git clean -fd && \
    mv "$$TMPFILE" system/modules/hardware.nix

sync:
    sudo nixos-rebuild switch --flake .#{{PROFILE}}

upgrade: update sync
