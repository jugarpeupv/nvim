-- return {}
return {
  "andymass/vim-matchup",
  -- event = { "VeryLazy" },
  event = {"BufReadPost", "BufNewFile"},
  -- keys = { "%", mode = "n" },
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end
}
