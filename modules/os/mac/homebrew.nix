{ ... }: {
  homebrew = {
    enable = true;
    taps = [
      "siderolabs/tap"
    ];
    brews = [
      "talosctl"
      "kubectl"
    ];
    casks = [
      "alt-tab"
      "anaconda"
      "antigravity"
      "antigravity-cli"
      "discord"
      "docker"
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
