{ ... }: {
  imports = [
    ../packages.nix
    ./git.nix
    ./zsh.nix
    ./ghostty.nix
    ./firefox.nix
    ./obsidian.nix
    ./zed.nix
    ./zsh.nix
    ./neovim.nix
    ./docker.nix
  ];

  programs.home-manager.enable = true;
}
