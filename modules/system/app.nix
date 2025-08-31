{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git just                                # repository and system
    lynis kernel-hardening-checker          # security
    # TODO: Seperate `lynis` and `kernel-hardening-checker` into configurations
  ];
}