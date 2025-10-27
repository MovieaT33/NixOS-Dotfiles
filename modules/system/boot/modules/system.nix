{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;
    nixos.label = "1.2.8-rc3";
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = true;
      dates = "weekly";
      allowReboot = false;
    };
  };
}