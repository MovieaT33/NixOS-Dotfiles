# TODO: Separate configuration into separated modules
{
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

      # Enable page allocator randomization
      "page_alloc.shuffle=1"
    ];

    blacklistedKernelModules = [
      # Obscure network protocols
      "ax25"
      "netrom"
      "rose"

      # Old or rare or insufficiently audited filesystems
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

    kernel.sysctl = {
      "kernel.yama.ptrace_scope" = 1;
      "net.core.bpf_jit_enable" = false;
      "kernel.ftrace_enabled" = false;
      "net.ipv4.conf.default.rp_filter" = 1;
      "net.ipv4.conf.all.secure_redirects" = false;
      "net.ipv4.conf.default.secure_redirects" = false;
      "net.ipv6.conf.all.accept_redirects" = false;
      "net.ipv6.conf.default.accept_redirects" = false;
      "net.ipv4.conf.default.send_redirects" = false;
    };
  };
}