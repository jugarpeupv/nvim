-- return {}
return {
  "dhruvmanila/browser-bookmarks.nvim",
  version = "*",
  cmd = { "Telescope" },
  -- event = "VeryLazy",
  -- dependencies = {
  --   "kkharji/sqlite.lua",
  --   "nvim-telescope/telescope.nvim",
  -- },
  config = function()
    require("browser_bookmarks").setup({
      selected_browser = "chrome",
    })
  end,
}
