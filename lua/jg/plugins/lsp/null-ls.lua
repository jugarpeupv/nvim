local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

-- Migrate to
-- Formatting --> conform.nvim
-- Linting --> nvim-lint

local lSsources = {
  completion.spell,
  formatting.stylua,
	formatting.prettier.with({
		filetypes = {
			"javascript",
			"typescript",
			"css",
			"scss",
			"graphql",
		},
		extra_args = { "--single-quote", "--jsx-single-quote", "--print-width", "80", "--trailing-comma", "none" },
	}),
}

null_ls.setup({
	debug = false,
	sources = lSsources,
})
