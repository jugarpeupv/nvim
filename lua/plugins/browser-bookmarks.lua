-- return {}
return {
  "dhruvmanila/browser-bookmarks.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("browser_bookmarks").setup({
      selected_browser = "chrome",
    })
  end,
}
