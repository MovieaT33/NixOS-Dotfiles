{ home-manager, pkgs, ... }:

{
  home-manager.users."mvt33" = import ../../app/config/home-modules/shells/zsh.nix;
  home-manager.users."mvt33" = import ../../app/config/home-modules/shells/utilities.nix;

  # home-manager.users."root" = import ../../app/config/home-modules/shells/zsh.nix;
  # home-manager.users."root" = import ../../app/config/home-modules/shells/utilities.nix;

  users.users = {
    "mvt33" = {
      shell = "${pkgs.zsh}/bin/zsh";
      ignoreShellProgramCheck = true;
    };
    # "root" = {
    #   shell = "${pkgs.zsh}/bin/zsh";
    #   ignoreShellProgramCheck = true;
    # };
  };
}