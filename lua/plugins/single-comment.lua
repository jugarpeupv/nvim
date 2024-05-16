return {
  "lucastavaresa/SingleComment.nvim",
  event = "VeryLazy",
  -- keybindings = { { { "n", "v" }, "gcc" }, { "n", "gca" } },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    vim.keymap.set("n", "gcc", require("SingleComment").SingleComment, { expr = true })
    vim.keymap.set("v", "gcc", require("SingleComment").Comment, {})
    vim.keymap.set("n", "gca", require("SingleComment").ToggleCommentAhead, {})
    vim.keymap.set("n", "gcA", require("SingleComment").CommentAhead, {})
    vim.keymap.set({ "n", "v" }, "gcb", require("SingleComment").BlockComment)
  end,
}
