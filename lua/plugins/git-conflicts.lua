-- return {}
return {
  "akinsho/git-conflict.nvim",
  -- "CWood-sdf/git-conflict.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("git-conflict").setup({
      -- default_mappings = true,    -- disable buffer local mapping created by this plugin
      default_mappings = false,
      list_opener = "copen",
      debug = false,
      -- default_mappings = {
      --   ours = 'o',
      --   theirs = 't',
      --   none = '0',
      --   both = 'b',
      --   next = 'n',
      --   prev = 'p',
      -- },
      disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
      highlights = {
        -- They must have background color, otherwise the default color will be used
        incoming = "DiffText",
        current = "DiffAdd",
      },
    })

    vim.cmd([[hi GitConflictIncoming gui=none]])
    vim.cmd([[hi GitConflictCurrent gui=none]])
  end,
}
