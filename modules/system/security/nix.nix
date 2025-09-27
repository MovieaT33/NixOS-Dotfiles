{ ... }:

{
  nix.settings = {
    allowed-users = [ "root" "mvt33" ];
    trusted-users = [ "mvt33" ];  # [ "root" "mvt33" ]

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cache.nixos.org-1:WfjE0D7p7cJ1/I4zi4TXpm0HzYkgN2V+yihH6hjj8Zc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    require-sigs = true;
  };
}