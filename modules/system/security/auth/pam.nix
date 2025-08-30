{ ... }:

{
  # TODO: PAM module
  security.pam.services = {
    login = {
      auth = ''
        required pam_faillock.so preauth silent deny=5 unlock_time=900
        auth [default=die] pam_faillock.so authfail deny=5 unlock_time=900
      '';
      account = ''
        required pam_faillock.so
      '';
    };
  };
}