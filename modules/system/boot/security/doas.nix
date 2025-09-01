{ ... }:

{
  # Disable `sudo`
  security.sudo.enable = false;

  # Enable `doas` (more secure alternative)
  security.doas = {
    enable = true;
    extraRules = [ {
        # groups = [ "wheel" ];
        users = ["mvt33"];

        keepEnv = true;         # often necessary
        persist = true;         # convenient but less secure
    } ];
  };
} 