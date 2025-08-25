{ ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}