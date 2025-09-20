{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # c
    calc
    # t
    tldr
  ];
}