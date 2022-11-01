local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		-- NOTE: this plugin is designed with this icon in mind,
		-- and so changing this is NOT recommended, this is intended
		-- as an escape hatch for people who cannot bear it for whatever reason
		-- indicator_icon = "▎",
		-- indicator_icon = "",
		indicator = {
			icon = "",
		},
		-- buffer_close_icon = "",
		buffer_close_icon = "x",
		-- buffer_close_icon = '',
		modified_icon = "●",
		-- close_icon = "",
		close_icon = "",
		-- close_icon = '',
		left_trunc_marker = "",
		right_trunc_marker = "",
		--- name_formatter can be used to change the buffer's label in the bufferline.
		--- Please note some names can/will break the
		--- bufferline so use this at your discretion knowing that it has
		--- some limitations that will *NOT* be fixed.
		-- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
		--   -- remove extension from markdown files for example
		--   if buf.name:match('%.md') then
		--     return vim.fn.fnamemodify(buf.name, ':t:r')
		--   end
		-- end,
		max_name_length = 100,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 21,
		diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		-- NOTE: this will be called a lot so don't do any heavy processing here
		-- custom_filter = function(buf_number)
		--   -- filter out filetypes you don't want to see
		--   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
		--     return true
		--   end
		--   -- filter out by buffer name
		--   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
		--     return true
		--   end
		--   -- filter out based on arbitrary rules
		--   -- e.g. filter out vim wiki buffer from tabline in your work repo
		--   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
		--     return true
		--   end
		-- end,

		-- Show only active current buffer
		custom_filter = function(buf_number)
			if vim.fn.bufname(buf_number) == vim.fn.expand("%") then
				return true
			end
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				text_align = "center",
				separator = true,
			},
		},
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = false,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		-- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
		--   -- add custom logic
		--   return buffer_a.modified > buffer_b.modified
		-- end
	},
	-- ANOTHER APPROACH
	highlights = {
		fill = { bg = "none", fg = "none", bold = false, italic = false },
		background = { bg = "none", bold = false, italic = false },
		tab = { bg = "none", fg = "#D4D4D4", bold = false, italic = false },
		tab_close = { bg = "none", fg = "#D4D4D4", bold = false, italic = false },
		tab_selected = { bg = "none", fg = "#D4D4D4", bold = false, italic = false },
		close_button = { bg = "none", bold = false, italic = false },
		close_button_selected = { bg = "none", bold = false, italic = false },
		close_button_visible = { bg = "none", bold = false, italic = false },
		buffer = { bg = "none", bold = false, italic = false },
		buffer_visible = { bg = "none", bold = false, italic = false },
		buffer_selected = { bg = "none", bold = false, italic = false },
		diagnostic_selected = { bg = "none", bold = false, italic = false },
		diagnostic = { bg = "none", bold = false, italic = false },
		info = { bg = "none", sp = "none", cterm = "none", ctermbg = "none", bold = false, italic = false },
		info_visible = { bg = "none", sp = "none", cterm = "none", ctermbg = "none", bold = false, italic = false },
		info_selected = { bg = "none", sp = "none", cterm = "none", ctermbg = "none", bold = false, italic = false },
		info_diagnostic = { bg = "none", sp = "none", cterm = "none", ctermbg = "none", bold = false, italic = false },
		info_diagnostic_visible = {
			bg = "none",
			sp = "none",
			cterm = "none",
			ctermbg = "none",
			bold = false,
			italic = false,
		},
		info_diagnostic_selected = {
			bg = "none",
			sp = "none",
			cterm = "none",
			ctermbg = "none",
			bold = false,
			italic = false,
		},
		modified_selected = { fg = "none", bold = false, italic = false },

		-- fill = { gui = 'none', guibg = 'none', guifg = 'none' },
		-- background = { gui = 'none', guigbg = 'none' },
		-- tab = {gui = 'none', guigbg = 'none', guifg = '#D4D4D4'},
		-- tab_close = {gui = 'none', guigbg = 'none', guifg = '#D4D4D4'},
		-- tab_selected = {gui = 'none', guigbg = 'none', guifg = '#D4D4D4'},
		-- close_button = {gui = 'none', guigbg = 'none'},
		-- close_button_selected = { gui = 'none', guigbg = 'none'},
		-- close_button_visible = { gui = 'none', guigbg = 'none'},
		-- buffer = { gui = 'none', guibg = 'none' },
		-- buffer_visible = { gui = 'none', guibg = 'none' },
		-- buffer_selected = { gui = 'none', guibg = 'none' },
		-- diagnostic_selected = { gui = 'none', guibg = 'none' },
		-- diagnostic = { gui = 'none', guibg = 'none' },
		-- info = { guibg = 'none', guisp = 'none', gui = 'none', cterm = 'none', ctermbg = 'none' },
		-- info_visible = { guibg = 'none', guisp = 'none', gui = 'none', cterm = 'none', ctermbg = 'none' },
		-- info_selected = { guibg = 'none', guisp = 'none', gui = 'none', cterm = 'none', ctermbg = 'none' },
		-- info_diagnostic = { guibg = 'none', guisp = 'none', gui = 'none', cterm = 'none', ctermbg = 'none' },
		-- info_diagnostic_visible = { guibg = 'none', guisp = 'none', gui = 'none', cterm = 'none', ctermbg = 'none' },
		-- info_diagnostic_selected = { guibg = 'none', guisp = 'none', gui = 'none', cterm = 'none', ctermbg = 'none' },
		-- warning_selected = { gui = 'none' },
		-- warning_diagnostic_selected = { gui = 'none' },
		-- error_selected = { gui = 'none' },
		-- error_diagnostic_selected = { gui = 'none' },
		-- modified_selected = { guifg = 'none' }
	},
})
