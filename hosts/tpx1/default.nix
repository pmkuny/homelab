{ inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "tpx1";

  system.stateVersion = "24.05";

  services.displayManager.gdm.enable = true;
  programs.hyprland.enable = true;

}
