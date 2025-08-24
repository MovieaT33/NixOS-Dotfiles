{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;

    autoUpgrade = {
      enable = true;
      allowReboot = false;
    };
  };
}