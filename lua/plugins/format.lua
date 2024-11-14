
return {

  "stevearc/conform.nvim",
  opts = function()
    local opts = {
      formatters_by_ft = {
        go = { "gopls" },  -- Ensure gopls is configured for Go files
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
      },
       formatters = {
        gopls = {
            command = "gopls",
            args = { "format" }, -- Specify any additional arguments if needed
        },
        prettier = {
            single_quote = true,
            jsx_single_quote = true,
        },
    },    }
    return opts
  end,
}
