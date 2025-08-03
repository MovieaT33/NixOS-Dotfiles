{ config, ... }:

{
  services.audit.enable = true;
  services.fail2ban.enable = true;
  security.limit.maxOpenFiles = 1024;
}