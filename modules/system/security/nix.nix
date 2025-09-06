{ ... }:

{
  nix.settings = {
    allowed-users = [ "root" ];

    trusted-public-keys = [
      "cache.nixos.org-1:WfjE0D7p7cJ1/I4zi4TXpm0HzYkgN2V+yihH6hjj8Zc="
    ];
    require-sigs = true;
  };
}