{ config, pkgs, ... }:

{
  # TODO: uncomment this
  # security.pam.services.login.enable = true;
  # security.pam.services.login.text = ''
  #   auth required pam_faillock.so preauth silent deny=5 unlock_time=900
  #   auth [default=die] pam_faillock.so authfail deny=5 unlock_time=900
  #   account required pam_faillock.so
  # '';
}