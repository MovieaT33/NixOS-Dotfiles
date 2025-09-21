{ home-manager, pkgs, ... }:

{
  home-manager.users."mvt33" = import ../../app/config/home-modules/zsh.nix;

  users.users = {
    "mvt33" = {
      shell = "${pkgs.zsh}/bin/zsh";
      ignoreShellProgramCheck = true;
    };
  };
}