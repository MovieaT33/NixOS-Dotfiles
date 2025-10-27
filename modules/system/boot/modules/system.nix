{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;
    nixos.label = "1.2.8-rc2";
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = false;
      dates = "daily";
      allowReboot = false;
    };
  };
}