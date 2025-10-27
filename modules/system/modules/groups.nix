{ ... }:

{
  users.groups = {
    wheel.members = [ "mvt33" ];
    net.members = [ "root" "mvt33" ];
    docker.members = [ "mvt33" ];
  };
}