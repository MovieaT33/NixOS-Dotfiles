{ config, ... }:

{
  security.audit.enable = true;
  security.auditd.enable = true;
  services.fail2ban.enable = true;
}