{ config, ... }:

let
  rebootBin = "${config.systemd.package}/bin/reboot";
  shutdownBin = "${config.systemd.package}/bin/shutdown";
in
{
  security.sudo.extraRules = [
    {
      users = [ "mvt33" ];
      commands = [
        { command = rebootBin; options = [ "NOPASSWD" ]; }
        { command = shutdownBin; options = [ "NOPASSWD" ]; }
      ];
    }
  ];
}