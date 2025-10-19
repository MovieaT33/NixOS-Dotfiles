{ home-manager, pkgs, ... }:

{
  home-manager.users."mvt33" = { imports = [
    ../../app/config/home-modules/shells/zsh.nix
    ../../app/config/home-modules/shells/utilities.nix
  ]; };

  home-manager.users."root" = { imports = [
    ../../app/config/home-modules/shells/zsh.nix
    ../../app/config/home-modules/shells/utilities.nix
  ]; };

  users.users = {
    "mvt33" = {
      shell = "${pkgs.zsh}/bin/zsh";
      ignoreShellProgramCheck = true;
    };
    "root" = {
      shell = "${pkgs.zsh}/bin/zsh";
      ignoreShellProgramCheck = true;
    };
  };
}