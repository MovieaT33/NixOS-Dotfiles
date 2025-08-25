{ ... }:

{
  security.sudo.enable = false;

  security.doas = {
    enable = true;
    extraRules = [
      {
        users = ["userName"];

        keepEnv = true;       # often necessary
        # persist = true;     # convenient but less secure
        # noPass = true;      # convenient but even less secure
      }
    ];
  };
} 