# Plex Media Server Host

{ config, pkgs, modulesPath, ... }:

{

# Set up default system-wide packages
  environment.defaultPackages = [
     pkgs.vim
     pkgs.docker
     pkgs.git
     pkgs.stow
  ];

# Enable Docker Usage
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
  virtualisation.docker.rootless = { enable = true; setSocketVariable = true; };
  virtualisation.oci-containers.backend = "docker";

# Setup Containers
# Core Plex Media Server
 virtualisation.oci-containers.containers.plex = {
   image = "lscr.io/linuxserver/plex@sha256:14e8d783f2b0ec7e7ca2836d3d7185f5e68c60ba0e4eac77666bee4f0f819043";
   autoStart = true;
   autoRemoveOnStop = false;
   devices = [
    "/dev/dri:/dev/dri"
   ];
   extraOptions = [
    "--restart=unless-stopped"
   ];
   environment = {
     UMASK = "002";
     PUID = "1004";
     PGID = "1001";
     TZ = "Americas/Chicago";
     VERSION = "docker";
   };
   volumes = [
    "/srv/plex/config:/config"
    "/mnt/media/plex:/data/media"
    "/tmp/PlexRamScratch:/transcode"
   ];
 };

 virtualisation.oci-containers.containers.radarr = {
   image = "lscr.io/linuxserver/radarr@sha256:69093d6c8974c8ad94c97ea52c78ce14a782fbbe0d7dba0538a2d0ef86c97d0a";
   autoStart = true;
   autoRemoveOnStop = false;
   extraOptions = [
    "--restart=unless-stopped"
   ];
   environment = {
     UMASK = "002";
     PUID = "1004";
     PGID = "1001";
     TZ = "Americas/Chicago";
   };
   volumes = [
    "/srv/plex/config:/config"
    "/mnt/media/plex:/data/media"
    "/tmp/PlexRamScratch:/transcode"
   ];
 };

 virtualisation.oci-containers.containers.sonarr = {
   image = "lscr.io/linuxserver/sonarr";
   autoStart = true;
   autoRemoveOnStop = false;
   extraOptions = [
    "--restart=unless-stopped"
   ];
   environment = {
     UMASK = "002";
     PUID = "1004";
     PGID = "1001";
     TZ = "Americas/Chicago";
   };
   volumes = [
    "/srv/plex/config:/config"
    "/mnt/media/plex:/data/media"
    "/tmp/PlexRamScratch:/transcode"
   ];
 };


}
