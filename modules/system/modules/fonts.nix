{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Nerd fonts
    nerd-fonts.jetbrains-mono
  ];
}