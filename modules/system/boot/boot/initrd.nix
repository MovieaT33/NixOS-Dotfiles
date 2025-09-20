{ ... }:

{
  # region [ Kernel modules ]
  boot.initrd = {
    availableKernelModules = [
      # "ahci"                          # SATA drives
      # "xhci_pci"                      # USB 3.0 / 3.1
      # "sr_mod"                        # SCSI CD / DVD
    ];
    kernelModules = [ "dm-snapshot" ];  # Device-mapper snapshot
  };
  # endregion

  # region [ Encryption: LUKS ]
  boot.initrd.luks.devices = {
    "crypt_root" = {
      device = "/dev/vda2";
      preLVM = true;
    };
  };
  # endregion

  # region [ QEMU profile ]
  boot.initrd = {
    availableKernelModules = [
      "virtio_blk"      # block device (disk)
      "virtio_pci"      # peripheral component interconnect
      # "virtio_mmio"   # memory mapped i/o
      # "virtio_scsi"   # small computer system interface
      "virtio_net"      # virtio network interface
      # "9p"            # 9p filesystem
      # "9pnet_virtio"  # network transport for 9p
    ];
    kernelModules = [
      "virtio_balloon"  # dynamic RAM management for VM
      "virtio_console"  # virtual console for communication with the hypervisor
      "virtio_gpu"      # virtual GPU
      "virtio_rng"      # virtual random number generator
    ];
  };
  boot.kernelModules = [ "kvm-intel" ];
  # endregion

  # region [ Crash dump ]
  boot.crashDump = {
    enable = true;
    kernelParams = [
      "console=tty0,115200"
      "boot.shell_on_fail"
    ];
    reservedMemory = "256M";
  };
  # endregion
}