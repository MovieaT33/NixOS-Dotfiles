{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git just  # repository and dotfiles management
  ];
}