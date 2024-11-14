require'lspconfig'.clangd.setup{
    cmd = {"clangd"},  -- Ensure this points to your clangd binary
    root_dir = require('lspconfig.util').root_pattern(".clangd", "compile_commands.json", "Makefile", ".git"),
    init_options = {
        fallbackFlags = { '-std=c++17' },  -- Adjust as needed
    },
}
