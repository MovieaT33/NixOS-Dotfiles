#!/usr/bin/env python3

# region [ Imports ]

import subprocess

# endregion


# Colors
BLUE = "\033[34m"
RESET = "\033[0m"


def info(message: str) -> None:
    print(f"{BLUE}[INFO]{RESET} {message}")


CMDS_HISTORY: list[str] = []


def run(cmd: str) -> None:
    print(f"\033[1m{cmd}\033[0m")
    CMDS_HISTORY.append(cmd)
    subprocess.run(cmd, check=True, shell=True)


def partition_disk(disk: str, efi_start: str, efi_end: str) -> None:
    info(f"Partitioning disk {disk}...")
    run(f"parted --script {disk} mklabel gpt")
    run(f"parted --script {disk} mkpart ESP fat32 {efi_start} {efi_end}")
    run(f"parted --script {disk} mkpart primary {efi_end} 100%")
    run(f"parted --script {disk} set 1 esp on")


def format_efi(efi_part: str) -> None:
    info(f"Formatting EFI partition {efi_part}...")
    run(f"mkfs.fat -F 32 {efi_part}")


def setup_luks(luks_part: str, crypt_name: str) -> str:
    info(f"Setting up LUKS on {luks_part}...")
    run(f"cryptsetup luksFormat {luks_part}")
    run(f"cryptsetup open {luks_part} {crypt_name}")
    return f"/dev/mapper/{crypt_name}"


def create_lvm(crypt_mapper: str, vg_name: str) -> None:
    info(f"Creating LVM on {crypt_mapper}...")
    run(f"pvcreate {crypt_mapper}")
    run(f"vgcreate {vg_name} {crypt_mapper}")


def create_logical_volumes(
    vg_name: str, lv_config: dict[str, dict[str, str | None]]
) -> None:
    info("Creating logical volumes...")
    for name, config in lv_config.items():
        size: str = config["size"]  # type: ignore[assignment]
        size_flag: str = "-l" if size.endswith("%FREE") else "-L"
        run(f"lvcreate {size_flag} {size} {vg_name} -n {name}")


def format_volumes(
    vg_name: str, lv_config: dict[str, dict[str, str | None]]
) -> None:
    info("Formatting logical volumes...")
    for name in lv_config:
        if name == "swap":
            run(f"mkswap /dev/{vg_name}/{name}")
        else:
            run(f"mkfs.ext4 /dev/{vg_name}/{name}")


def mount_volumes(
    vg_name: str, efi_part: str, lv_config: dict[str, dict[str, str | None]]
) -> None:
    info("Mounting logical volumes...")

    # Root must be mounted first
    if "root" not in lv_config or lv_config["root"]["mount"] != "/mnt":
        raise ValueError("Root must be defined and mounted to /mnt.")

    run(f"mount /dev/{vg_name}/root /mnt")

    # Mount EFI
    run("mkdir -p /mnt/boot")
    run(f"mount {efi_part} /mnt/boot")

    # Mount other LVs
    for lv_name, config in lv_config.items():
        mount_point: str | None = config.get("mount")
        if lv_name in ["root", "swap"] or not mount_point:
            continue

        run(f"mkdir -p {mount_point}")
        run(f"mount /dev/{vg_name}/{lv_name} {mount_point}")


def enable_swap(vg_name: str) -> None:
    info("Enabling swap...")
    run(f"swapon /dev/{vg_name}/swap")


def generate_nixos_config() -> None:
    info("Generating NixOS hardware config...")
    run("nixos-generate-config --root /mnt")


def prompt_edit_config(
    nixos_config_path: str, crypt_name: str, luks_part: str, vg_name: str
) -> None:
    info("Please update the NixOS config with the following:")
    print()
    print(f'boot.initrd.luks.devices."{crypt_name}".device = "{luks_part}";')
    print(f'swapDevices = [ {{ device = "/dev/{vg_name}/swap"; }} ];')
    print()
    input("Press Enter to open config in nano...")
    run(f"nano {nixos_config_path}")


def install_nixos() -> None:
    info("Installing NixOS...")
    run("nixos-install")


def cleanup(vg_name: str, crypt_name: str) -> None:
    info("Cleaning up before reboot...")
    run(f"swapoff /dev/{vg_name}/swap")
    run("umount -R /mnt")
    run(f"vgchange -an {vg_name}")
    run(f"cryptsetup close {crypt_name}")
    input("Press Enter to reboot system...")
    run("reboot")


def main() -> None:
    disk: str = "/dev/vda"
    efi_start: str = "1MiB"
    efi_end: str = "513MiB"
    efi_part: str = f"{disk}1"
    luks_part: str = f"{disk}2"
    crypt_name: str = "cryptroot"
    vg_name: str = "vg0"

    lv_config: dict[str, dict[str, str | None]] = {
        "nix": {"size": "15G", "mount": "/mnt/nix"},
        "home": {"size": "5G", "mount": "/mnt/home"},
        "var": {"size": "1G", "mount": "/mnt/var"},
        "tmp": {"size": "1G", "mount": "/mnt/tmp"},
        "var_tmp": {"size": "1G", "mount": "/mnt/var/tmp"},
        "swap": {"size": "1G", "mount": None},
        "root": {"size": "100%FREE", "mount": "/mnt"}
    }

    nixos_config_path: str = "/mnt/etc/nixos/configuration.nix"

    # Execution
    partition_disk(disk, efi_start, efi_end)
    format_efi(efi_part)

    crypt_mapper: str = setup_luks(luks_part, crypt_name)
    create_lvm(crypt_mapper, vg_name)

    create_logical_volumes(vg_name, lv_config)
    format_volumes(vg_name, lv_config)
    mount_volumes(vg_name, efi_part, lv_config)

    enable_swap(vg_name)
    generate_nixos_config()

    prompt_edit_config(nixos_config_path, crypt_name, luks_part, vg_name)
    install_nixos()

    print(f"Commands history:\n{CMDS_HISTORY}")
    input("Press Enter to cleanup...")

    cleanup(vg_name, crypt_name)


if __name__ == "__main__":
    main()
