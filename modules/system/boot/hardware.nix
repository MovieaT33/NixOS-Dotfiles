{ ... }:

{
  # region [ Partitions ]
  fileSystems = {
    "/" = {
      device = "/dev/vg_root/root";
      fsType = "ext4";
      options = [ "noatime" "relatime" "errors=remount-ro" ];
    };

    # "/" = {
    #   device = "none";
    #   fsType = "tmpfs";
    #   options = [ "noatime" "relatime" "errors=remount-ro" ];
    # };

    "/boot" = {
      device = "/dev/vda1";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022"
                  "noatime" "nosuid" "nodev"
      ];
    };

    "/nix" = {
      device = "/dev/vg_root/nix";
      fsType = "ext4";
      options = [ "noatime" "relatime" "nodev "];
    };

    "/home" = {
      device = "/dev/vg_root/home";
      fsType = "ext4";
      options = [ "noatime" "noexec" "nosuid" "nodev" ];
    };

    "/var" = {
      device = "/dev/vg_root/var";
      fsType = "ext4";
      options = [ "noatime" "nosuid" "nodev" "noexec" ];
    };

    "/tmp" = {
      device = "/dev/vg_root/tmp";
      fsType = "tmpfs";
      options = [ "mode=1777" "nosuid" "nodev" "noexec" ];
    };

    "/var/tmp" = {
      device = "/dev/vg_root/var_tmp";
      fsType = "ext4";
      options = [ "noatime" ];
    };

    # "/secure" = {
    #   device = "/dev/vg_data/secure";
    #   fsType = "ext4";
    # };
  };
  # endregion

  # region [ Swap ]
  swapDevices = [
    {
      device = "/dev/vg_root/swap";
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