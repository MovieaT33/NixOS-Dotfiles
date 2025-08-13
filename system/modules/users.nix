{ config, pkgs, ... }:

{
  imports = [ ../../app/config/zsh.nix ];
  users.defaultUserShell = pkgs.zsh;

  users.users.mvt33 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    useDefaultShell = true;
  };
}