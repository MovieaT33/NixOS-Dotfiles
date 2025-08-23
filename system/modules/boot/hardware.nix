{ modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  fileSystems."/" = {
    device = "/dev/mapper/vg0-root";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/vda1";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/nix" = {
    device = "/dev/mapper/vg0-nix";
    fsType = "ext4";
  };

  fileSystems."/home" = {
    device = "/dev/mapper/vg0-home";
    fsType = "ext4";
  };

  fileSystems."/var" = {
    device = "/dev/mapper/vg0-var";
    fsType = "ext4";
  };

  fileSystems."/tmp" = {
    device = "/dev/mapper/vg0-tmp";
    fsType = "ext4";
  };

  fileSystems."/var/tmp" = {
    device = "/dev/mapper/vg0-var_tmp";
    fsType = "ext4";
  };

  swapDevices = [
    { device = "/dev/mapper/vg0-swap"; }
  ];
}