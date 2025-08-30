{ ... }:

{
  # TODO: Add `login`, `passwd`, ... modules
  # TODO: Use file
  # FIXME: PAM module
  security.pam.services.su.text = ''
    auth required pam_faillock.so preauth silent deny=5 unlock_time=900

    auth sufficient pam_rootok.so

    @include common-auth

    auth [default=bad] pam_faillock.so authfail deny=5 unlock_time=900

    account required pam_faillock.so
    @include common-account
    @include common-session
    @include common-password
  '';
}