{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    _2048-in-terminal
    aalib
    bb
    boxes
    # charasay
    cowsay
    figlet
    fortune
    genact
    libcaca
    nyancat
    # pokemonsay
    ponysay
    # tewisay
    toilet
    typespeed
  ];
}