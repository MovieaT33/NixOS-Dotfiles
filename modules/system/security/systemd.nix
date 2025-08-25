{ ... }:

{
  systemd = {
    enableEmergencyMode = false;
    tmpfiles.rules = [
      "d /etc/nixos 0750 root wheel -"
      # "d /etc/nixos 0700 root root -"
    ];
  };

  # region [ Hardening ]
  # users.groups.netdev = {};
  # endregion
}