return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<F2>', ':Neotree filesystem toggle left<CR>', {})
        vim.keymap.set('n', '<leader>f', ':Neotree buffers reveal float<CR>', {})
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false
                }
            }
        })
    end
}
