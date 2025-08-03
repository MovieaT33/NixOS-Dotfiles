{ config, lib, ... }:

let
  controlPortPassword = "torpassword";

  torNewnymService = {
    description = "Send SIGNAL NEWNYM to Tor to change IP";

    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        echo -e "AUTHENTICATE \"${controlPortPassword}\"\r
SIGNAL NEWNYM\r
QUIT\r
" | nc 127.0.0.1 9051
      '';
    };
  };

  torNewnymTimer = {
    description = "Run tor-newnym.service every minute";
    timerConfig = {
      OnBootSec = "1min";
      OnUnitActiveSec = "1min";
    };
  };
in {
  systemd.services.tor-newnym = torNewnymService;
  systemd.timers.tor-newnym = lib.mkForce (lib.recursiveUpdate torNewnymTimer {
    wantedBy = [ "timers.target" ];
  });
}