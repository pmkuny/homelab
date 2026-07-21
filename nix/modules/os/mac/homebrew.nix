{ ... }: {
  homebrew = {
    enable = true;
    taps = [
      "siderolabs/tap"
      "fluxcd/tap"
    ];
    brews = [
      "cilium-cli"
      "helm"
      "kubectl"
      "siderolabs/tap/talosctl"
      "fluxcd/tap/flux"
      "yq"
    ];
    casks = [
      "alt-tab"
      "anaconda"
      "antigravity"
      "antigravity-cli"
      "discord"
      "docker-desktop"
      "element"
      "eqmac"
      "firefox"
      "font-hack-nerd-font"
      "google-chrome"
      "ghostty"
      "jordanbaird-ice"
      "macmediakeyforwarder"
      "microsoft-auto-update"
      "microsoft-teams"
      "microsoft-word"
      "mullvad-vpn"
      "music-presence"
      "notunes"
      "nvidia-geforce-now"
      "onedrive"
      "raycast"
      "stats"
      "steam"
      "stremio"
      "tailscale-app"
      "tidal"
      "vlc"
    ];

  onActivation = {
    autoUpdate = false;
    upgrade = false;
    cleanup = "uninstall";
  };
 };
}
