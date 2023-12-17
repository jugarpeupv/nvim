return {
  'kevinhwang91/nvim-bqf',
  config = function()
    require('bqf').setup({
      auto_enable = true,
      auto_resize_height = true,   -- highly recommended enable
      preview = {
        auto_preview = false,
      }
    })
  end
}
