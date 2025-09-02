#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BLUE  "\033[34m"
#define RESET "\033[0m"
#define BOLD  "\033[1m"
#define RED   "\033[31m"

void info(const char *message) {
    printf(BLUE "[INFO]" RESET " %s\n", message);
}

void run(const char *cmd) {
    char buffer[512];
    snprintf(buffer, sizeof(buffer), "%s", cmd); 
    printf(BOLD "%s" RESET "\n", buffer);
    int ret = system(buffer);
    if (ret != 0) {
        fprintf(stderr, BOLD RED "error" RESET " command failed: %s\n", buffer);
        exit(1);
    }
}

void partition_disk(const char *disk, const char *efi_start, const char *efi_end) {
    info("Partitioning disk...");
    char cmd[512];

    snprintf(cmd, sizeof(cmd), "parted --script %s mklabel gpt", disk);
    run(cmd);

    snprintf(cmd, sizeof(cmd), "parted --script %s mkpart ESP fat32 %s %s", disk, efi_start, efi_end);
    run(cmd);

    snprintf(cmd, sizeof(cmd), "parted --script %s mkpart primary %s 100%%", disk, efi_end);
    run(cmd);

    snprintf(cmd, sizeof(cmd), "parted --script %s set 1 esp on", disk);
    run(cmd);
}

void format_efi(const char *efi_part) {
    info("Formatting EFI partition...");
    char cmd[512];
    snprintf(cmd, sizeof(cmd), "mkfs.fat -F 32 %s", efi_part);
    run(cmd);
}

char* setup_luks(const char *luks_part, const char *crypt_name) {
    info("Setting up LUKS...");
    char cmd[512];

    snprintf(cmd, sizeof(cmd), "cryptsetup luksFormat %s", luks_part);
    run(cmd);

    snprintf(cmd, sizeof(cmd), "cryptsetup open %s %s", luks_part, crypt_name);
    run(cmd);

    static char mapper[256];
    snprintf(mapper, sizeof(mapper), "/dev/mapper/%s", crypt_name);
    return mapper;
}

void create_lvm(const char *crypt_mapper, const char *vg_name) {
    info("Creating LVM...");
    char cmd[512];

    snprintf(cmd, sizeof(cmd), "pvcreate %s", crypt_mapper);
    run(cmd);

    snprintf(cmd, sizeof(cmd), "vgcreate %s %s", vg_name, crypt_mapper);
    run(cmd);
}

void create_logical_volumes(const char *vg_name) {
    info("Creating logical volumes...");
    struct {
        const char *name;
        const char *size;
    } lv_config[] = {
        {"nix", "20G"},
        {"secure", "128M"},
        {"home", "0.5G"},
        {"var", "1G"},
        {"tmp", "128M"},
        {"var_tmp", "128M"},
        {"swap", "1M"},
        {"root", "100%FREE"}
    };

    char cmd[512];
    for (int i = 0; i < 8; i++) {
        if (strstr(lv_config[i].size, "%FREE"))
            snprintf(cmd, sizeof(cmd), "lvcreate -l %s %s -n %s", lv_config[i].size, vg_name, lv_config[i].name);
        else
            snprintf(cmd, sizeof(cmd), "lvcreate -L %s %s -n %s", lv_config[i].size, vg_name, lv_config[i].name);

        run(cmd);
    }
}

void format_volumes(const char *vg_name) {
    info("Formatting logical volumes...");
    const char *lvs[] = {"nix","secure","home","var","tmp","var_tmp","swap","root"};
    char cmd[512];

    for (int i = 0; i < 8; i++) {
        if (strcmp(lvs[i], "swap") == 0) {
            snprintf(cmd, sizeof(cmd), "mkswap /dev/%s/%s", vg_name, lvs[i]);
        } else {
            snprintf(cmd, sizeof(cmd), "mkfs.ext4 /dev/%s/%s", vg_name, lvs[i]);
        }
        run(cmd);
    }
}

void mount_volumes(const char *vg_name, const char *efi_part) {
    info("Mounting volumes...");
    char cmd[512];

    // Root
    snprintf(cmd, sizeof(cmd), "mount /dev/%s/root /mnt", vg_name);
    run(cmd);

    // EFI
    run("mkdir -p /mnt/boot");
    snprintf(cmd, sizeof(cmd), "mount %s /mnt/boot", efi_part);
    run(cmd);

    // Other LVs
    struct {
        const char *name;
        const char *mount_point;
    } mounts[] = {
        {"nix", "/mnt/nix"},
        {"secure", "/mnt/secure"},
        {"home", "/mnt/home"},
        {"var", "/mnt/var"},
        {"tmp", "/mnt/tmp"},
        {"var_tmp", "/mnt/var/tmp"}
    };
    for (int i = 0; i < 6; i++) {
        snprintf(cmd, sizeof(cmd), "mkdir -p %s", mounts[i].mount_point);
        run(cmd);
        snprintf(cmd, sizeof(cmd), "mount /dev/%s/%s %s", vg_name, mounts[i].name, mounts[i].mount_point);
        run(cmd);
    }
}

int main() {
    const char *disk = "/dev/vda";
    const char *efi_start = "1MiB";
    const char *efi_end = "513MiB";
    char efi_part[64];
    snprintf(efi_part, sizeof(efi_part), "%s1", disk);
    char luks_part[64];
    snprintf(luks_part, sizeof(luks_part), "%s2", disk);
    const char *crypt_name = "cryptroot";
    const char *vg_name = "vg0";

    partition_disk(disk, efi_start, efi_end);
    format_efi(efi_part);
    char *crypt_mapper = setup_luks(luks_part, crypt_name);
    create_lvm(crypt_mapper, vg_name);
    create_logical_volumes(vg_name);
    format_volumes(vg_name);
    mount_volumes(vg_name, efi_part);

    info("C version of installation script finished up to mounting volumes.");
    return 0;
}