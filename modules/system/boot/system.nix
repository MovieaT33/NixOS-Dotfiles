{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;

    autoUpgrade = {
      enable = true;
      dates = "03:00";
      allowReboot = false;
    };
  };
}