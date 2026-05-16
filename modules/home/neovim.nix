{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      # LazyVim dependencies
      git
      ripgrep
      fd
      fzf
      gcc
      gnumake
      unzip
      wget
      curl
      # Language servers / Tools
      lua-language-server
      stylua
      prettier
      shfmt
    ];
  };

  # LazyVim configuration
  xdg.configFile."nvim/init.lua".text = ''
    require("config.lazy")
  '';

  xdg.configFile."nvim/lua/config/lazy.lua".text = ''
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
      })
    end
    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup({
      spec = {
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        { "maxmx03/solarized.nvim" },
        { import = "plugins" },
      },
      defaults = {
        lazy = false,
        version = false,
      },
      install = { colorscheme = { "solarized", "tokyonight", "habamax" } },
      checker = { enabled = true },
      performance = {
        rtp = {
          disabled_plugins = {
            "gzip",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
          },
        },
      },
    })
  '';

  # Create empty placeholder files for standard LazyVim structure
  xdg.configFile."nvim/lua/config/options.lua".text = ''
    -- LazyVim provides default options. Add your own here.
    vim.o.background = "dark"
  '';
  xdg.configFile."nvim/lua/config/keymaps.lua".text = ''
    -- LazyVim provides default keymaps. Add your own here.
  '';
  xdg.configFile."nvim/lua/config/autocmds.lua".text = ''
    -- LazyVim provides default autocmds. Add your own here.
  '';
  xdg.configFile."nvim/lua/plugins/example.lua".text = ''
    return {
      -- Set the colorscheme
      {
        "LazyVim/LazyVim",
        opts = {
          colorscheme = "solarized",
        },
      },
      -- Configure solarized.nvim
      {
        "maxmx03/solarized.nvim",
        lazy = false,
        priority = 1000,
        opts = {
          variant = "winter", -- options: "spring", "summer", "autumn", "winter"
          transparent = {
            enabled = false,
          },
          styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = { bold = true },
            variables = {},
            numbers = {},
            strings = {},
            types = { italic = true },
            operators = {},
          },
        },
        config = function(_, opts)
          vim.o.termguicolors = true
          vim.o.background = "dark"
          require('solarized').setup(opts)
          vim.cmd.colorscheme 'solarized'
        end,
      },
    }
  '';
}
