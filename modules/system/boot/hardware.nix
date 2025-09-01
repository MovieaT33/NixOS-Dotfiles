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
      options = [ "fmask=0022" "dmask=0022"
                  "noatime" "nosuid" "nodev"
      ];
    };

    "/nix" = {
      device = "/dev/mapper/vg0-nix";
      fsType = "ext4";
      options = [ "noatime" "relatime" "nosuid" "nodev "];
    };

    "/secure" = {
      device = "/dev/mapper/vg0-secure";
      fsType = "ext4";
      options = [
        "ro"          # read-only
        "nodev"
        "nosuid"
        "noexec"
        "errors=remount-ro"
        "relatime"
      ];
    };

    "/home" = {
      device = "/dev/mapper/vg0-home";
      fsType = "ext4";
      options = [ "noatime" "noexec" "nosuid" "nodev" ];
    };

    "/var" = {
      device = "/dev/mapper/vg0-var";
      fsType = "ext4";
      options = [ "noatime" "nosuid" "nodev" "noexec" ];
    };

    "/tmp" = {
      device = "/dev/mapper/vg0-tmp";
      fsType = "tmpfs";
      options = [ "mode=1777" "nosuid" "nodev" "noexec" ];
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
    {
      device = "/dev/mapper/vg0-swap";
      randomEncryption = {
        enable = true;
        cipher = "aes-xts-plain64";
        keySize = 256;
        sectorSize = 4096;
        source = "/dev/urandom";
        allowDiscards = true;
      };
      encrypted.label = "swap_crypt";
      options = [ "discard" ];
    }
  ];
  # endregion
}