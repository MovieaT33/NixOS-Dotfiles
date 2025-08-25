{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # region [ Nerd fonts ]
    nerd-fonts.jetbrains-mono
    # endregion
  ];
}