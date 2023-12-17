return {
  'kevinhwang91/nvim-hlslens',
  config = function()
    require 'hlslens'.setup(
      {
        auto_enable = true,
        nearest_only = true,
        nearest_float_when = 'never',
        calm_down = true
      }
    )
  end
}
