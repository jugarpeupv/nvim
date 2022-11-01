local colors = {
	blue = "#9CDCFE",
	cyan = "#4EC9B0",
	-- cyan            = '#0db9d7',
	black = "#292e42",
	-- black           = '#1f2335',
	alternate_black = "black",
	white = "#c6c6c6",
	red = "#ff5189",
	blue_visual = "#264F78",
	violet = "#C586C0",
	grey = "#3B4252",
	red = "#ff5189",
	orange = "#CE9178",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.alternate_black, bg = colors.cyan },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white, bg = colors.black },
	},

	insert = { a = { fg = colors.alternate_black, bg = colors.blue } },
	command = { a = { fg = colors.alternate_black, bg = colors.white } },
	visual = { a = { fg = colors.alternate_black, bg = colors.orange } },
	replace = { a = { fg = colors.alternate_black, bg = colors.orange } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white, bg = colors.black },
	},
}

local dirnameFormatFn = function()
	local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	return "  " .. dir_name .. " "
end

local dirname = {
	"dirname",
	-- color = { fg = "#C586C0" ,bg = "none" },
	fmt = dirnameFormatFn,
}

local filename = {
	"filename",
	file_status = true, -- Displays file status (readonly status, modified status)
	path = 0, -- 0: Just the filename
	-- 1: Relative path
	-- 2: Absolute path

	shorting_target = 100, -- Shortens path to leave 40 spaces in the window
	-- for other components. (terrible name, any suggestions?)
	symbols = {
		modified = "[+]", -- Text to show when the file is modified.
		readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[No Name]", -- Text to show for unnamed buffers.
	},
	-- color = { fg = "#4EC9B0" ,bg = "none" },
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_lsp" },
	sections = { "error", "warn", "info", "hint" },
	diagnostics_color = {
		error = "DiagnosticError",
		warn = "DiagnosticWarn",
		info = "DiagnosticInfo",
		hint = "DiagnosticHint",
	},
	colored = true,
	update_in_insert = true,
	alwars_visible = false,
}

local branch = {
	"branch",
	-- color = { fg = colors.cyan }
}

local diff = {
	"diff",
	colored = true, -- Displays a colored diff status if set to true
	diff_color = {
		-- Same color values as the general color option can be used here.
		added = "DiffAdd", -- Changes the diff's added color
		modified = "DiffChange", -- Changes the diff's modified color
		removed = "DiffDelete", -- Changes the diff's removed color you
	},
	symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
	source = nil, -- A function that works as a data source for diff.
	-- It must return a table as such:
	--   { added = add_count, modified = modified_count, removed = removed_count }
	-- or nil on failure. count <= 0 won't be displayed.
}

require("lualine").setup({
	options = {
		theme = bubbles_theme,
		-- theme = 'tokyonight',
		-- theme = 'dracula',
		-- theme = 'vscode',
		-- theme = 'nord',
		-- theme = 'palenight',
		-- theme = 'seoul256',
		-- theme = 'onedark',
		-- theme = 'nightfly',
		-- theme = 'modus-vivendi',
		-- component_separators = '|',
		section_separators = { left = "", right = "" },
		-- section_separators = { left = '', right = ''},
		component_separators = { left = " ", right = " " },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "Diffview", "diffview" },
	},
	sections = {
		lualine_a = {
			-- { 'mode', separator = { left = '' }, right_padding = 2 },
			-- { 'mode', separator = { left = '', right = '' } },
			-- { 'mode', separator = { left = '', right = '' } },
			-- { 'mode' }
			{ "mode", separator = { left = "", right = "" } },
		},
		lualine_b = { branch },
		lualine_c = {},
		lualine_x = { dirname, "filetype" },
		lualine_y = { "progress" },
		lualine_z = {
			{ "location", separator = { left = "", right = "" } },
			-- { 'location', separator = { left = '', right = '' }, left_padding = 2 },
			-- { 'location', left_padding = 2 },
			-- { 'progress', 'location' }
			-- 'location'
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {

			-- { 'filename', right_padding = 2 },
			{ "filename" },
			-- { 'filename', separator = { left = '' }, left_padding = 2 },
		},
		lualine_c = { dirname },
		lualine_x = { "filetype" },
		lualine_y = {
			"location",
			-- { 'location', separator = { left = '', right = '' }, left_padding = 2 },
		},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
