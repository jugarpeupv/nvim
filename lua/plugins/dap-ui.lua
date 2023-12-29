return {
  'rcarriga/nvim-dap-ui',
  event = "VeryLazy",
  dependencies = { 'mfussenegger/nvim-dap' },
  config = function()
    require("dapui").setup()
  end
}
