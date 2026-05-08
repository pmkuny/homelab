{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    # Use Platform-Specific defualt paths
    configPath = if pkgs.stdenv.isDarwin then "Library/Application Support/Firefox" else ".mozilla/firefox";
    enable = true;
    policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
        };
    };

    profiles.default = {
      isDefault = true;
      settings = {
        "browser.bookmarks.showMobileBookmarks" = true;
        "browser.toolbars.bookmarks.visibility" = "always";
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.search.selectedEngine" = "DuckDuckGo";
        "privacy.donottrackheader.enabled" = true;
        "dom.security.https_only_mode" = true;
        "mousewheel.with_control.action" = 3; 
        "mousewheel.with_cmd.action" = 3;
      };
    };
  };
}
