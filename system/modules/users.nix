{ config, pkgs, ... }:

{
  imports = [ ../../app/zsh.nix ];
  users.defaultUserShell = pkgs.zsh;

  users.users.mvt33 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    useDefaultShell = true;
  };
}