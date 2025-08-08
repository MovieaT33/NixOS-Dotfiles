{ config, ... }:

{
  systemd.tmpfiles.rules = [
    "d /etc/nixos 0700 root root -"
    "d /root 0700 root root -"
  ];
}