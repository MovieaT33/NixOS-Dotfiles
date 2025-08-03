{ config, pkgs, ... }:

{
  users.users.root = {
    shell = pkgs.nologin;
  };
}