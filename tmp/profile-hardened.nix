{ ... }:

{
  # TODO: Separate configuration into modules
  environment = {
    memoryAllocator.provider = "scudo";
    variables.SCUDO_OPTIONS = "ZeroContents=1";
  };

  boot = {
    kernelParams = [
      # Slab / slub sanity checks, redzoning, and poisoning
      "slub_debug=FZP"

      # Overwrite free'd memory
      "page_poison=1"
    ];

    blacklistedKernelModules = [
      "adfs"
      "affs"
      "bfs"
      "befs"
      "cramfs"
      "efs"
      "erofs"
      "exofs"
      "freevxfs"
      "f2fs"
      "hfs"
      "hpfs"
      "jfs"
      "minix"
      "nilfs2"
      "ntfs"
      "omfs"
      "qnx4"
      "qnx6"
      "sysv"
      "ufs"
    ];
  };
}