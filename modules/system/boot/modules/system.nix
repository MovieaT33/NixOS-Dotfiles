{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;
    nixos.label = "0.10.8.20";
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = true;
      dates = "daily";
      allowReboot = false;
    };
  };
}