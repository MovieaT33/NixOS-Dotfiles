{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  home.file.".config/kitty/kitty.conf".source = ../dotfiles/kitty.conf;

  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.theme = "afowler";
  programs.zsh.ohMyZsh.plugins = [ "git" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
}