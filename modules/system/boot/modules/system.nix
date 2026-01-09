{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;
    nixos.label = "1.3.8";
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = true;
      dates = "monthly";
      allowReboot = true;
    };
  };
}