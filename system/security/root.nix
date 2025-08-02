{ config, pkgs, ... }:

{
  users.users.root = {
    password = "!";
  };
}