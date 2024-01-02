-- return {}
return {
  "roobert/tailwindcss-colorizer-cmp.nvim",
  -- optionally, override the default options:
  event = "VeryLazy",
  config = function()
    require("tailwindcss-colorizer-cmp").setup({
      color_square_width = 2,
    })
  end,
}
