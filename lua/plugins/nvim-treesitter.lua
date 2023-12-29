return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    -- { "elgiano/nvim-treesitter-angular" ,
    -- branch = "topic/jsx-fix" }
  },
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
}
