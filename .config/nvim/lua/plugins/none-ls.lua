return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua.with({
          extra_args = {
            "--config-path", "$HOME/.config/nvim/lua/config/.stylua.toml"
          }
        }),
        null_ls.builtins.formatting.shellharden,
        null_ls.builtins.diagnostics.shellcheck,
      },
    })

    vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, {})
  end,
}
