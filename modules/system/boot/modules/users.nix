{ pkgs, ... }:

{
  imports = [ ../../../app/config/zsh.nix ];   # Shell

  users = {
    users = {
      mvt33 = {
        isNormalUser = true;
      };
    };
  };
}