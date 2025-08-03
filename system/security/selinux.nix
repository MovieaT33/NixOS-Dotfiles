{ config, ... }:

{
  security.selinux.enable = true;

  security.selinux.config = {
    enable = true;
    policy = "mls";
  };

  boot.kernelParams = [ "security=selinux" "selinux=1" "enforcing=1" ];

  fileSystems."/sys/fs/selinux" = {
    device = "selinuxfs";
    fsType = "selinuxfs";
  };
}