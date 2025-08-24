{ ... }:

{
  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        # "xhci_pci"
        # "sr_mod"
      ];
      kernelModules = [ "dm-snapshot" ];

      luks.devices."cryptroot" = {
        device = "/dev/vda2";
        preLVM = true;
      };
    };
    # extraModulePackages = [ ];
  };
}