{ config, pkgs, ... }:

{
  users.users.root = {
    shell = "/sbin/nologin";
  };
}