{ pkgs, ... }:

{
  imports = [ ../../../app/config/zsh.nix ];

  users.users = {
    mvt33 = {
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
    };
  };
}