{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;
    nixos.label = "0.10.9.2";
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = true;
      dates = "daily";
      allowReboot = false;
    };
  };
}