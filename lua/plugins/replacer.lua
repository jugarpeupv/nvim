return {
  dir = 'gabrielpoca/replacer.nvim',
  opts = { rename_files = false },
  keys = {
    {
      '<leader>hH',
      function() require('replacer').run() end,
      desc = "run replacer.nvim"
    }
  }
}
