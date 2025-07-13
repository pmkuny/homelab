# Common configuration for all hosts

{ config, pkgs, modulesPath, ... }:

{

# Set up default system-wide packages
  environment.defaultPackages = [
     pkgs.vim
     pkgs.docker
     pkgs.git
     pkgs.stow
     pkgs.prometheus-node-exporter
     pkgs.cadvisor
  ];

# Enable Docker Usage
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
  virtualisation.docker.rootless = { enable = true; setSocketVariable = true; };
  virtualisation.oci-containers.backend = "docker";

# Enable cAdvisor container for container metrics
  virtualisation.oci-containers.containers.cadvisor = {
   image = "lscr.io/linuxserver/radarr@sha256:69093d6c8974c8ad94c97ea52c78ce14a782fbbe0d7dba0538a2d0ef86c97d0a";
   privileged = true;
   devices = [
    "/dev/kmsg:/dev/kmsg"
   ];
   autoStart = true;
   autoRemoveOnStop = false;
   extraOptions = [
    "--restart=unless-stopped"
   ];
   environment = {
     TZ = "Americas/Chicago";
   };
   volumes = [
    "/:/rootfs:ro"
    "/var/run:/var/run:ro"
    "/sys:/sys:ro"
    "/var/lib/docker:/var/lib/docker:ro"
    "/dev/disk:/dev/disk:ro"
   ];
 };

}