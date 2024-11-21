-- ~/.config/nvim/lua/plugins/neo-tree.lua

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim", -- Required for Neo-tree
  },
{
  "azratul/live-share.nvim",
  dependencies = {
    "jbyuki/instant.nvim",
  }
},
 {
        'gorbit99/codewindow.nvim',
        config = function()
            require('codewindow').setup({
                -- Add your custom configuration options here
                active_in_terminals = false,
                auto_enable = true,
                exclude_filetypes = { 'help' },
                window_border = 'single',
minimap_width = 10, 
            })
        end,
    },
{
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
},
{
    "xiyaowong/transparent.nvim",
    lazy = false, --this was SUPER IMPORTANT
    config = function()
        require("transparent").setup({ -- Optional, you don't have to run setup.
            groups = {           -- table: default groups
                "Normal",
                "NormalNC",
                "Comment",
                "Constant",
                "Special",
                "Identifier",
                "Statement",
                "PreProc",
                "Type",
                "Underlined",
                "Todo",
                "String",
                "Function",
                "Conditional",
                "Repeat",
                "Operator",
                "Structure",
                "LineNr",
                "NonText",
                "SignColumn",
                "CursorLine",
                "CursorLineNr",
                "StatusLine",
                "StatusLineNC",
                "EndOfBuffer",
            },
            extra_groups = {"NeoTreeNormal","NeoTreeNormalNC"}, -- and this was super important as well
            exclude_groups = {}, -- table: groups you don't want to clear
        })
    end,
},
{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
},
 {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('telescope').setup {
            defaults = {
                -- Your default configuration here
            },
        }
    end,
},
  -- Add your theme plugin here, for example:
  {
    "folke/tokyonight.nvim", -- Example theme
    config = function()
      vim.cmd("colorscheme tokyonight") -- Set a default theme
    end,
  },
{
  "azratul/live-share.nvim",
  dependencies = {
    "jbyuki/instant.nvim",
  },
  config = function()
    vim.g.instant_username = "parv141206"
   require("live-share").setup({
  port_internal = 9876, -- The local port to be used for the live share connection
  max_attempts = 20, -- Maximum number of attempts to read the URL from service(serveo.net or localhost.run), every 250 ms
  service_url = "/tmp/service.url", -- Path to the file where the URL from serveo.net will be stored
  service = "nokey@localhost.run", -- Service to use, options are serveo.net or localhost.run
})  end
},
  {
    "mattn/emmet-vim", -- Emmet plugin
    ft = { "html", "css", "javascript", "typescript", "jsx", "tsx" }, -- Specify file types
    config = function()
      vim.g.user_emmet_leader_key = '<C-e>' -- Set your preferred leader key for Emmet
    end,
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end
  },
  branch = "v3.x",
  config = function()

    require("neo-tree").setup({
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      sort_case_insensitive = false,
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          provider = function(icon, node)
            local success, web_devicons = pcall(require, "nvim-web-devicons")
            if success then
              local devicon, hl = web_devicons.get_icon(node.name)
              icon.text = devicon or icon.text
              icon.highlight = hl or icon.highlight
            end
          end,
          highlight = "NeoTreeFileIcon",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
      },
      window = {
        position = "left",
        width = 40,
        mappings = {
          ["<CR>"] = "open",
          ["<2-LeftMouse>"] = "open",
          ["d"] = "delete", -- Delete file/folder
          ["a"] = "add", -- Add file/folder
          ["r"] = "rename", -- Rename file/folder
          ["q"] = "close_window", -- Close Neo-tree window
        },
      },
    })
  end,
}
