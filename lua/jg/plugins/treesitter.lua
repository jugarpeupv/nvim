-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	-- refactor = {
	-- 	navigation = { enable = false },
	-- 	highlight_current_scope = { enable = false },
	-- 	smart_rename = {
	-- 		enable = false,
	-- 		-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
	-- 		keymaps = {
	-- 			smart_rename = "grr",
	-- 		},
	-- 	},
	-- 	highlight_definitions = {
	-- 		enable = true,
	-- 		-- Set to false if you have an `updatetime` of ~100.
	-- 		clear_on_cursor_move = false,
	-- 	},
	-- },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	sync_install = true,
	ignore_install = {},
	modules = {},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"jsonc",
		"json5",
		"angular",
		"gitignore",
		"git_config",
		-- "git_rebase",
		-- "gitattributes",
		-- "gitcommit",
		-- "gitignore",
		"javascript",
		"java",
		"jq",
		"jsdoc",
		"groovy",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		-- "svelte",
		-- "graphql",
		"bash",
		"lua",
		"luadoc",
		"vim",
		"dockerfile",
		"dap_repl",
		"regex",
	},
	-- auto install above language parsers
	auto_install = true,
	rainbow = {
		enable = true,
		disable = { "html" },
		-- query = 'rainbow-parens',
		-- strategy = require('ts-rainbow').strategy.global
		-- extended_mode = true,
		-- max_file_lines = nil,
		colors = {
			-- vscode
			-- "#DCDCAA",
			-- "#569CD6",
			-- "#9CDCFE",

			-- catpuccin
			"#C6A0F6",
			"#8AADF4",
			"#F0C6C6",

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
