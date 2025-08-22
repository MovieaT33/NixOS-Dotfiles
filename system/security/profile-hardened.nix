{
  # Use the hardened memory allocator (scudo) with zeroing of allocated memory
  environment.memoryAllocator.provider = "scudo";
  environment.variables.SCUDO_OPTIONS = "ZeroContents=1";

  # Enable various kernel hardening features
  security.lockKernelModules = true;
  security.allowSimultaneousMultithreading = false;
  security.forcePageTableIsolation = true;
  security.unprivilegedUsernsClone = config.virtualisation.containers.enable;
  security.virtualisation.flushL1DataCache = "always";
  security.apparmor.killUnconfinedConfinables = true;

  boot.kernelParams = [
    # Slab/slub sanity checks, redzoning, and poisoning
    "slub_debug=FZP"

    # Overwrite free'd memory
    "page_poison=1"

    # Enable page allocator randomization
    "page_alloc.shuffle=1"
  ];

  boot.blacklistedKernelModules = [
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

  boot.kernel.sysctl."kernel.yama.ptrace_scope" = 1;
  boot.kernel.sysctl."net.core.bpf_jit_enable" = false;
  boot.kernel.sysctl."kernel.ftrace_enabled" = false;
  boot.kernel.sysctl."net.ipv4.conf.default.rp_filter" = 1;
  boot.kernel.sysctl."net.ipv4.conf.all.secure_redirects"     = false;
  boot.kernel.sysctl."net.ipv4.conf.default.secure_redirects" = false;
  boot.kernel.sysctl."net.ipv6.conf.all.accept_redirects"     = false;
  boot.kernel.sysctl."net.ipv6.conf.default.accept_redirects" = false;
  boot.kernel.sysctl."net.ipv4.conf.default.send_redirects" =   false;
}