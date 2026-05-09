{ pkgs, ... }:

{
  home.packages = [
    pkgs.starship
    pkgs.rustup
    pkgs.clang-tools
    pkgs.scons
    pkgs.git-lfs
    pkgs.gemini-cli
    pkgs.ollama
    pkgs.wireguard-tools
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.tmux
    pkgs.fastfetch
    pkgs.jujutsu
    pkgs.bitwarden-cli
    pkgs.age
    pkgs.sops
  ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
    pkgs.google-chrome
    pkgs.vscode
    pkgs.vlc
    pkgs.discord
    pkgs.element-desktop
    pkgs.tailscale
    pkgs.steam
  ];
}
