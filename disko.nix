{
  disko.devices = {
    disk.vda = {
      device = "/dev/vda";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            start = "1MiB";
            end = "513MiB";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };

          root = {
            start = "513MiB";
            end = "95%";
            content = {
              type = "luks";
              name = "crypt_root";
              settings.allowDiscards = true;
              content = {
                type = "lvm_pv";
                vg = "vg_root";
              };
            };
          };

          data = {
            start = "95%";
            end = "100%";
            content = {
              type = "luks";
              name = "crypt_data";
              settings.allowDiscards = true;
              content = {
                type = "lvm_pv";
                vg = "vg_data";
              };
            };
          };
        };
      };
    };

    lvm_vg.vg_root = {
      type = "lvm_vg";
      lvs = {
        nix = {
          size = "15GiB";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/nix";
          };
        };

        var = {
          size = "1.5GiB";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/var";
          };
        };

        home = {
          size = "1GiB";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/home";
          };
        };

        tmp = {
          size = "64MiB";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/tmp";
          };
        };

        var_tmp = {
          size = "1MiB";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/var/tmp";
          };
        };

        swap = {
          size = "1MiB";
          content = {
            type = "swap";
          };
        };

        root = {
          size = "100%FREE";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };

    lvm_vg.vg_data = {
      type = "lvm_vg";
      lvs = {
        secure = {
          size = "100%FREE";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/secure";
          };
        };
      };
    };
  };
}
