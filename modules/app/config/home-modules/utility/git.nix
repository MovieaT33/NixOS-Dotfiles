{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings.user = {
      name = "John Doe";
      email = "johndoe@proton.me";
    };
  };
}