{ config, ... }:

{
  security.sudo.extraRules = [
    {
      users = [ "mvt33" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/reboot";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}