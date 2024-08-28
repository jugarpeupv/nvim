-- return {}
-- return {}
return {
  "mogelbrod/vim-jsonpath",
  ft = { "json" },
  config = function()
    vim.g.jsonpath_register = "*"
  end,
}
