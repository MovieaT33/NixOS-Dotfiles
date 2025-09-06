sudo parted -s /dev/vda mklabel gpt
sudo parted -s /dev/vda mkpart ESP fat32 1MiB 513MiB
sudo parted -s /dev/vda set 1 esp on
sudo parted -s /dev/vda mkpart primary 513MiB 95%
sudo parted -s /dev/vda mkpart primary 95% 100%

sudo cryptsetup luksFormat /dev/vda2 --batch-mode
sudo cryptsetup open       /dev/vda2 crypt_root
sudo cryptsetup luksFormat /dev/vda3 --batch-mode
sudo cryptsetup open       /dev/vda3 crypt_data

sudo pvcreate         /dev/mapper/crypt_root
sudo vgcreate vg_root /dev/mapper/crypt_root
sudo pvcreate         /dev/mapper/crypt_data
sudo vgcreate vg_data /dev/mapper/crypt_data

sudo lvcreate vg_root -n nix     -L 20GiB
sudo lvcreate vg_root -n var     -L 1GiB
sudo lvcreate vg_root -n home    -L 512GiB
sudo lvcreate vg_root -n tmp     -L 128MiB
sudo lvcreate vg_root -n var_tmp -L 64MiB
sudo lvcreate vg_root -n swap    -L 1MiB
sudo lvcreate vg_root -n root    -l 100%FREE
sudo lvcreate vg_data -n secure  -L 100%FREE

sudo mkfs.vfat -F 32 /dev/vda1

sudo mkfs.ext4 /dev/vg_root/nix
sudo mkfs.ext4 /dev/vg_root/var
sudo mkfs.ext4 /dev/vg_root/home
sudo mkfs.ext4 /dev/vg_root/tmp
sudo mkfs.ext4 /dev/vg_root/var_tmp
sudo mkswap    /dev/vg_root/swap
sudo mkfs.ext4 /dev/vg_root/root
sudo mkfs.ext4 /dev/vg_data/secure

sudo mount /dev/vg_root/root /mnt

sudo mkdir -p /mnt/{boot,nix,var,home,tmp,var_tmp,secure}
sudo mount  /dev/vda1            /mnt/boot

sudo mount  /dev/vg_root/nix     /mnt/nix
sudo mount  /dev/vg_root/var     /mnt/var
sudo mount  /dev/vg_root/home    /mnt/home
sudo mount  /dev/vg_root/tmp     /mnt/tmp
sudo mount  /dev/vg_root/var_tmp /mnt/var/tmp
sudo swapon /dev/vg_root/swap
sudo mount  /dev/vg_data/secure  /mnt/secure

sudo nixos-generate-config --root /mnt

sudo nixos-install

# sudo swapoff /dev/vg_root/swap
# sudo umount -R /mnt
# sudo vgchange -an vg_root
# sudo vgchange -an vg_data
# sudo cryptsetup close crypt_root
# sudo cryptsetup close crypt_data
# sudo reboot
