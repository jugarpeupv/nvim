-- return {}
return {
  "norcalli/nvim-colorizer.lua",
  event = "VeryLazy",
  config = function()
    require 'colorizer'.setup({
      yaml = { names = false },
      md = { names = false },
      markdown = { names = false },
      scss = { names = false },
      [".scss"] = { names = false },
      [".md"] = { names = false },
      ["*"] = { names = false }
    })
  end
}
