-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Prepend lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Set GUI font if running in GUI mode
if vim.fn.has("gui_running") then
  vim.opt.guifont = "Cascadia Code:h12" -- Adjust the size as needed
end

-- Lazy.nvim plugin setup
require("lazy").setup({
    { "neovim/nvim-lspconfig" },       -- LSP configurations
    { "hrsh7th/nvim-cmp" },            -- Completion plugin
    { "hrsh7th/cmp-nvim-lsp" },        -- LSP source for nvim-cmp
    { "L3MON4D3/LuaSnip" },            -- Snippet engine
    { "saadparwaiz1/cmp_luasnip" },    -- Snippet completions
    { "rafamadriz/friendly-snippets" }, -- Predefined snippets

    spec = {
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        { import = "lazyvim.plugins.extras.formatting.prettier" },
        { import = "plugins" },
    },
    
    defaults = {
        lazy = false,
        version = false,
    },
    
    install = {
        colorscheme = {
            "dracula",
            "projekt0n/github-nvim-theme",
            "folke/tokyonight.nvim",
            "navarasu/onedark.nvim",
            "rebelot/kanagawa.nvim",
            "sainnhe/gruvbox-material",
            "Mofiqul/vscode.nvim",
            "shaunsingh/nord.nvim",
            "lunarvim/darkplus.nvim",
            "EdenEast/nightfox.nvim",
            "catppuccin/nvim",
            "nyoom-engineering/oxocarbon.nvim",
            "rose-pine/neovim",
            "sainnhe/everforest",
        },
    },

    checker = {
        enabled = true,
        notify = false,
    },

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

-- Additional LSP and completion setup can go here
