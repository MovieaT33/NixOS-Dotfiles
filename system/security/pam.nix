{ config, ... }:

let
  pamConfig = builtins.readFile ./config/pam.conf;
in
{
  security.pam.services.login.enable = false;  # FIXME: turn on
  security.pam.services.login.text = pamConfig;

  security.pam.services.sshd.enable = false;  # FIXME: turn on
  security.pam.services.sshd.text = pamConfig;
}