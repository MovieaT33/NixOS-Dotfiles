import subprocess
from dataclasses import dataclass


class Partition:
    INDEX: int = 1

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

        self.index = self.INDEX
        self.INDEX += 1

    def path(self, disk: str) -> str:
        return f"/dev/{disk}{self.index}"


@dataclass
class LuksVolume:
    part: str
    name: str


def run_command(cmd: str) -> None:
    BOLD, RESET = "\033[1m", "\033[0m"
    print(f"{BOLD}{cmd}{RESET}")
    subprocess.run(cmd, shell=True)


def partition_disk(disk: str, label: str, parts: list[Partition]) -> None:
    # Make label
    parted_cmd: str = f"sudo parted -s {disk}"
    run_command(f"{parted_cmd} mklabel {label}")

    end: str = "100%"
    for part in parts:
        start: str = end if part.start is None else part.start
        end = part.end
        run_command(f"{parted_cmd} mkpart {part.type} {start} {end}")

        if (post_command := part.post_command) is not None:
            run_command(f"{parted_cmd} {post_command}")


def setup_luks(volumes: list[LuksVolume]) -> None:
    for volume in volumes:
        ...


def install_nixos(disk: str, label: str) -> None:
    # Partitions
    esp_part: Partition = Partition(
        start="1MiB",
        end="513MiB",
        type="ESP fat32",
        post_command="set 1 esp on"
    )
    root_part: Partition = Partition(end="99%")
    data_part: Partition = Partition()
    parts: list[Partition] = [esp_part, root_part, data_part]

    # Luks
    luks_volumes: list[LuksVolume] = [
        LuksVolume(root_part.path(disk), "crypt_root"),
        LuksVolume(data_part.path(disk), "crypt_data")
    ]

    # partition_disk(disk, label, parts)
    setup_luks(luks_volumes)


if __name__ == "__main__":
    installation_disk: str = "/dev/vda"
    disk_label: str = "gpt"
    install_nixos(installation_disk, disk_label)
