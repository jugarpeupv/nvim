return {
  { "vim-scripts/ReplaceWithRegister",              event = "VeryLazy" },
  { "wellle/targets.vim",                           event = "VeryLazy" },
  { "junegunn/fzf",                                 build = "./install --all", event = "VeryLazy" },
  { "junegunn/fzf.vim",                             event = "VeryLazy" },
  { "tpope/vim-repeat",                             event = "VeryLazy" },
  { "nvim-lua/plenary.nvim",                        event = "VeryLazy" },
  { "tpope/vim-surround",                           event = "VeryLazy" },
  { "windwp/nvim-ts-autotag",                       after = "nvim-treesitter", event = "VeryLazy" },
  { "tpope/vim-fugitive",                           event = "VeryLazy" },
  { "tpope/vim-dispatch",                           event = "VeryLazy" },
  { "kkharji/sqlite.lua",                           event = "VeryLazy" },
  { "stsewd/fzf-checkout.vim",                      event = "VeryLazy" },
  {
    "ckipp01/nvim-jenkinsfile-linter",
    event = "VeryLazy",
  },
  {
    "mbbill/undotree",
    -- cmd = { 'UndotreeShow', 'UndotreeToggle' },
    event = "VeryLazy",
    config = function()
      -- vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)
      vim.g.undotree_WindowLayout = 3
      vim.keymap.set("n", "<leader>ux", vim.cmd.UndotreeToggle)
      vim.keymap.set("n", "<leader>ud", vim.cmd.UndotreeShow)
    end,
  },
  { "neoclide/jsonc.vim", ft = { 'json' } },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },
}
