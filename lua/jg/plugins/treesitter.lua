-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
	},
	-- auto install above language parsers
	auto_install = true,
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = true,
		max_file_lines = nil,
		colors = {
			-- vscode
			"#DCDCAA",
			"#569CD6",
			"#9CDCFE",

			-- tokyo
			-- "#7aa2f7",
			-- "#2ac3de",
			-- "#9d7cd8",
		}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	matchup = {
		enable = true,
	},
})
