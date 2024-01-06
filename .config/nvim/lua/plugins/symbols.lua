return {
  "simrat39/symbols-outline.nvim",
  config = function()
    require("symbols-outline").setup({
      auto_close = true,
    })
    vim.keymap.set("n", "<F8>", "<CMD>SymbolsOutline<CR>", { remap = false, silent = true })
  end,
}
