-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("neo-tree").setup({})
require("neo-tree-config")
-- Set your username for instant.nvim
vim.g.instant_username = "parv141206"  -- Replace with your desired username
require'lspconfig'.rust_analyzer.setup{
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            procMacro = {
                enable = true,
            },
        },
    },
}

-- GOLANG


-- init.lua
require('lspconfig').gopls.setup {
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("Format", { clear = true }),
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
}

-- Basic Neovim settings for Go
vim.opt.tabstop = 4           -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4        -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 4       -- Number of spaces that a <Tab> counts for while editing
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.autoindent = true     -- Copy indent from current line when starting a new line
vim.opt.list = false  -- This sets nolist




require("bufferline").setup {
  options = {
    -- Other options...
    always_show_bufferline = false, -- Show bufferline at all times
    custom_filter = function(buf_number, buf_numbers)
      local buf_name = vim.fn.bufname(buf_number)
      -- Exclude terminal buffers even if it ends with pwsh or .exe
      if vim.bo[buf_number].filetype == "terminal" or buf_name == "term://*" or buf_name:match("%.exe$") or buf_name:match("%.pwsh$") then
        return false
      end
      return true -- Show all other buffers
    end,
  },
}



-- Set fill characters for empty lines
vim.opt.fillchars = { eob = '~' }  -- Show tildes on empty lines

-- Line number settings
vim.opt.number = true               -- Show absolute line numbers
vim.opt.relativenumber = true       -- Show relative line numbers

-- GUI font setting
vim.opt.guifont = "Cascadia Code:h14"

-- Highlight settings for EndOfBuffer
local endOfBufferHighlight = { fg = "#ff61a5", bg = "NONE" }
vim.api.nvim_set_hl(0, "EndOfBuffer", endOfBufferHighlight) -- GUI color
vim.api.nvim_set_hl(0, "EndOfBuffer", { ctermfg = "cyan", ctermbg = "NONE" }) -- Terminal color

-- Reapply highlight settings on buffer enter
vim.cmd [[
augroup MyHighlightGroup
    autocmd!
    autocmd BufEnter * lua vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#ff61a5", bg = "NONE" })
augroup END
]]

-- Set color for vertical split lines
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#ffffff", bg = "NONE" }) -- Vertical split line color

-- Customize highlight groups
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" }) -- Current line highlight color
vim.api.nvim_set_hl(0, "LineNr", { fg = "#eeeeee", bg = "NONE" }) -- Inactive line number color (grey)
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#00ddaa", bg = "NONE" }) -- Active line number color (cyan)
vim.api.nvim_set_hl(0, "SignColumn", { fg = "#ffffff", bg = "NONE" }) -- Sign column color
vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#ffffff", bg = "NONE" }) -- Deleted diff color
vim.api.nvim_set_hl(0, "Cursor", { fg = "#ffffff", bg = "NONE" }) -- Cursor color
vim.api.nvim_set_hl(0, "CursorColumn", { fg = "#ffffff", bg = "NONE" }) -- Cursor column color
vim.api.nvim_set_hl(0, "Conceal", { fg = "#ffffff", bg = "NONE" }) -- Concealed text color
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#ffffff", bg = "NONE" }) -- Inactive status line color
vim.api.nvim_set_hl(0, "FoldColumn", { fg = "#ffffff", bg = "#ffff00" }) -- Fold column color (yellow)
vim.api.nvim_set_hl(0, "CursorLineFold", { fg = "#ffffff", bg = "NONE" }) -- Cursor line fold color

-- Indentation lines (if using indent-blankline.nvim)
vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "NONE" }) -- Indentation line color

-- Neo-tree specific colors (if applicable)
vim.api.nvim_set_hl(0, "NeoTreeTime", { fg = "#FFCC00" }) -- Color for time/date in Neo-tree
vim.api.nvim_set_hl(0, "NeoTreeFileNameDisabled", { fg = "#FFFF00", bg = "NONE" }) -- Yellow for disabled files

-- Highlight groups with italic styles
local italicHighlights = {"Comment", "Function", "Identifier", "Type"}
for _, group in ipairs(italicHighlights) do
    vim.api.nvim_set_hl(0, group, { italic = true })
end

-- Enable cursorline to highlight the current line
vim.o.cursorline = true

-- NonText highlight (for tildes)
vim.api.nvim_set_hl(0, "NonText", { fg = "#00ddaa" }) -- Color for tildes on empty lines

-- WinSeparator color setting (for window separators)
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff" })

-- Additional comments for clarity:
-- The following highlights are placeholders; you can customize them as needed.
-- Last search pattern highlighting would typically go here.
-- Set background to transparent for diff highlight groups would go here.
-- Changed text within a changed line (orange) would go here.local lspconfig = require('lspconfig')

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }
-- Apply your custom colors for Neo-tree
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#000000"  , blend=40}) -- Transparent background for normal Neo-tree window
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#000000" }) -- Transparent background for non-current Neo-tree windows
vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { fg = "#ff61a5", bg = "NONE" }) -- Color for end-of-buffer tildes
vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#ffffff" }) -- Color for indentation markers

-- Set color for disabled files (like git-ignored files)
vim.api.nvim_set_hl(0, "NeoTreeFileNameDisabled", { fg = "#FFFF00", bg = "NONE" }) -- Yellow color for disabled files


local lualine = require('lualine')

-- Define a custom theme for lualine with transparent background
local custom_theme = {
    normal = {
        a = { fg = '#ffffff', bg = 'NONE', gui = 'bold' },
        b = { fg = '#ffffff', bg = 'NONE' },
        c = { fg = '#ffffff', bg = 'NONE' },
    },
    insert = {
        a = { fg = '#ffffff', bg = 'NONE' },
    },
    visual = {
        a = { fg = '#ffffff', bg = 'NONE' },
    },
    replace = {
        a = { fg = '#ffffff', bg = 'NONE' },
    },
    command = {
        a = { fg = '#ffffff', bg = 'NONE' },
    },
    inactive = {
        a = { fg = '#ffffff', bg = 'NONE' },
        b = { fg = '#ffffff', bg = 'NONE' },
        c = { fg = '#ffffff', bg = 'NONE' },
    }
}

-- Setup lualine with the custom theme
lualine.setup({
    options = {
        theme = custom_theme,
        component_separators = '',
        section_separators = '',
        icons_enabled = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'location' },
        lualine_z = { 'progress' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
})


