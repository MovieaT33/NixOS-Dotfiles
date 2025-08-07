{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ shadow ];

  users.users.root = {
    shell = "${pkgs.shadow}/bin/nologin";
  };

  users.users.root.hashedPassword = "!";
}