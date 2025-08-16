{ config, pkgs, ... }:

{
  environment.systemPackages = [ eza ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      l = "exa -l --icons";
      ls = "exa -la --icons";
      j = "just";
    };

    ohMyZsh = {
      enable = true;
      theme = "afowler";
      plugins = [ "git" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
    };
  };
}