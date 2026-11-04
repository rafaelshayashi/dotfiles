return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff: Working Tree" },
      { "<leader>gD", "<cmd>DiffviewOpen origin/HEAD...HEAD<cr>", desc = "Git Diff: PR Review" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git History: Current File" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Git History: Repo" },
      { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Git Diff: Close" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { layout = "diff2_horizontal" },
        merge_tool = { layout = "diff3_mixed", disable_diagnostics = true },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        map("n", "]h", gs.next_hunk, "Next Git Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Git Hunk")
        map("n", "<leader>gp", gs.preview_hunk, "Git: Preview Hunk")
        map("n", "<leader>gs", gs.stage_hunk, "Git: Stage Hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Git: Reset Hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Git: Blame Line")
      end,
    },
  },
}
