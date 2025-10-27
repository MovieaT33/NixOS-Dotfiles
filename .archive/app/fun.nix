{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    _2048-in-terminal
    aalib
    # charasay
    genact
    libcaca
    # pokemonsay
    # tewisay
  ];
}