{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;

  # TODO: Update this list
  environment.systemPackages = with pkgs; [
    # KDE
    kdePackages.kolourpaint
    kdePackages.sddm-kcm

    hardinfo2
    vlc
    wayland-utils
    wl-clipboard
  ];
}