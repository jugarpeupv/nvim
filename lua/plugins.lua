return {
  { "HiPhish/nvim-ts-rainbow2",                     after = "nvim-treesitter",                   event = "VeryLazy" },
  { "tpope/vim-repeat",                             event = "VeryLazy" },
  { "nvim-treesitter/nvim-treesitter-context",      event = "VeryLazy" },
  { "wellle/targets.vim",                           event = "VeryLazy" },
  { "0x100101/lab.nvim",                            build = "cd js && npm ci",                   event = "VeryLazy" },
  { "sindrets/diffview.nvim",                       event = "VeryLazy" },
  { "mogelbrod/vim-jsonpath",                       event = "VeryLazy" },
  { "lukas-reineke/indent-blankline.nvim",          event = "VeryLazy" },
  { "akinsho/git-conflict.nvim",                    version = "*",                               event = "VeryLazy" },
  { "nvim-lua/plenary.nvim",                        event = "VeryLazy" },
  { "christoomey/vim-tmux-navigator",               event = "VeryLazy" },
  { "tpope/vim-surround",                           event = "VeryLazy" },
  { "vim-scripts/ReplaceWithRegister",              event = "VeryLazy" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-lualine/lualine.nvim",                    event = "VeryLazy" },
  { "nvim-telescope/telescope-fzf-native.nvim",     build = "make",                              event = "VeryLazy" },
  { "nvim-telescope/telescope.nvim",                branch = "0.1.x",                            event = "VeryLazy" },
  { "nvim-telescope/telescope-live-grep-args.nvim", event = "VeryLazy" },
  { "nvim-telescope/telescope-ui-select.nvim",      event = "VeryLazy" },
  { "hrsh7th/nvim-cmp",                             event = "VeryLazy" },
  { "hrsh7th/cmp-nvim-lua",                         event = "VeryLazy" },
  { "hrsh7th/cmp-nvim-lsp",                         event = "VeryLazy" },
  { "hrsh7th/cmp-buffer",                           event = "VeryLazy" },
  { "hrsh7th/cmp-path",                             event = "VeryLazy" },
  { "L3MON4D3/LuaSnip",                             event = "VeryLazy" },
  { "saadparwaiz1/cmp_luasnip",                     event = "VeryLazy" },
  { "rafamadriz/friendly-snippets",                 event = "VeryLazy" },
  { "williamboman/mason.nvim",                      event = "VeryLazy" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig",                        event = "VeryLazy" },
  { "jose-elias-alvarez/typescript.nvim",           event = "VeryLazy" },
  { "nvimtools/none-ls.nvim",                       event = "VeryLazy" },
  { "onsails/lspkind.nvim",                         event = "VeryLazy" },
  { "jayp0521/mason-null-ls.nvim",                  event = "VeryLazy" },
  { "mfussenegger/nvim-dap",                        event = "VeryLazy" },
  { "JoosepAlviste/nvim-ts-context-commentstring",  event = "VeryLazy" },
  { "windwp/nvim-autopairs",                        event = "VeryLazy" },
  { "windwp/nvim-ts-autotag",                       after = "nvim-treesitter",                   event = "VeryLazy" },
  { "lewis6991/gitsigns.nvim",                      event = "VeryLazy" },
  { "tpope/vim-fugitive",                           event = "VeryLazy" },
  { "catppuccin/nvim",                              dependencies = { "mg979/vim-visual-multi" }, event = "VeryLazy" },
  { "norcalli/nvim-colorizer.lua",                  event = "VeryLazy" },
  { "stevearc/oil.nvim",                            event = "VeryLazy" },
  { "tpope/vim-dispatch",                           event = "VeryLazy" },
  { "petertriho/nvim-scrollbar",                    event = "VeryLazy" },
  { "kkharji/sqlite.lua",                           event = "VeryLazy" },
  { "nvim-telescope/telescope-smart-history.nvim",  event = "VeryLazy" },
  { "dyng/ctrlsf.vim",                              branch = "feature/add-devicon",              event = "VeryLazy" },
  { "junegunn/fzf",                                 build = "./install --all",                   event = "VeryLazy" },
  { "junegunn/fzf.vim",                             event = "VeryLazy" },
  { "sindrets/winshift.nvim",                       event = "VeryLazy" },
  { "stsewd/fzf-checkout.vim",                      event = "VeryLazy" },
  { "dfendr/clipboard-image.nvim",                  event = "VeryLazy" },
  { "ckipp01/nvim-jenkinsfile-linter",              requires = { "nvim-lua/plenary.nvim" },      event = "VeryLazy" },
  -- { "folke/neodev.nvim",                            opts = {} },
  -- { 'jamestthompson3/nvim-remote-containers' }
  -- { "dhruvasagar/vim-zoom" }
  -- { "troydm/zoomwintab.vim" },
  -- { "b0o/incline.nvim", },
}
