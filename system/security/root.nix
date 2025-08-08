{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ shadow ];

  users.users.root.password = "*";

  users.users.root = {
    shell = "${pkgs.shadow}/bin/nologin";
  };
}