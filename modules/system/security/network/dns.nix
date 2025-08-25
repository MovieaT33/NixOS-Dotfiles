{ ... }:

{
  services.resolved = {
    enable = true;
    fallbackDns = [
      "1.1.1.1"               # Cloudflare
    ];
  };

  networking.nameservers = [
    "9.9.9.9"                 # Quad 9
  ];
}