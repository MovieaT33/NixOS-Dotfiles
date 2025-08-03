{ config, ... }:

{
  security.pam.services.login.enable = true;
  security.pam.services.sshd.enable = true;

  security.pam.services.login.source = ./config/pam.conf;
  security.pam.services.sshd.source = ./config/pam.conf;
}