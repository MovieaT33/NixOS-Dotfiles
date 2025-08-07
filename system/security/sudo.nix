{ config, ... }:

{
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = true;
}