{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [ wofi ];
    file.".config/wofi/style.css".source = ../dotfiles/wofi/style.css;
  };
}