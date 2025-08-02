{ config, lib, pkgs, ... }:

{
  security.pam.services.login.enable = true;
  security.pam.services.login.text = ''
    auth required pam_tally2.so deny=5 onerr=fail unlock_time=900
  '';
}