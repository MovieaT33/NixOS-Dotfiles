{ ... }:

{
  # FIXME: Does not work
  systemd.services = {
    "getty@tty1".enable = false;
    "getty@tty2".enable = true;
    "getty@tty3".enable = false;
    "getty@tty4".enable = false;
    "getty@tty5".enable = false;
    "getty@tty6".enable = false;
  };
}