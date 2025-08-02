{ config, pkgs, ... }:

{
  users.users.root = {
    password = "!";
    shell = pkgs.nixpkgs.lib.mkForce "/sbin/nologin";
  };
}