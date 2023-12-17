return {
  'yorickpeterse/nvim-pqf',
  config = function()
    require('pqf').setup({
      signs = {
        error = '',
        warning = '',
        info = '',
        hint = "󰠠",
      },
      show_multiple_lines = false
    })
  end
}
