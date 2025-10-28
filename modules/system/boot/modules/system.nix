{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;
    nixos.label = "1.3.1";
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = true;
      dates = "weekly";
      allowReboot = false;
    };
  };
}