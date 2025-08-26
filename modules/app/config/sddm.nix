{ ... }:

{
  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      wayland.enable = true;

      theme = "maldives";
    };
  };

  services.displayManager.sddm.settings = {
    General = {
      # Screen size
      # FIXME: Check resolution
      ScreenWidth  = "1920";
      ScreenHeight = "1200";

      Numlock = "on";
    };
    Autologin = {
      User = "mvt33";
    };
  };

  # FIXME: Layout. Current `zz`
}