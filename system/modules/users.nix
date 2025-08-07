{ config, ... }:

{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  users.users.mvt33 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    useDefaultShell = true;
  };
}