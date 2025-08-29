{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;

    autoUpgrade = {
      enable = true;
      dates = "daily";
      allowReboot = false;
    };
  };
}