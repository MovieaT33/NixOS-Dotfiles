{ ... }:

{
  boot.initrd = {
    # region [ Kernel modules ]
    availableKernelModules = [
      "ahci"                            # SATA drives
      # "xhci_pci"                      # USB 3.0 / 3.1
      # "sr_mod"                        # SCSI CD / DVD
    ];
    kernelModules = [ "dm-snapshot" ];  # Device-mapper snapshot
    # endregion

    # region [ Luks devices ]
    luks.devices."cryptroot" = {
      device = "/dev/vda2";
      preLVM = true;
    };
    # endregion
  };
}