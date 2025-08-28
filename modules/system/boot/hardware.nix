{ ... }:

{
  # region [ Partitions ]
  fileSystems = {
    "/" = {
      device = "/dev/mapper/vg0-root";
      fsType = "ext4";
      options = [ "noatime" "relatime" "errors=remount-ro" ];
    };

    "/boot" = {
      device = "/dev/vda1";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" "noatime" ];
    };

    "/nix" = {
      device = "/dev/mapper/vg0-nix";
      fsType = "ext4";
      options = [ "noatime" "relatime" ];
    };

    "/home" = {
      device = "/dev/mapper/vg0-home";
      fsType = "ext4";
      options = [ "noatime" ];
    };

    "/var" = {
      device = "/dev/mapper/vg0-var";
      fsType = "ext4";
      options = [ "noatime" ];
    };

    "/tmp" = {
      device = "/dev/mapper/vg0-tmp";
      fsType = "tmpfs";
      options = [ "mode=1777" ];
    };

    "/var/tmp" = {
      device = "/dev/mapper/vg0-var_tmp";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };
  # endregion

  # region [ Swap ]
  swapDevices = [
    { device = "/dev/mapper/vg0-swap"; }
  ];
  # endregion
}