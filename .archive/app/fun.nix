{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    _2048-in-terminal
    aalib
    asciiquarium
    bb
    boxes
    cbonsai
    # charasay
    cmatrix
    cowsay
    figlet
    fortune
    genact
    hello
    hollywood
    libcaca
    lolcat
    mapscii
    nyancat
    # pokemonsay
    ponysay
    rig
    sl
    starfetch
    # tewisay
    toilet
    typespeed
  ];
}