{ config, ... }:

let
  pamConfig = builtins.readFile ./config/pam;
in
{
  # security.pam.services.login.enable = false;  # FIXME: enable
  # security.pam.services.login.text = pamConfig;

  # security.pam.services.sshd.enable = false;  # FIXME: enable
  # security.pam.services.sshd.text = pamConfig;
}