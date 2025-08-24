{ ... }:

{
  services.xserver.enable = true;
  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  # TODO: Change resolution
}