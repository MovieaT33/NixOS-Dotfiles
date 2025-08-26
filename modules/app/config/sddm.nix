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
      ScreenWidth  = "1920";
      ScreenHeight = "1200";

      InputMethod = "";
      Numlock = "on";
    };
    Autologin = {
      User = "mvt33";
    };
  };

  # TODO: Change resolution
  # FIXME: Layout. Current `zz`
}