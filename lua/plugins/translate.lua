-- return {}
return {
  "uga-rosa/translate.nvim",
  event = "VeryLazy",
  config = function()
    require("translate").setup({
      default = {
        output = "replace"
      },
      preset = {
        output = {
          replace = "head"
        },
      },
    })
  end,
}