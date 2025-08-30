{ ... }:

{
  # TODO: Add `login`, `passwd`, ... modules
  # FIXME: PAM module
  security.pam.services.su.text = ''
    auth       required      pam_faillock.so preauth silent deny=5 unlock_time=900
    @include common-auth
    auth       [default=bad] pam_faillock.so authfail deny=5 unlock_time=900
    account    required      pam_faillock.so
    @include common-account
    @include common-session
    @include common-password
  '';
}