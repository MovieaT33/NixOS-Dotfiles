{ ... }:

let
  pamConfig = builtins.readFile ./config/pam;
in
{
  security.pam.services.login = {
    enable = true;
    text = pamConfig;
  };

  # security.pam.services = {
  #   passwd = {
  #     required = [ "pam_pwquality.so retry=3" ];
  #   };
  # };

  # security.pwquality = {
  #   enable = true;
  #   minLen = 12;
  #   minClass = 3;
  #   maxRepeat = 3; 
  #   maxSequence = 3;
  # };

  # TODO: Max opened files and login limits for users
}