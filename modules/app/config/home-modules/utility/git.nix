{ ... }:

{
  programs.git = {
    enable = true;
    settings.user = {
      name = "John Doe";
      email = "johndoe@proton.me";
    };
  };
}