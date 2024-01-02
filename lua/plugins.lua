return {
  { "HiPhish/nvim-ts-rainbow2",                     after = "nvim-treesitter" },
  { "vim-scripts/ReplaceWithRegister" },
  { "wellle/targets.vim" },
  { "junegunn/fzf",                                 build = "./install --all" },
  { "junegunn/fzf.vim" },
  { "dfendr/clipboard-image.nvim" },
  { "tpope/vim-repeat",                             event = "VeryLazy" },
  { "nvim-lua/plenary.nvim",                        event = "VeryLazy" },
  { "christoomey/vim-tmux-navigator",               event = "VeryLazy" },
  { "tpope/vim-surround",                           event = "VeryLazy" },
  { "nvim-tree/nvim-web-devicons",                  event = "VeryLazy" },
  { "nvim-telescope/telescope-fzf-native.nvim",     build = "make",            event = "VeryLazy" },
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
  {
    "ckipp01/nvim-jenkinsfile-linter",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
  },
}
