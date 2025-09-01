#pragma region Imports
#include <stdio.h>
#pragma endregion

#pragma region Colors
#define BLUE "\033[34m"
#define RESET "\033[0m"
#pragma endregion

#pragma region Utilities
void info(const char *message) {
    printf(BLUE "[INFO]" RESET " %s\n", message);
}

void run(const char *cmd) {}
#pragma endregion

#pragma region Disk
void partition_disk(const char *disk, const char *efi_start, const char *efi_end) {}
#pragma endregion

#pragma region Luks_and_LVM
void setup_luks(const char *luks_part, const char *crypt_name) {}
void create_lvm(const char *crypt_mapper, const char *vg_name) {}
void create_logical_volumes(const char *vg_name) {}
#pragma endregion

#pragma region Formatting_Partitions
void format_efi(const char *efi_part) {}
void format_volumes() {}
#pragma endregion

int main() {
}