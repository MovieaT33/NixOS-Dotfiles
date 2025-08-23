{ config, ... }:

{
  security = {
    unprivilegedUsernsClone = config.virtualisation.containers.enable;
    virtualisation.flushL1DataCache = "always";
  };
}