-- return {}
return {
  -- keys = { '<leader>ff' },
  cmd = { "GrugFar" },
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup({
    })
  end
}
