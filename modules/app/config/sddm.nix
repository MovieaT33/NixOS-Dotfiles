{ ... }:

{
  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  # TODO: Change resolution
  # FIXME: Layout. Current `zz`
}