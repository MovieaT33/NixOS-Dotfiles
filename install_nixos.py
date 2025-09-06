import subprocess
from dataclasses import dataclass


@dataclass
class Partition:
    start: str | None = None
    end: str = "100%"
    type: str = "primary"
    post_command: str | None = None


def run_command(cmd: str) -> None:
    BOLD, RESET = "\033[31m", "\033[0m"
    print(f"{BOLD}{cmd}{RESET}")
    subprocess.run(cmd, shell=True)


def partition_disk(disk: str, label: str, partitions: list[Partition]) -> None:
    # Make label
    parted_cmd: str = f"sudo parted -s {disk}"
    run_command(f"{parted_cmd} mklabel {label}")

    end: str = "100%"
    for partition in partitions:
        start: str = end if partition.start is None else partition.start
        end = partition.end
        run_command(f"{parted_cmd} mkpart {partition.type} {start} {end}")

        if (post_command := partition.post_command) is not None:
            run_command(f"{parted_cmd} {post_command}")


def install_nixos(disk: str, label: str) -> None:
    esp_partition: Partition = Partition(
        start="1MiB",
        end="513MiB",
        type="ESP fat32",
        post_command="set 1 esp on"
    )
    root_partition: Partition = Partition(end="95%")
    data_partition: Partition = Partition()
    partitions: list[Partition] = [
        esp_partition, root_partition, data_partition
    ]

    partition_disk(disk, label, partitions)


if __name__ == "__main__":
    installation_disk: str = "/dev/vda"
    disk_label: str = "gpt"
    install_nixos(installation_disk, disk_label)
