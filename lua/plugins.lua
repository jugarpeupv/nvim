return {
  { "wellle/targets.vim",      event = { "BufReadPost", "BufNewFile" } },
  { "junegunn/fzf",            build = "./install --all",              event = { "VeryLazy" } },
  { "junegunn/fzf.vim",        event = { "VeryLazy" } },
  { "tpope/vim-repeat",        keys = { "." } },
  { "nvim-lua/plenary.nvim",   event = "VeryLazy" },
  { "tpope/vim-surround",      event = { "BufReadPost", "BufNewFile" } },
  { "windwp/nvim-ts-autotag",  after = "nvim-treesitter",              ft = "html" },
  { "tpope/vim-fugitive",      event = { "VeryLazy" } },
  { "tpope/vim-dispatch",      event = { "BufReadPost", "BufNewFile" } },
  { "kkharji/sqlite.lua",      event = { "BufReadPost", "BufNewFile" } },
  { "stsewd/fzf-checkout.vim", event = { "VeryLazy" } },
  { "AndrewRadev/bufferize.vim", cmd = { "Bufferize" } },
  -- {
  --   "boltlessengineer/bufterm.nvim",
  --   -- event = { "BufReadPost", "BufNewFile" },
  --   event = { "VeryLazy" },
  --   config = function()
  --     require("bufterm").setup({
  --       save_native_terms = true, -- integrate native terminals from `:terminal` command
  --       start_in_insert = true, -- start terminal in insert mode
  --       remember_mode = true, -- remember vi_mode of terminal buffer
  --       enable_ctrl_w = true, -- use <C-w> for window navigating in terminal mode (like vim8)
  --       terminal = {          -- default terminal settings
  --         buflisted = false,  -- whether to set 'buflisted' option
  --         termlisted = true,  -- list terminal in termlist (similar to buflisted)
  --         fallback_on_exit = true, -- prevent auto-closing window on terminal exit
  --         auto_close = true,  -- auto close buffer on terminal job ends
  --       },
  --     })
  --   end,
  -- },
  {
    "ckipp01/nvim-jenkinsfile-linter",
    event = { "BufReadPost", "BufNewFile" },
    keys = { "<leader>va" },
    config = function()
      vim.keymap.set("n", "<leader>va", require("jenkinsfile_linter").validate, {})
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
