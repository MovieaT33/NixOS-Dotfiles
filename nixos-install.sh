#!/usr/bin/env bash
set -euo pipefail

# Disk configuration
DISK="/dev/vda"
CRYPT_NAME="root"
VG_NAME="vg0"
LV_ROOT="lv0"
HOSTNAME="nixos"

# 1. Partition the disk
parted --script "$DISK" \
  mklabel gpt \
  mkpart ESP fat32 1MiB 513MiB \
  mkpart primary 513MiB 100% \
  set 1 esp on

# 2. Format the EFI partition
mkfs.fat -F32 "${DISK}1"

# 3. Setup LUKS encryption
cryptsetup luksFormat "${DISK}2"
cryptsetup open "${DISK}2" "$CRYPT_NAME"

# 4. Create LVM physical volume inside the decrypted LUKS device
pvcreate "/dev/mapper/$CRYPT_NAME"
vgcreate "$VG_NAME" "/dev/mapper/$CRYPT_NAME"

# 5. Create a single logical volume occupying all free space
lvcreate -l 100%FREE "$VG_NAME" -n "$LV_ROOT"

# 6. Format the root logical volume
mkfs.ext4 "/dev/$VG_NAME/$LV_ROOT"

# 7. Mount the root volume and EFI partition
mount "/dev/$VG_NAME/$LV_ROOT" /mnt
mkdir -p /mnt/boot
mount "${DISK}1" /mnt/boot

# 8. Generate NixOS hardware configuration
nixos-generate-config --root /mnt

# 9. Write the NixOS configuration file
echo "Please add the following line to /mnt/etc/nixos/configuration.nix:"
echo
echo "boot.initrd.luks.devices.\"$CRYPT_NAME\" = \"${DISK}2\";"
echo
read -rp "Press Enter to open nano and edit the file..."

nano /mnt/etc/nixos/configuration.nix

# 10. Install NixOS without setting root password
nixos-install --no-root-passwd

# 11. Cleanup and reboot
umount -R /mnt
cryptsetup close "$CRYPT_NAME"
reboot
