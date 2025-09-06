{ ... }:

{
  # QEMU profile
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
}