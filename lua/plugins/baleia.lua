return {
  'm00qek/baleia.nvim',
  tag = 'v1.3.0',
  config = function()
    vim.g.terminal_color_0  = '#45475A'
    vim.g.terminal_color_1  = '#F38BA8'
    vim.g.terminal_color_2  = '#94E2D5'
    vim.g.terminal_color_3  = '#F9E2AF'
    vim.g.terminal_color_4  = '#B4BEFE'
    vim.g.terminal_color_5  = '#CA9EE6'
    vim.g.terminal_color_6  = '#89DCEB'
    vim.g.terminal_color_7  = '#CDD6F4'
    vim.g.terminal_color_8  = '#585B70'
    vim.g.terminal_color_9  = '#F38BA8'
    vim.g.terminal_color_10 = '#94E2D5'
    vim.g.terminal_color_11 = '#F9E2AF'
    vim.g.terminal_color_12 = '#89DCEB'
    vim.g.terminal_color_13 = '#F2CDCD'
    vim.g.terminal_color_14 = '#89DCEB'
    vim.g.terminal_color_15 = '#CDD6F4'

    local baleia            = require('baleia').setup {}

    vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
      pattern = '*-tmux-logs',
      callback = function()
        baleia.once(vim.fn.bufnr(vim.fn.expand('%')))
      end
    })
  end
}
