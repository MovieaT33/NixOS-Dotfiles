{ pkgs, config, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_hardened;  # Hardened linux kernel
  security = {
    protectKernelImage = true;
    lockKernelModules = true;

    forcePageTableIsolation = true;
    # allowSimultaneousMultithreading = fa;se;  # commented here, because may cause failings

    # unprivilegedUsernsClone = true;             # config.virtualisation.containers.enable;
    virtualisation.flushL1DataCache = "always";
  };

  # TODO: Check configuration
  # TODO: Use bool (`false/true` instead of 0)

  boot.kernel.sysctl = {
    # "kernel.modules_disabled" = 1;
    "kernel.ftrace_enabled" = false;
    "kernel.core_uses_pid" = 1;
    "kernel.ctrl-alt-del" = 0;
    "kernel.kexec_load_disabled" = 1;
    "kernel.kptr_restrict" = 2;
    "kernel.perf_event_paranoid" = 3;
    "kernel.randomize_va_space" = 2;
    "kernel.sysrq" = 0;   # 4
    "kernel.unprivileged_bpf_disabled" = 1;
    "kernel.yama.ptrace_scope" = 3;
    "kernel.dmesg_restrict" = 1;
    "kernel.exec-shield" = 1;

    "fs.protected_fifos" = 2;
    "fs.protected_hardlinks" = 1;
    "fs.protected_regular" = 2;
    "fs.protected_mounts" = 1;
    "fs.protected_symlinks" = 1;
    "fs.suid_dumpable" = 0;

    "dev.tty.ldisc_autoload" = 0;

    # Network
    "net.core.bpf_jit_enable" = false;
    "net.core.bpf_jit_harden" = 2;
    "net.core.default_qdisc" = "cake";

    # IPv4
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv4.conf.all.bootp_relay" = 0;
    "net.ipv4.conf.all.forwarding" = 0;
    "net.ipv4.conf.all.log_martians" = 1;
    "net.ipv4.conf.all.mc_forwarding" = 0;
    "net.ipv4.conf.all.proxy_arp" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.all.secure_redirects" = false;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_source_route" = 0;
    "net.ipv4.conf.default.log_martians" = 1;
    "net.ipv4.conf.default.send_redirects" = false;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.default.secure_redirects" = false;
    "net.ipv4.icmp_echo_ignore_all" = 1;
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.tcp_timestamps" = 0;
    "net.ipv4.tcp_rfc1337" = 1;
    "net.ipv4.tcp_sack" = 0;
    "net.ipv4.tcp_dsack" = 0;
    "net.ipv4.tcp_fack" = 0;
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_congestion_control" = "bbr";

    # IPv6
    "net.ipv6.conf.all.disable_ipv6" = 1;
    "net.ipv6.conf.all.accept_ra" = 0;
    "net.ipv6.conf.all.accept_redirects" = false;
    "net.ipv6.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.all.forwarding" = 0;
    "net.ipv6.conf.default.disable_ipv6" = 1;
    "net.ipv6.conf.default.accept_redirects" = false;
    "net.ipv6.conf.default.accept_ra" = 0;
    "net.ipv6.conf.default.accept_source_route" = 0;

    # Virtual machine
    "vm.unprivileged_userfaultfd" = 0;
    "vm.mmap_rnd_bits" = 32;
    "vm.mmap_rnd_compat_bits" = 16;
    "vm.overcommit_memory" = 2;
    "vm.panic_on_oom" = 1;
  };
}