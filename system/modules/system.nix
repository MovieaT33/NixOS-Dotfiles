{ config, ... }:

{
  system.stateVersion = "25.05";

  system.autoUpgrade.enable = true;

  nix.settings.sandbox = true;

  nix.settings.auto-optimise-store = true;

  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";

  nix.settings.experimental-features = [ "nix-daemon" "nix-command" "flakes" ];
}