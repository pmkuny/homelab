{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = null;
    policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
            Value = true;
            Locked = false;
            Cryptomining = false;
            Fingerprinting = false;
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
        "dom.security.https_only_mode" = false;
        "mousewheel.with_control.action" = 3;
        "mousewheel.with_cmd.action" = 3;
      };
    };
  };
}
