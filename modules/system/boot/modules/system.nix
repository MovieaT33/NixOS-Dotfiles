{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;
    nixos.label = "0.1.14-rc4";
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = true;
      dates = "daily";
      allowReboot = false;
    };
  };
}