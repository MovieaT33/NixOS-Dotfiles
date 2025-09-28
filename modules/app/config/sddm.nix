{ pkgs, ... }:

{
  services.displayManager = {
    defaultSession = "hyprland";
    autoLogin.user = "mvt33";
  };

  environment.systemPackages = with pkgs; [
    sddm-astronaut
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

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