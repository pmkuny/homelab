{ config, pkgs, ... }:


#let
#  zellijeval = ''
#    if [[ -z "$ZELLIJ" ]]; then
#        if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
#            zellij attach -c
#        else
#            zellij
#        fi
#
#        if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
#            exit
#        fi
#    fi
#  '';
#in
{

    imports = [
      ../base.nix
      ../obsidian.nix
      ../firefox.nix
      ../zed.nix
      ./ssh.nix
      ./git.nix
    ];


#    programs.git.settings = {
#      user.name = "Patrick Kuny";
#      user.email = "31052319+pmkuny@users.noreply.github.com";
#    };

#    programs.jujutsu.enable = true;
#
#    programs.jujutsu.settings = {
#      user.name = "Patrick Kuny";
#      user.email = "31052319+pmkuny@users.noreply.github.com";
#      ui.editor = "nvim";
#    };


    programs.zsh = {
        enable = true;
        oh-my-zsh.enable = true;
        initContent = ''
            bindkey -e
            bindkey -v
            eval "$(starship init zsh)"
            bindkey -M viins '^[' vi-cmd-mode

            # Force Ctrl+[ to enter normal mode explicitly in all keymaps
            bindkey -M viins '^[' vi-cmd-mode
            bindkey -M visual '^[' vi-cmd-mode

            # Ensure bracketed paste terminates gracefully without dropping characters
            bindkey -M viins '^[[200~' bracketed-paste
            bindkey -M vicmd '^[[200~' bracketed-paste

            # Fix Starship redrawing from destroying the ZLE paste stack
            function zle-keymap-select() {
              if [[ $KEYMAP == vicmd ]]; then
                # Keep standard mode tracking, but do not clear pending buffers
                echo -ne "\e[2 q"
              else
                echo -ne "\e[5 q"
              fi
              zle reset-prompt
            }
            zle -N zle-keymap-select
        '';

        shellAliases = {
        k = "kubectl";
        tf = "terraform";
        pl = "pulumi";
        tc = "talosctl";
        };
    };
}
