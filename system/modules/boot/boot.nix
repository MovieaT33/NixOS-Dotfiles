{ ... }:

{
  boot = {
    initrd = {
      availableKernelModules = [
        "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk"
      ];
      kernelModules = [ "dm-snapshot" ];

      luks.devices."cryptroot" = {
        device = "/dev/vda2";
        preLVM = true;
      };
    };
    kernelModules = [ "kvm-intel" ];
    # extraModulePackages = [ ];
  };
}