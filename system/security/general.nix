{ config, ... }:

{
  security.allowSimultaneousMultithreading = false;
  security.virtualisation.flushL1DataCache = "always";
}