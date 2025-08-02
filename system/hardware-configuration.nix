{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  # Bootloader
  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # Filesystems
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/57a3f027-8752-4350-b7f5-d0d963ed076b";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0120-1530";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  # Swap
  swapDevices = [ ];

  # Network
  networking.useDHCP = lib.mkDefault true;

  # Packages
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}