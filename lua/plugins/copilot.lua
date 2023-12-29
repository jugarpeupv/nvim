return {
  "github/copilot.vim",
  config = function()
    vim.cmd(
      [[let g:copilot_filetypes = { '*': v:false, 'typescript': v:true, 'ts': v:true, 'html': v:true, 'TelescopePrompt': v:false, 'sagarename': v:false }]]
    )
  end,
}
-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup({
--       panel = {
--         enabled = true,
--         auto_refresh = false,
--         keymap = {
--           jump_prev = "[[",
--           jump_next = "]]",
--           accept = "<CR>",
--           refresh = "gr",
--           open = "<M-CR>",
--         },
--         layout = {
--           position = "bottom", -- | top | left | right
--           ratio = 0.4,
--         },
--       },
--       suggestion = {
--         enabled = true,
--         auto_trigger = true,
--         debounce = 10,
--         keymap = {
--           accept = "<CR>",
--           accept_word = false,
--           accept_line = false,
--           next = "<M-]>",
--           prev = "<M-[>",
--           dismiss = "<C-]>",
--         },
--       },
--       filetypes = {
--         yaml = false,
--         markdown = false,
--         help = false,
--         gitcommit = false,
--         gitrebase = false,
--         hgcommit = false,
--         svn = false,
--         cvs = false,
--         ["."] = false,
--       },
--       copilot_node_command = "node", -- Node.js version must be > 18.x
--       server_opts_overrides = {},
--     })
--   end,
-- }
