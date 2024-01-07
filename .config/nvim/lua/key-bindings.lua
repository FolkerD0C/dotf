vim.g.mapleader = " "

-- Navigate between open windows
vim.keymap.set("n", "<leader><Left>", ":wincmd h<CR>", { remap = false, silent = true })
vim.keymap.set("n", "<leader><Down>", ":wincmd j<CR>", { remap = false, silent = true })
vim.keymap.set("n", "<leader><Up>", ":wincmd k<CR>", { remap = false, silent = true })
vim.keymap.set("n", "<leader><Right>", ":wincmd l<CR>", { remap = false, silent = true })

-- Some defaults
-- Save current file
vim.keymap.set("n", "<C-s>", ":w<CR>", { remap = false, silent = true })
-- Save all files
vim.keymap.set("n", "<C-S>", ":wa<CR>", { remap = false, silent = true })
-- Switch to next tab
vim.keymap.set("n", "<leader><Tab>", ":bn<CR>")
-- Switch to previous tab
vim.keymap.set("n", "<leader><S-Tab>", ":bp<CR>")

-- Make current window smaller vertically
vim.keymap.set("n", "<S-Left>", ":vertical resize -2<CR>", { remap = false, silent = true })
-- Make current window bigger vertically
vim.keymap.set("n", "<S-Right>", ":vertical resize +2<CR>", { remap = false, silent = true })
-- Make current window smaller horizontally
vim.keymap.set("n", "<S-Down>", ":resize -2<CR>", { remap = false, silent = true })
-- Make current window bigger horizontally
vim.keymap.set("n", "<S-Up>", ":resize +2<CR>", { remap = false, silent = true })

-- Clear search highlights
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

-- Advanced key bindings
-- Close current window or neovim if current window is the last in this tab besides neo-tree
vim.keymap.set("n", "<leader><Esc>",
  function()
    if Neotree_is_open then
      vim.cmd("Neotree close")
    end
    vim.cmd("q")
  end,
  { remap = false, silent = true }
)

-- Close current buffer
-- Can close current tab if there is only one buffer + neo-tree open
vim.keymap.set("n", "<C-w>",
  function()
    local _neotree_was_open = false
    if Neotree_is_open then
      vim.cmd("Neotree close")
      _neotree_was_open = true
    end
    vim.cmd("bd")
    if _neotree_was_open then
      local _current_win_id = vim.api.nvim_get_current_win()
      vim.cmd("Neotree reveal")
      vim.api.nvim_set_current_win(_current_win_id)
    end
  end,
  { remap = false, silent = true }
)
