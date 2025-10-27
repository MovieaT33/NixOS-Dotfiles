{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;
    nixos.label = "1.2.8-rc1";
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = true;
      dates = "daily";
      allowReboot = false;
    };
  };
}