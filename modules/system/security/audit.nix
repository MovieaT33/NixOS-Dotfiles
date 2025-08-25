{ ... }:

{
  security = {
    audit = {
      enable = true;
      rules = [
       # Log all program executions on 64-bit architecture
       "-a exit, always -F arch=b64 -S execve"
      ];
    };
    auditd.enable = true;
  };
}