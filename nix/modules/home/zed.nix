{ config, lib, ... }:

{
  programs.zed-editor = {
      enable = true;
      mutableUserSettings = true;
      extensions = ["zed-legacy-themes"];
      userSettings = {
        disable_ai = true;
        buffer_font_size = 16;
        buffer_font_family = "JetBrains Nerd Font Mono";
        base_keymap = "VSCode";
        vim_mode = true;
        relative_line_numbers = true;
        ui_font_size = 16;
        theme = {
          mode = "system";
          light = "Zed Legacy: Solarized Light";
          dark = "Zed Legacy: Solarized Dark";
        };
      };
  };
}
