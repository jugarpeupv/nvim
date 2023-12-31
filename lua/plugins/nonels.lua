return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  config = function()
    local null_ls_status_ok, null_ls = pcall(require, "null-ls")
    if not null_ls_status_ok then
      return
    end
    -- Migrate to
    -- Formatting --> conform.nvim
    -- Linting --> nvim-lint

    local lSsources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.completion.spell,
      -- null_ls.builtins.formatting.prettier.with({
      --   filetypes = {
      --     "javascript",
      --     "typescript",
      --     "css",
      --     "scss",
      --     "graphql",
      --   },
      --   extra_args = {
      --     "--single-quote",
      --     "--jsx-single-quote",
      --     "--print-width",
      --     "80",
      --     "--trailing-comma",
      --     "none",
      --   },
      -- }),
    }

    null_ls.setup({
      debug = false,
      sources = lSsources,
    })
  end,
}
