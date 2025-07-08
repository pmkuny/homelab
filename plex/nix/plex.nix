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
  virtualisation.docker.rootless = { enable = true; setSocketVariable = true; };
  virtualisation.oci-containers.backend = "docker";

# Setup Containers
 virtualisation.oci-containers.containers.plex = {
   image = "lscr.io/linuxserver/plex@sha256:14e8d783f2b0ec7e7ca2836d3d7185f5e68c60ba0e4eac77666bee4f0f819043";
   extraOptions = [
   "--network host"
   ];
   environment = {
     UMASK = "002";
     PUID = "1004";
     PGID = "1001";
     TZ = "Americas/Chicago";
     VERSION = "docker";
   };
 };

}
