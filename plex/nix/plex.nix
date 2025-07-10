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
     PUID = "200";
     PGID = "200";
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
     PUID = "201";
     PGID = "200";
     TZ = "Americas/Chicago";
   };
   volumes = [
    "/srv/radarr/config:/config"
    "/mnt/media:/data"
   ];
 };

 virtualisation.oci-containers.containers.sonarr = {
   image = "lscr.io/linuxserver/sonarr@sha256:4afcb099e40ef263a7327f1ee9a870a510a516f872ae79b863c11b94d0b9ebb7";
   autoStart = true;
   autoRemoveOnStop = false;
   extraOptions = [
    "--restart=unless-stopped"
   ];
   environment = {
     UMASK = "002";
     PUID = "202";
     PGID = "200";
     TZ = "Americas/Chicago";
   };
   volumes = [
    "/srv/sonarr/config:/config"
    "/mnt/media:/data"
   ];
 };

 virtualisation.oci-containers.containers.bazarr = {
   image = "lscr.io/linuxserver/bazarr@sha256:b36b67e6236f477655073b5844bc4c84d6a5b19172ea1388ae515e6905ec2efe";
   autoStart = true;
   autoRemoveOnStop = false;
   extraOptions = [
    "--restart=unless-stopped"
   ];
   environment = {
     UMASK = "002";
     PUID = "203";
     PGID = "200";
     TZ = "Americas/Chicago";
   };
   volumes = [
    "/srv/bazarr/config:/config"
    "/mnt/media:/data"
   ];
 };

  virtualisation.oci-containers.containers.overseerr = {
   image = "lscr.io/linuxserver/overseerr@sha256:803605154196acec5861f6024310f095a5b3393c1e80a30271193510909b3f54";
   autoStart = true;
   autoRemoveOnStop = false;
   extraOptions = [
    "--restart=unless-stopped"
   ];
   environment = {
     UMASK = "002";
     PUID = "204";
     PGID = "200";
     TZ = "Americas/Chicago";
   };
   volumes = [
    "/srv/overseerr/config:/config"
   ];
 };

  virtualisation.oci-containers.containers.prowlarr = {
   image = "lscr.io/linuxserver/prowlarr@sha256:6225fc8e2bf3492d32e3d49e57347c3828e935261f7c301b93b49f657124772d";
   autoStart = true;
   autoRemoveOnStop = false;
   extraOptions = [
    "--restart=unless-stopped"
   ];
   environment = {
     UMASK = "002";
     PUID = "205";
     PGID = "200";
     TZ = "Americas/Chicago";
   };
   volumes = [
    "/srv/prowlarr/config:/config"
   ];
 };

  virtualisation.oci-containers.containers.sabnzbd = {
   image = "lscr.io/linuxserver/sabnzbd@sha256:88d9dcb1eb1615b3980d37824b5e40a7df60af49a268d97aeccbe5f7107edf92";
   autoStart = true;
   autoRemoveOnStop = false;
   extraOptions = [
    "--restart=unless-stopped"
   ];
   environment = {
     UMASK = "002";
     PUID = "206";
     PGID = "200";
     TZ = "Americas/Chicago";
   };
   volumes = [
    "/srv/sabnzbd/config:/config"
    "/srv/sabnzbd/nzb:/data/usenet/nzb"
    "/mnt/download/usenet/incomplete:/data/usenet/incomplete"
    "/mnt/media/usenet/complete:/data/usenet/complete"
   ];
 };

  virtualisation.oci-containers.containers.qbittorrent = {
   image = "lscr.io/linuxserver/radarr@sha256:69093d6c8974c8ad94c97ea52c78ce14a782fbbe0d7dba0538a2d0ef86c97d0a";
   autoStart = true;
   autoRemoveOnStop = false;
   extraOptions = [
    "--restart=unless-stopped"
   ];
   environment = {
     UMASK = "002";
     PUID = "207";
     PGID = "200";
     TZ = "Americas/Chicago";
   };
   volumes = [
    "/srv/plex/config:/config"
    "/mnt/media/plex:/data/media"
    "/tmp/PlexRamScratch:/transcode"
   ];
 };

  virtualisation.oci-containers.containers.gluetun = {
   image = "lscr.io/linuxserver/radarr@sha256:69093d6c8974c8ad94c97ea52c78ce14a782fbbe0d7dba0538a2d0ef86c97d0a";
   autoStart = true;
   autoRemoveOnStop = false;
   extraOptions = [
    "--restart=unless-stopped"
   ];
   environment = {
     UMASK = "002";
     PUID = "208";
     PGID = "200";
     TZ = "Americas/Chicago";
   };
   volumes = [
    "/srv/plex/config:/config"
    "/mnt/media/plex:/data/media"
    "/tmp/PlexRamScratch:/transcode"
   ];
 };
}
