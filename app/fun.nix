{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    asciiquarium
    cbonsai
    cmatrix
    cowsay
    figlet
    fortune
    hello
    hollywood
    sl
  ];
}