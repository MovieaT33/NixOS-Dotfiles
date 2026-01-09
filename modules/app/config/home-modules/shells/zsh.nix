{ ... }:

{
  programs.zsh.shellAliases = {
    # System, dotfiles, utilities and nix
    c     = "sudo sh -c 'printf c > /proc/sysrq-trigger'";
    dump  = "coredumpctl";
    e     = "superfile";
    i     = "uname -a";
    m     = "btop";
    n     = "navi";
    ns    = "nix-shell --run zsh -p";
    nl    = "nix-shell --run zsh -p !!";
    stats = "atuin stats";
    sys   = "nix-info -m";
    ta    = "type -a";

    # LUKS encryption
    luks-add     = "sudo cryptsetup luksAddKey";
    luks-remove  = "sudo cryptsetup luksRemoveKey";
    secure-open  = "sudo cryptsetup open /dev/vda3 crypt_data && sudo vgchange -ay vg1-data; sudo mount --mkdir /dev/vg1-data/secure /secure";
    secure-close = "sudo umount /secure && sudo vgchange -an vg1-data && sudo cryptsetup close crypt_data; sudo rmdir /secure";
    sc           = "cd /security";

    # Security
    # TODO: `block-net = "";`
    dsec   = "systemd-analyze security";
    sec    = "sudo lynis audit system";
    # TODO: `unblock-net = "";`
  };

  programs.zsh = {
    enable = true;

    history = {
      save = 0;
      size = 0;
    };

    autosuggestion.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "half-life";
      plugins = [
        "git"
        "sudo"
        "vi-mode"
      ];
    };
  };
}