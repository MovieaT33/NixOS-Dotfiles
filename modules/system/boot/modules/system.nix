{ stateVersion, ... }:

{
  system = {
    stateVersion = stateVersion;
    nixos.label = "1.3.14-rc2";
    copySystemConfiguration = false;
    autoUpgrade = {
      enable = true;
      dates = "monthly";
      allowReboot = true;
    };
  };
}