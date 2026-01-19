{ home, pkgs, ... }:

let
  configDir = "/etc/nixos";
in
{
  imports = [
    # a
    ../utility/atuin.nix
    # b
    ../utility/bat.nix
    ../utility/broot.nix
    ../utility/btop.nix
    # c
    ../utility/carapace.nix
    ../utility/command-not-found.nix
    # TODO: ../utility/curl.nix
    # d
    # TODO: ../utility/delta.nix
    # e
    ../utility/eza.nix
    # f
    ../utility/fd.nix
    ../utility/fzf.nix
    # g
    ../utility/git.nix
    # h
    # i
    # j
    # k
    # l
    ../utility/lazydocker.nix
    ../utility/lazygit.nix
    # m
    # n
    ../utility/navi.nix
    # ../utility/ncdu.nix
    ../utility/neovim.nix
    # o
    # p
    # q
    # r
    ../utility/ripgrep.nix
    ../utility/ripgrep-all.nix
    # s
    ../utility/starship.nix
    ../utility/superfile.nix
    # t
    ../utility/tmux.nix
    # ../utility/tree.nix
    # u
    # v
    # w
    # ../utility/wget.nix
    # x
    # y
    # z
    ../utility/zellij.nix
    ../utility/zoxide.nix
  ];

  # FIXME: Does not work.
  home.packages = with pkgs; [
    nix-info
  ];

  home.shellAliases = {
    # a
    # b
    # c
    c     = "sudo sh -c 'printf c > /proc/sysrq-trigger'";
    # d
    d     = "${configDir}";
    d-sec = "systemd-analyze security";
    dump  = "coredumpctl";
    # e
    e     = "superfile";
    # f
    f     = "fastfetch -c examples/13.jsonc";
    # g
    # h
    # i
    i     = "uname -a";
    # j
    jj    = "${configDir}; just";
    # k
    # l
    l     = "eza";
    # m
    m     = "btop";
    # n
    n     = "navi";
    ns    = "nix-shell --run zsh -p";
    # o
    # p
    # r
    r     = "pkill -KILL -u $USER";
    # s
    s     = "doas";
    s-sec = "sudo lynis audit system";
    stats = "atuin stats";
    sys   = "nix-info -m";
    # t
    t     = "type -a";
    # u
    # v
    v     = "nvim";
    # w
    # x
    # y
    # z
  };
}