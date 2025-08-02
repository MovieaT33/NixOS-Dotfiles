#!/usr/bin/env bash
set -euo pipefail

# Define colors
BLUE="\033[34m"
RESET="\033[0m"

# Function to print info messages
info() {
  echo -e "${BLUE}[INFO]${RESET} $*"
}

# Disk config
DISK="/dev/vda"
EFI_START=1MiB
EFI_END=513MiB
EFI_PART="${DISK}1"
LUKS_PART="${DISK}2"

# LUKS config
CRYPT_NAME="cryptroot"
VG_NAME="vg0"

LV_ROOT="root"
LV_VAR="var"
LV_NIXSTORE="nixstore"
LV_HOME="home"
LV_TMP="tmp"
LV_VARTMP="vartmp"

LV_SWAP="swap"

SIZE_VAR="2G"
SIZE_NIXSTORE="8G"
SIZE_HOME="4G"
SIZE_TMP="0.25G"
SIZE_VARTMP="0.25G"

SIZE_SWAP="0.5G"

# NixOS config
NIXOS_CONFIG="/mnt/etc/nixos/configuration.nix"

# 1. Partition the disk
info "01 / 12 | Partitioning disk $DISK..."
parted --script "$DISK" \
  mklabel gpt \
  mkpart ESP fat32 $EFI_START $EFI_END \
  mkpart primary $EFI_END 100% \
  set 1 esp on

# 2. Format the EFI partition
info "02 / 12 | Formatting EFI partition $EFI_PART..."
mkfs.fat -F32 "$EFI_PART"

# 3. Setup LUKS encryption
info "03 / 12 | Setting up LUKS encryption on $LUKS_PART..."
cryptsetup luksFormat "$LUKS_PART"
cryptsetup open "$LUKS_PART" "$CRYPT_NAME"

# 4. Create LVM physical volume inside the decrypted LUKS device
info "04 / 12 | Creating LVM physical volume and volume group..."
pvcreate "/dev/mapper/$CRYPT_NAME"
vgcreate "$VG_NAME" "/dev/mapper/$CRYPT_NAME"

# 5. Create logical volumes
info "05 / 12 | Creating logical volumes..."

lvcreate -L "$SIZE_VAR" "$VG_NAME" -n "$LV_VAR"
lvcreate -L "$SIZE_NIXSTORE" "$VG_NAME" -n "$LV_NIXSTORE"
lvcreate -L "$SIZE_HOME" "$VG_NAME" -n "$LV_HOME"
lvcreate -L "$SIZE_TMP" "$VG_NAME" -n "$LV_TMP"
lvcreate -L "$SIZE_VARTMP" "$VG_NAME" -n "$LV_VARTMP"

lvcreate -L "$SIZE_SWAP" "$VG_NAME" -n "$LV_SWAP"  # Swap

# Use remaining space for root
lvcreate -l 100%FREE "$VG_NAME" -n "$LV_ROOT"

# 6. Format logical volumes
info "06 / 12 | Formatting logical volumes..."

mkfs.ext4 "/dev/$VG_NAME/$LV_ROOT"
mkfs.ext4 "/dev/$VG_NAME/$LV_VAR"
mkfs.ext4 "/dev/$VG_NAME/$LV_NIXSTORE"
mkfs.ext4 "/dev/$VG_NAME/$LV_HOME"
mkfs.ext4 "/dev/$VG_NAME/$LV_TMP"
mkfs.ext4 "/dev/$VG_NAME/$LV_VARTMP"

mkswap "/dev/$VG_NAME/$LV_SWAP"  # Swap

# 7. Mount partitions
info "07 / 12 | Mounting partitions..."

mount "/dev/$VG_NAME/$LV_ROOT" /mnt
mkdir -p /mnt/boot
mount "$EFI_PART" /mnt/boot

mkdir -p /mnt/{var,nix/store,home,tmp}

mount "/dev/$VG_NAME/$LV_VAR" /mnt/var

mkdir -p /mnt/var/tmp

mount "/dev/$VG_NAME/$LV_NIXSTORE" /mnt/nix/store
mount "/dev/$VG_NAME/$LV_HOME" /mnt/home
mount "/dev/$VG_NAME/$LV_TMP" /mnt/tmp
mount "/dev/$VG_NAME/$LV_VARTMP" /mnt/var/tmp

# 8. Enable swap
info "08 / 12 | Enabling swap..."
swapon "/dev/$VG_NAME/$LV_SWAP"

# 9. Generate NixOS hardware configuration
info "09 / 12 | Generating NixOS hardware configuration..."
nixos-generate-config --root /mnt

# 10. Prompt to edit NixOS config
info "10 / 12 | Please add the following line to $NIXOS_CONFIG:"
echo
echo "boot.initrd.luks.devices.\"$CRYPT_NAME\".device = \"$LUKS_PART\";"
echo
echo "swapDevices = [ { device = \"/dev/$VG_NAME/$LV_SWAP\"; } ];"
echo
read -rp "Press Enter to open nano and edit the file..."

nano "$NIXOS_CONFIG"

# 11. Install NixOS without setting root password
info "11 / 12 | Installing NixOS..."
nixos-install # --no-root-passwd

# 12. Close LUKS and reboot
info "12 / 12 | Cleaning up and rebooting..."

swapoff "/dev/$VG_NAME/$LV_SWAP"

umount -R /mnt
vgchange -an "$VG_NAME"
cryptsetup close "$CRYPT_NAME"

reboot
