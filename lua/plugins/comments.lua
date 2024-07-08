-- return {}
return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  },

  {
    "lucastavaresa/SingleComment.nvim",
    -- event = "VeryLazy",
    -- keybindings = { { { "n", "v" }, "gcc" }, { "n", "gca" } },
    -- keys = { { { "n", "v" }, "gcc" }, { "n", "gca" } },
    -- dependencies = {
    --   "nvim-treesitter/nvim-treesitter",
    --   "JoosepAlviste/nvim-ts-context-commentstring",
    -- },
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function()
      vim.keymap.set("n", "gcc", require("SingleComment").SingleComment, { expr = true })
      vim.keymap.set("v", "gcc", require("SingleComment").Comment, {})
      vim.keymap.set("n", "gca", require("SingleComment").ToggleCommentAhead, {})
      vim.keymap.set("n", "gcA", require("SingleComment").CommentAhead, {})
      vim.keymap.set({ "n", "v" }, "gcb", require("SingleComment").BlockComment)
    end,
  },
}
