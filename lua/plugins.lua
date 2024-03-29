return {
  { "HiPhish/nvim-ts-rainbow2",                     after = "nvim-treesitter" },
  { "vim-scripts/ReplaceWithRegister" },
  { "wellle/targets.vim" },
  { "junegunn/fzf",                                 build = "./install --all" },
  { "junegunn/fzf.vim" },
  { "dfendr/clipboard-image.nvim" },
  { "tpope/vim-repeat",                             event = "VeryLazy" },
  { "nvim-lua/plenary.nvim",                        event = "VeryLazy" },
  { "tpope/vim-surround",                           event = "VeryLazy" },
  { "nvim-tree/nvim-web-devicons",                  event = "VeryLazy" },
  { "natecraddock/telescope-zf-native.nvim" },
  -- { "nvim-telescope/telescope-fzf-native.nvim",     build = "make",            event = "VeryLazy" },
  { "nvim-telescope/telescope-live-grep-args.nvim", event = "VeryLazy" },
  { "nvim-telescope/telescope-ui-select.nvim",      event = "VeryLazy" },
  { "jose-elias-alvarez/typescript.nvim",           event = "VeryLazy" },
  { "onsails/lspkind.nvim",                         event = "VeryLazy" },
  { "windwp/nvim-ts-autotag",                       after = "nvim-treesitter", event = "VeryLazy" },
  { "tpope/vim-fugitive",                           event = "VeryLazy" },
  { "tpope/vim-dispatch",                           event = "VeryLazy" },
  { "kkharji/sqlite.lua",                           event = "VeryLazy" },
  { "nvim-telescope/telescope-smart-history.nvim",  event = "VeryLazy" },
  { "stsewd/fzf-checkout.vim",                      event = "VeryLazy" },
  { "mfussenegger/nvim-jdtls" },
  -- { 'Mofiqul/vscode.nvim' },
  {
    "ckipp01/nvim-jenkinsfile-linter",
    -- dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
  },
  -- {
  --   "f-person/git-blame.nvim",
  --   config = function()
  --     require("gitblame").setup({
  --       --Note how the `gitblame_` prefix is omitted in `setup`
  --       enabled = false,
  --     })
  --     -- vim.g.gitblame_schedule_event = "CursorHold"
  --     -- vim.g.gitblame_clear_event = "CursorHoldI"
  --     vim.g.gitblame_highlight_group = "CursorLine"
  --   end,
  -- },
  -- {
  --   "jiaoshijie/undotree",
  --   dependencies = "nvim-lua/plenary.nvim",
  --   config = true,
  --   keys = { -- load the plugin only when using it's keybinding:
  --     { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  --   },
  -- },
  { "mbbill/undotree", event = "VeryLazy" },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = "cd app && yarn install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   ft = { "markdown" },
  -- },
}
