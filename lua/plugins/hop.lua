return {
  {
    "phaazon/hop.nvim",
    -- event = "VeryLazy",
    branch = "v1",
    keys = { { "<leader>w", mode = "n" } },
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
}
