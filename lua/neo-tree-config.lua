-- ~/.config/nvim/lua/neo-tree-config.lua

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
})

-- Key mappings for creating and deleting files/folders
vim.api.nvim_set_keymap("n", "<leader>nf", ":NeoTreeAdd<CR>", { noremap = true, silent = true, desc = "Create File" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>nd",
  ":NeoTreeAdd --type directory<CR>",
  { noremap = true, silent = true, desc = "Create Directory" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  ":NeoTreeDelete<CR>",
  { noremap = true, silent = true, desc = "Delete File/Folder" }
)
