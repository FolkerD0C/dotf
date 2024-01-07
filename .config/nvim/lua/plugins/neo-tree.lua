return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<F2>", ":Neotree filesystem toggle left<CR>", {
      remap = false,
      silent = true,
    })
    vim.keymap.set("n", "<leader>f", ":Neotree buffers reveal float<CR>", {
      remap = false,
      silent = true,
    })
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
      event_handlers = {
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            Neotree_is_open = true
          end
        },
        {
          event = "neo_tree_window_after_close",
          handler = function(args)
            Neotree_is_open = false
          end
        }
      }
    })
  end,
}
