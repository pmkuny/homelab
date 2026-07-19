{ ... }: {
  imports = [
    ../packages.nix
    ./git.nix
    ./zsh.nix
    ./ghostty.nix
    ./neovim.nix
    ./docker.nix
  ];

  programs.home-manager.enable = true;
}
