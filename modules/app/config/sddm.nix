{ ... }:

{
  services.xserver.xkb.layout = "us";   # TODO: Check is work correctly
  services.displayManager = {
    defaultSession = "hyprland";
    autoLogin.user = "mvt33";
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "maldives";
    };
  };

  services.displayManager.sddm.settings = {
    General = {
      # FIXME: Layout. Current `zz`

      # Screen size
      # FIXME: Do not work correctly
      ScreenWidth  = "1920";
      ScreenHeight = "1200";

      Numlock = "on";
    };
  };
}