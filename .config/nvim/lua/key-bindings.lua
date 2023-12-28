vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set('n', '<leader><Left>', ':wincmd h<CR>', { remap = false, silent = true })
vim.keymap.set('n', '<leader><Down>', ':wincmd j<CR>', { remap = false, silent = true })
vim.keymap.set('n', '<leader><Up>', ':wincmd k<CR>', { remap = false, silent = true })
vim.keymap.set('n', '<leader><Right>', ':wincmd l<CR>', { remap = false, silent = true })

-- Some defaults
vim.keymap.set('n', '<C-s>', ':w<CR>', { remap = false, silent = true })
vim.keymap.set('n', '<leader><Esc>', ':q<CR>', { remap = false, silent = true })
vim.keymap.set('n', '<leader><Tab>', ':bn<CR>')
vim.keymap.set('n', '<leader><S-Tab>', ':bp<CR>')
vim.keymap.set('n', '<C-w>', ':bw<CR>')


vim.keymap.set('n', '<S-Left>', ':vertical resize -2<CR>', { remap = false, silent = true })
vim.keymap.set('n', '<S-Right>', ':vertical resize +2<CR>', { remap = false, silent = true })
vim.keymap.set('n', '<S-Down>', ':resize -2<CR>', { remap = false, silent = true })
vim.keymap.set('n', '<S-Up>', ':resize +2<CR>', { remap = false, silent = true })


vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

