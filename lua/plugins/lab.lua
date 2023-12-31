return {
  "0x100101/lab.nvim",
  build = "cd js && npm ci",
  event = "VeryLazy",
  config = function()
    require("lab").setup({
      code_runner = {
        enabled = true,
      },
      quick_data = {
        enabled = false,
      },
    })
  end
}
