{ pkgs, ... }:

{
  imports = [ ../../../app/config/zsh.nix ];

  users.users = {
    mvt33 = {
      # uid = 1000;
      isNormalUser = true;
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
    };
  };
}