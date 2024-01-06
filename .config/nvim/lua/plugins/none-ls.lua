return {
  "nvimtools/none-ls.nvim",
  config = function()
    vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, {})
  end,
}
