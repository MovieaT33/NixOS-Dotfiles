{ ... }:

{
  systemd = {
    enableEmergencyMode = false;
    tmpfiles.rules = [
      # FIXME: This should be 0750 root wheel, but that breaks `nixos-rebuild switch`
      "d /etc/nixos 0750 root wheel -"
      # "d /etc/nixos 0700 root root -"
    ];
  };
}