{ config, ... }:

let
  loginDefsConf = ./config/login.defs;
in
{
  # environment.etc."login.defs".source = loginDefsConf;
}