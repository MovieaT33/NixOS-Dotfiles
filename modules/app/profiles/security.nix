{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kpcli
  ];
}