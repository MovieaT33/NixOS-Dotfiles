{ pkgs, ... }:

{
  imports = [ ../../app/config/zsh.nix ];

  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      mvt33 = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        useDefaultShell = true;
      };
    };
  };
}