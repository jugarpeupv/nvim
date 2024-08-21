return {
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
    keys = {
      {
        "<leader>gw",
        mode = { "n" },
        function()
          vim.cmd("Glow")
        end,
      },
    },
    opts = { border = "none", width = 100, height = 100, width_ratio = 0.9, height_ratio = 0.9 },
  },
}
