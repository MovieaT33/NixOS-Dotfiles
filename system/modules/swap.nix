{ config, ... }:

{
  swapDevices = [
    { device = "/dev/vg0/swap"; }
  ];

  systemd.services.swapoff-before-shutdown = {
    description = "Turn off swap before shutdown";
    wantedBy = [ "shutdown.target" ];
    before = [ "shutdown.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/run/current-system/sw/bin/swapoff -a";
    };
  };
}