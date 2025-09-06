{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = true;
      dates = "daily";
      allowReboot = false;
    };
  };
}