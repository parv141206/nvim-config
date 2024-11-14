return {
{ "zaldih/themery.nvim", lazy = false, config = function()
      require("themery").setup({
        themes = {
          { name = "Gruvbox", colorscheme = "gruvbox" },
          { name = "Kanagawa", colorscheme = "kanagawa" },
          { name = "Catppuccin", colorscheme = "catppuccin" },
          { name = "Rose Pine", colorscheme = "rose-pine" },
          { name = "Everforest", colorscheme = "everforest" },
          { name = "Nightfly", colorscheme = "nightfly" },
          { name = "Papercolor", colorscheme = "papercolor" },
          { name = "Apprentice", colorscheme = "apprentice" },
          { name = "Tokyo Night", colorscheme = "tokyonight" },
          { name = "One Dark", colorscheme = "onedark" },
          { name = "VSCode", colorscheme = "vscode" },
          { name = "Material", colorscheme = "material" },
          { name = "Sonokai", colorscheme = "sonokai" },
          { name = "Nord", colorscheme = "nord" },
          { name = "GitHub", colorscheme = "github-nvim-theme" },
          { name = "Gruvbox Material", colorscheme = "gruvbox-material" },
          { name = "Nightfox", colorscheme = "nightfox" },
          { name = "Poimandres", colorscheme = "poimandres" },
          { name = "Palenight", colorscheme = "palenight" }
        },
        livePreview = true, -- Enable live preview of themes
      })
    end
  }, 
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 }, -- Ensure high priority
  { "rose-pine/neovim", name = "rose-pine" },
  { "sainnhe/everforest" },
  { "bluz71/vim-nightfly-colors" },
  { "NLKNguyen/papercolor-theme" },
  { "romainl/Apprentice" },

  -- Additional popular dark themes
  { "folke/tokyonight.nvim" },
  { "navarasu/onedark.nvim" },
  { "Mofiqul/vscode.nvim" },
  { "marko-cerovac/material.nvim" },
  { "sainnhe/sonokai" },
  { "shaunsingh/nord.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "sainnhe/gruvbox-material" },
  { "EdenEast/nightfox.nvim" },
  { "olivercederborg/poimandres.nvim" },
  { "alexmozaidze/palenight.nvim", lazy = true },
  -- Configure LazyVim to load colorscheme
--  {
--    "LazyVim/LazyVim",
--    opts = {
--      colorscheme = "gruvbox", -- Set default colorscheme to catppuccin
--    },
--  },
   {
   "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin", -- Set default colorscheme to catppuccin
    },
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    opts = {
      style = "night",
      priority = 1000,
      transparent = true,
      styles = {
        sidebar = "transparent",
        float = "transparent",
        hover = "transparent",
        prompt = "transparent",
        hint = "transparent",
        indent = "transparent",
      }
    }
  },
  -- Set up Catppuccin with flavors
   {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    term_colors = true,
    transparent_background = true,
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      treesitter = true,
      harpoon = true,
      telescope = true,
      mason = true,
      noice = true,
      notify = true,
      which_key = true,
      fidget = true,
       neotree = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      mini = {
        enabled = true,
        indentscope_color = "",
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
}}
