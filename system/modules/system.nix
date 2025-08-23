{ ... }:

{
  system.stateVersion = "25.05";

  # Auto upgrade
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
}