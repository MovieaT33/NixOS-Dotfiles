{ ... }:

{
  security.apparmor = {
    enable = true;
    killUnconfinedConfinables = true;
    enableCache = true;
  };

  services.dbus.apparmor = "enabled";
}