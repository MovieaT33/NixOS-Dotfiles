{ ... }:

{
  programs.zsh = {
    enable = true;

    history = {
      save = 0;
      size = 0;
    };

    autosuggestion.enable = true;

    shellAliases = {
      # LUKS encryption
      luks-add     = "sudo cryptsetup luksAddKey";
      luks-remove  = "sudo cryptsetup luksRemoveKey";
      secure-open  = "sudo cryptsetup open /dev/vda3 crypt_data && sudo vgchange -ay vg1-data; sudo mount --mkdir /dev/vg1-data/secure /secure";
      secure-close = "sudo umount /secure && sudo vgchange -an vg1-data && sudo cryptsetup close crypt_data; sudo rmdir /secure";
      sc           = "cd /security";

      # Security
      # TODO: `block-net = "";`
      # TODO: `unblock-net = "";`
    };

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