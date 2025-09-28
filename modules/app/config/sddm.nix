{ pkgs, ... }:

{
  services.displayManager = {
    defaultSession = "hyprland";
    autoLogin.user = "mvt33";
  };

  # TODO: Remove this once
  services.xserver = {
    enable = true;
    monitorSection = ''
      Section "Monitor"
        Identifier "HDMI-1"
        Option "PreferredMode" "1920x1200"
      EndSection
    '';
    xkb.layout = "us";   # TODO: Check is work correctly
    videoDrivers = [ "virtio_gpu" "qxl" ];
  };

  environment.systemPackages = with pkgs; [
    sddm-astronaut
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = false;

    extraPackages = with pkgs; [
      kdePackages.qtbase
      kdePackages.qtwayland
      kdePackages.qtmultimedia
    ];

    theme = "sddm-astronaut-theme";
    settings = {
      General = {
        # FIXME: Layout. Current `zz`

        # Screen size
        # FIXME: Do not work correctly
        ScreenWidth  = "1920";
        ScreenHeight = "1200";

        Numlock = "on";
      };

      SddmGreeterTheme = {
        ConfigFile = "Themes/astronaut.conf";
      };

      Theme = {
        Current = "sddm-astronaut-theme";
      };
    };
  };
}