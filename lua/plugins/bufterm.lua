return {
  "boltlessengineer/bufterm.nvim",
  -- event = { "BufReadPost", "BufNewFile" },
  -- event = { "VeryLazy" },
  keys = {
    {
      "<leader>bb",
      mode = { "n" },
      function()
        vim.cmd("BufTermEnter")
      end,
    },
    {
      "<leader>bp",
      mode = { "n" },
      function()
        vim.cmd("BufTermPrev")
      end,
    },
    {
      "<leader>bn",
      mode = { "n" },
      function()
        vim.cmd("BufTermNext")
      end,
    },
  },
  -- vim.keymap.set("n", "<leader>bb", vim.cmd.BufTermEnter)
  -- vim.keymap.set("n", "<leader>bn", vim.cmd.BufTermNext)
  config = function()
    require("bufterm").setup({
      save_native_terms = true, -- integrate native terminals from `:terminal` command
      start_in_insert = true, -- start terminal in insert mode
      remember_mode = true,  -- remember vi_mode of terminal buffer
      enable_ctrl_w = true,  -- use <C-w> for window navigating in terminal mode (like vim8)
      terminal = {           -- default terminal settings
        buflisted = true,    -- whether to set 'buflisted' option
        termlisted = true,   -- list terminal in termlist (similar to buflisted)
        fallback_on_exit = true, -- prevent auto-closing window on terminal exit
        auto_close = true,   -- auto close buffer on terminal job ends
      },
    })
    local term = require("bufterm.terminal")
    local ui = require("bufterm.ui")

    vim.keymap.set({ "n", "t" }, "<C-t>", function()
      local recent_term = term.get_recent_term()
      ui.toggle_float(recent_term.bufnr)
    end, {
      desc = "Toggle floating window with terminal buffers",
    })
  end,
}
