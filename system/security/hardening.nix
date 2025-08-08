{ config, ... }:

{
  systemd.tmpfiles.rules = [
    "d /etc/nixos 0750 root wheel -"
  ];
}