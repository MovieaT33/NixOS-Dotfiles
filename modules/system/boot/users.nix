{ pkgs, ... }:

{
  imports = [ ../../app/config/zsh.nix ];   # Shell

  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      mvt33 = {
        isNormalUser = true;
        useDefaultShell = true;
      };
    };
  };
}