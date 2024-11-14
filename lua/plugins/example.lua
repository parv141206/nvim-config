-- ~/.config/nvim/lua/plugins/plugins.lua

return {
  -- Mason for managing LSP servers and other tools
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  -- Telescope for fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          -- Default configuration for telescope goes here
        },
      })
    end,
  },

  -- Theme manager
  {
    "andrew-george/telescope-themes",
    config = function()
      require("telescope").load_extension("themes")
    end,
  },

  -- Dark themes
  { "dracula/vim", lazy = true }, -- Dracula theme
  { "projekt0n/github-nvim-theme", lazy = true }, -- GitHub Dark theme
  { "folke/tokyonight.nvim", lazy = true }, -- Tokyo Night theme
  { "navarasu/onedark.nvim", lazy = true }, -- One Dark theme
  { "rebelot/kanagawa.nvim", lazy = true }, -- Kanagawa theme
  { "sainnhe/gruvbox-material", lazy = true }, -- Gruvbox Material theme
  { "Mofiqul/vscode.nvim", lazy = true }, -- VSCode Dark theme
}
