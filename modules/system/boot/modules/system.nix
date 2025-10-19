{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;
    nixos.label = "0.1.12-rc2";
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = true;
      dates = "daily";
      allowReboot = false;
    };
  };
}