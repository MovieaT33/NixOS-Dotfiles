{ config, ... }:

{
  system.stateVersion = "25.05";

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
}