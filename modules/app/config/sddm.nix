{ ... }:

{
  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      wayland.enable = true;

      theme = "elarun";
    };
  };

  services.displayManager.sddm.settings = {
    Autologin = {
      User = "temp";
    };
    General = {
      InputMethod = "";
      Numlock = "on";

      # Screen
      ScreenWidth  = "1920";
      ScreenHeight = "1080";
    };
  };

  # TODO: Change resolution
  # FIXME: Layout. Current `zz`
}