return {
  -- { "tpope/vim-dadbod", cmd = { "DB" } },
  -- { "kristijanhusak/vim-dadbod-ui" },
  -- { "kristijanhusak/vim-dadbod-completion" },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod",                     lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.dbs = {
        -- { name = 'dev', url = 'postgres://postgres:mypassword@localhost:5432/my-dev-db' }
        -- { name = 'staging', url = 'postgres://postgres:mypassword@localhost:5432/my-staging-db' },
        -- {
        --   name = 'production',
        --   url = function()
        --     return vim.fn.system('get-prod-url')
        --   end
        -- },
        { name = "dev-auth", url = "mysql://root@localhost/auth" },
      }
    end,
  },
}
