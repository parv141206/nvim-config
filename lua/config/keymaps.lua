-- keybinding.lua

-- Set keybindings for splitting windows
vim.api.nvim_set_keymap("n", "<C-w>v", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical Split" }) -- Ctrl + w v
vim.api.nvim_set_keymap("n", "<C-w>s", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal Split" }) -- Ctrl + w s
-- Move to the left split
vim.api.nvim_set_keymap('n', '<C-W><Left>', '<C-W>h', { noremap = true, silent = true })
-- Move to the down split
vim.api.nvim_set_keymap('n', '<C-W><Down>', '<C-W>j', { noremap = true, silent = true })
-- Move to the up split
vim.api.nvim_set_keymap('n', '<C-W><Up>', '<C-W>k', { noremap = true, silent = true })
-- Move to the right split
vim.api.nvim_set_keymap('n', '<C-W><Right>', '<C-W>l', { noremap = true, silent = true })
local cmp = require('cmp')

-- Set up nvim-cmp with custom keybindings
cmp.setup({
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),  -- Trigger completion
    },
    -- Additional configuration options can go here
})

-- Optionally, you can add a description for the keybinding
vim.keymap.set('i', '<C-Space>', cmp.mapping.complete(), { desc = "Show completion suggestions" })
