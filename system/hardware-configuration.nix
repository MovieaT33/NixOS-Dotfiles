{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  # Bootloader
  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [];

  # Filesystems
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/f2d2779e-8298-4ad0-9bd7-33e7a31d87bf";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/31A1-9776";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/4284b254-d79f-42ac-8851-6b84a68e8f2e";
    fsType = "ext4";
  };

  fileSystems."/tmp" = {
    device = "/dev/disk/by-uuid/d30e4978-4800-4b36-8f0f-65125bc8ab88";
    fsType = "ext4";
  };

  fileSystems."/var" = {
    device = "/dev/disk/by-uuid/21ecdd54-1b76-4b43-ae4c-44deedaecb26";
    fsType = "ext4";
  };

  # Swap
  swapDevices = [ ];

  # Network
  networking.useDHCP = lib.mkDefault true;

  # Packages
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}