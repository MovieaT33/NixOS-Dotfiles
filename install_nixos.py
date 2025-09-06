import subprocess
from dataclasses import dataclass
from typing import NoReturn


class Partition:
    def __init__(
        self,
        start: str | None = None,
        end: str = "100%",
        type: str = "primary",
        post_command: str | None = None
    ) -> None:
        self.start = start
        self.end = end
        self.type = type
        self.post_command = post_command


@dataclass
class IndexedPartition:
    index: int
    part: Partition

    @staticmethod
    def search(
        indexed_parts: list["IndexedPartition"], part: Partition
    ) -> "IndexedPartition" | NoReturn:
        for indexed_part in indexed_parts:
            if indexed_part.part == part:
                return indexed_part
        raise ValueError(f"Partition {part} not found in indexed partitions.")

    def path(self, disk: str) -> str:
        return f"{disk}{self.index}"


@dataclass
class LUKSVolume:
    part: str
    name: str


@dataclass
class LVMVolume:
    name: str
    vg_name: str

    @property
    def path(self) -> str:
        return f"/dev/mapper/{self.name}"


def run_command(cmd: str, sudo: bool = True) -> None:
    if sudo:
        cmd = f"sudo {cmd}"

    BOLD, RESET = "\033[1m", "\033[0m"
    print(f"{BOLD}{cmd}{RESET}")

    subprocess.run(cmd, shell=True)


def partition_disk(
    disk: str, label: str, parts: list[Partition]
) -> list[IndexedPartition]:
    # Make label
    parted_cmd: str = f"parted -s {disk}"
    run_command(f"{parted_cmd} mklabel {label}")

    end: str = "100%"
    for part in parts:
        start: str = end if part.start is None else part.start
        end = part.end
        run_command(f"{parted_cmd} mkpart {part.type} {start} {end}")

        if (post_command := part.post_command) is not None:
            run_command(f"{parted_cmd} {post_command}")

    return [IndexedPartition(idx, part)
            for idx, part in enumerate(parts)]


def setup_luks(volumes: list[LUKSVolume]) -> None:
    cryptsetup_cmd: str = "cryptsetup"
    for volume in volumes:
        run_command(f"{cryptsetup_cmd} luksFormat {volume.part} --batch-mode")
        run_command(f"{cryptsetup_cmd} open {volume.part} {volume.name}")


def create_lvm(volumes: list[LVMVolume]) -> None:
    for volume in volumes:
        run_command(f"pvcreate {volume.path}")
        run_command(f"vgcreate {volume.vg_name} {volume.path}")


def install_nixos(disk: str, label: str) -> None:
    # Partitions
    esp: Partition = Partition(
        start="1MiB",
        end="513MiB",
        type="ESP fat32",
        post_command="set 1 esp on"
    )
    root: Partition = Partition(end="99%")
    data: Partition = Partition()
    parts: list[Partition] = [esp, root, data]

    indexed_parts: list[IndexedPartition] = partition_disk(disk, label, parts)

    luks_root: LUKSVolume = LUKSVolume(
        IndexedPartition.search(indexed_parts, root).path(disk),
        "crypt_root"
    )
    luks_data: LUKSVolume = LUKSVolume(
        IndexedPartition.search(indexed_parts, data).path(disk),
        "crypt_data"
    )
    luks_volumes: list[LUKSVolume] = [luks_root, luks_data]
    setup_luks(luks_volumes)

    lvm_volumes: list[LVMVolume] = [
        LVMVolume(luks_root.name, "vg_root"),
        LVMVolume(luks_data.name, "vg_data")
    ]
    create_lvm(lvm_volumes)


if __name__ == "__main__":
    installation_disk: str = "/dev/vda"
    disk_label: str = "gpt"
    install_nixos(installation_disk, disk_label)
