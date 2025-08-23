{ modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")  # FIXME: extract into a new separated module
  ];

  # Filesystem
  fileSystems = {
    "/" = {
      device = "/dev/mapper/vg0-root";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/vda1";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

    "/nix" = {
      device = "/dev/mapper/vg0-nix";
      fsType = "ext4";
    };

    "/home" = {
      device = "/dev/mapper/vg0-home";
      fsType = "ext4";
    };

    "/var" = {
      device = "/dev/mapper/vg0-var";
      fsType = "ext4";
    };

    "/tmp" = {
      device = "/dev/mapper/vg0-tmp";
      fsType = "ext4";
    };

    "/var/tmp" = {
      device = "/dev/mapper/vg0-var_tmp";
      fsType = "ext4";
    };
  };

  # Swap
  swapDevices = [
    { device = "/dev/mapper/vg0-swap"; }
  ];
}