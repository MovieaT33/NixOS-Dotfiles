{ config, lib, pkgs, ... }:

{
  environment.etc."login.defs".text = ''
    PASS_MAX_DAYS   90
    PASS_MIN_DAYS   7
    PASS_WARN_AGE   7
    ENCRYPT_METHOD  SHA512
    SHA_CRYPT_MIN_ROUNDS 100000
    SHA_CRYPT_MAX_ROUNDS 1000000
  '';
}