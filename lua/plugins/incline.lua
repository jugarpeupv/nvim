return {}
-- return {
--   "b0o/incline.nvim",
--   config = function()
--     local helpers = require("incline.helpers")
--     local devicons = require("nvim-web-devicons")
--     require("incline").setup({
--       window = {
--         padding = 0,
--         margin = { horizontal = 0 },
--       },
--       ignore = {
--         buftypes = "special",
--         filetypes = { 'NvimTree', 'diffview', 'Diffview' },
--         floating_wins = true,
--         unlisted_buffers = true,
--         wintypes = "special",
--       },
--       render = function(props)
--         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
--         local modified = vim.bo[props.buf].modified
--         local ft_icon, ft_color = devicons.get_icon_color(filename)
--         local modified = vim.bo[props.buf].modified
--         local ft_color_fb = ft_color or "#44406e"
--         return {
--           ft_icon and { " ", ft_icon, " ", guibg = "#44406e", guifg = ft_color_fb } or "",
--           -- " ",
--           modified and { " *", guifg = "#eeeeee", gui = "bold" } or "",
--           filename,
--           " ",
--           guibg = "#44406e",
--           guifg = "#eeeeee",
--         }
--       end,
--       -- render = function(props)
--       --   local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
--       --   if filename == "" then
--       --     filename = "[No Name]"
--       --   end
--       --   local ft_icon, ft_color = devicons.get_icon_color(filename)
--       --   local modified = vim.bo[props.buf].modified
--       --   local ft_color_fb = ft_color or "#44406e"
--       --   return {
--       --     ft_icon and { " ", ft_icon, " ", guibg = ft_color_fb, guifg = helpers.contrast_color(ft_color_fb) } or "",
--       --     " ",
--       --     { filename, gui = modified and "bold,italic" or "bold" },
--       --     " ",
--       --     guibg = "#44406e",
--       --   }
--       -- end,
--     })
--   end,
-- }
