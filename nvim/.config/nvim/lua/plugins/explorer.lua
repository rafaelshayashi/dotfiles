return {
  -- Oil.nvim: Edit filesystem like a regular Neovim buffer
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        view_options = { show_hidden = true },
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in Oil" })
    end,
  },

  -- Neo-tree: Project tree sidebar with compact Java folders
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer Sidebar" },
    },
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        group_empty_dirs = true, -- Collapses nested Java packages
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = { ".git", ".DS_Store" },
        },
      },
    },
  },
}
