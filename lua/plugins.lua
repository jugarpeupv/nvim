return {
  { "vim-scripts/ReplaceWithRegister", keys = { { "gr", "n" } } },
  { "wellle/targets.vim",              event = { "BufReadPost", "BufNewFile" } },
  { "junegunn/fzf",                    build = "./install --all",              event = { "BufReadPost", "BufNewFile" } },
  { "junegunn/fzf.vim",                event = { "BufReadPost", "BufNewFile" } },
  { "tpope/vim-repeat",                keys = { "." } },
  { "nvim-lua/plenary.nvim",           event = "VeryLazy" },
  { "tpope/vim-surround",              event = { "BufReadPost", "BufNewFile" } },
  { "windwp/nvim-ts-autotag",          after = "nvim-treesitter",              ft = "html" },
  { "tpope/vim-fugitive",              event = { "VeryLazy" } },
  { "tpope/vim-dispatch",              event = { "BufReadPost", "BufNewFile" } },
  { "kkharji/sqlite.lua",              event = "VeryLazy" },
  { "stsewd/fzf-checkout.vim",         event = { "BufReadPost", "BufNewFile" } },
  {
    "ckipp01/nvim-jenkinsfile-linter",
    keys = { "<leader>va" }
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
  { "neoclide/jsonc.vim", ft = { "json" } },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },
}
