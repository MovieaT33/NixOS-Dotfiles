#!/usr/bin/env bash
set -euo pipefail

# Define colors
BLUE="\033[34m"
RESET="\033[0m"

# Function to print info messages
info() {
  echo -e "${BLUE}[INFO]${RESET} $*"
}

# Disk configuration
DISK="/dev/vda"
EFI_PART="${DISK}1"
LUKS_PART="${DISK}2"
CRYPT_NAME="root"
VG_NAME="vg0"
LV_ROOT="lv0"

# 1. Partition the disk
info "01 / 11 | Partitioning disk $DISK..."
parted --script "$DISK" \
  mklabel gpt \
  mkpart ESP fat32 1MiB 513MiB \
  mkpart primary 513MiB 100% \
  set 1 esp on

# 2. Format the EFI partition
info "02 / 11 | Formatting EFI partition $EFI_PART..."
mkfs.fat -F32 "$EFI_PART"

# 3. Setup LUKS encryption
info "03 / 11 | Setting up LUKS encryption on $LUKS_PART..."
cryptsetup luksFormat "$LUKS_PART"
cryptsetup open "$LUKS_PART" "$CRYPT_NAME"

# 4. Create LVM physical volume inside the decrypted LUKS device
info "04 / 11 | Creating LVM physical volume and volume group..."
pvcreate "/dev/mapper/$CRYPT_NAME"
vgcreate "$VG_NAME" "/dev/mapper/$CRYPT_NAME"

# 5. Create a single logical volume occupying all free space
info "05 / 11 | Creating logical volume $LV_ROOT..."
lvcreate -l 100%FREE "$VG_NAME" -n "$LV_ROOT"

# 6. Format the root logical volume
info "06 / 11 | Formatting logical volume..."
mkfs.ext4 "/dev/$VG_NAME/$LV_ROOT"

# 7. Mount the root volume and EFI partition
info "07 / 11 | Mounting root and EFI partitions..."
mount "/dev/$VG_NAME/$LV_ROOT" /mnt
mkdir -p /mnt/boot
mount "$EFI_PART" /mnt/boot

# 8. Generate NixOS hardware configuration
info "08 / 11 | Generating NixOS hardware configuration..."
nixos-generate-config --root /mnt

# 9. Prompt to edit configuration.nix and add LUKS config
info "09 / 11 | Please add the following line to /mnt/etc/nixos/configuration.nix:"
echo
echo "boot.initrd.luks.devices.\"$CRYPT_NAME\" = \"$LUKS_PART\";"
echo
read -rp "Press Enter to open nano and edit the file..."

nano /mnt/etc/nixos/configuration.nix

# 10. Install NixOS without setting root password
info "10 / 11 | Installing NixOS..."
nixos-install --no-root-passwd

# 11. Cleanup and reboot
info "11 / 11 | Cleaning up and rebooting..."
umount -R /mnt
cryptsetup close "$CRYPT_NAME"
reboot
