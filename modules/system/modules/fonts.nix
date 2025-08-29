{ pkgs, ... }:

{
  # FIXME: Maybe, use `fonts.fonts` instead of `environment.systemPackages`
  environment.systemPackages = with pkgs; [
    # region [ Nerd fonts ]
    nerd-fonts.jetbrains-mono
    # endregion
  ];
}