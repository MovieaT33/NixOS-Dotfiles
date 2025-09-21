{ pkgs, ... }:

{
  # Use `doas` instead of `sudo` (less code, less bugs, more secure)

  # Disable `sudo`
  security.sudo.enable = false;

  # Enable and configure `doas`
  security.doas = {
    enable = true;
    extraRules = [ {
      # groups = [ "wheel" ];
      users = [ "mvt33" ];

      keepEnv = true;         # often necessary
      persist = true;         # convenient but less secure
      noPass = false;         # convenient but even less secure
    } ];
  };

  environment.systemPackages = with pkgs; [
    doas-sudo-shim  # for compatibility with `sudo`
  ];
}