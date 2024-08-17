return {
  {
    'mistweaverco/kulala.nvim',
    ft = "http",
    config = function()
      require('kulala').setup({
        default_view = "headers_body"
      })
    end
  },
}
