{ config, ... }:

let
  pamConfig = builtins.readFile ./config/pam;
in
{
  security.pam.services.login.enable = true;
  security.pam.services.login.text = pamConfig;

  security.pam.services.sshd.enable = true;
  security.pam.services.sshd.text = pamConfig;
}