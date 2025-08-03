{ config, pkgs, ... }:

{
  environment.systemPackages = [
    torsocks
  ];
}