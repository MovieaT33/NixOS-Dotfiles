{ config, ... }:

{
  security.sudo.extraRules = ''
    mvt33 ALL=(ALL) NOPASSWD: /run/current-system/sw/bin/reboot
  '';
}