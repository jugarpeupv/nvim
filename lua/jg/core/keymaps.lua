-- set leader key to space
vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- --Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -5<CR>", opts)
keymap("n", "<C-Down>", ":resize +5<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -5<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +5<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Folding
keymap("n", "<C-p>", "za", opts)

-- Paste
keymap("n", "p", "p=`]", opts)
keymap("v", "p", '"_dP', opts)
keymap("n", "d", '"_d', opts)
keymap("v", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("n", "dd", '"_dd', opts)
keymap("n", "<leader>pu", "<cmd>pu<cr>", opts)

-- Cmd modifiers
vim.cmd([[map <M-g> gcc]])
-- keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown{previewer = false, width = 0.8 })<cr>", opts)
-- keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)
-- keymap("n", "<M-p>", "<cmd>lua require('telescope-config/custom').git_files()<cr>", opts)
keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>", opts)
-- keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<M-j>", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<M-.>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<M-x>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- keymap("n", "<M-.>", "<cmd>Lspsaga code_action<CR>", opts)

-- Ctrls + shit modifiers
keymap("n", "<M-e>", "<cmd>cnext<cr>", opts)
keymap("n", "<M-k>", "<cmd>cprev<cr>", opts)
-- keymap("n", "<M-l>", "<cmd>lnext<cr>", opts)
-- keymap("n", "<M-h>", "<cmd>lprev<cr>", opts)

-- Utilities
keymap("n", "<BS>", "<C-^>", opts)
keymap("n", "<Leader>q", "<cmd>q!<CR>", opts)
keymap("n", "<Leader>n", "<cmd>nohlsearch<CR>", opts)
keymap("n", "<Leader>d", ":NvimTreeFindFile<cr>", opts)
keymap(
	"n",
	"<Leader>fi",
	"<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<cr>",
	opts
)
keymap("n", "<Leader>ps", "<cmd>lua require('telescope.builtin').grep_string()<CR>", opts)
keymap(
	"n",
	"<Leader>bu",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	opts
)
keymap("n", "tr", "<cmd>Telescope resume<cr>", opts)
-- keymap("n", "<Leader>fr", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
-- keymap("n", "<Leader>fi", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)
-- keymap("n", "<Leader>ps", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>", opts);
--
local telescope = require("telescope")
vim.keymap.set({ "n", "v" }, "<Leader>ff", function()
	telescope.extensions.live_grep_args.live_grep_raw({
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--glob=!icarSDK.js",
			-- "--ignore-case",
			-- "--smart-case",
			-- "--word-regexp"
		},
	})
end)
keymap(
	"n",
	"<Leader>ss",
	"<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>",
	opts
)
keymap("n", "gv", "<cmd>vsp | lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "<Leader>pp", "<cmd>Telescope projects<CR>", opts)

-- Telescope
keymap("n", "<Leader>gg", "<cmd>Telescope git_status<cr>", opts)
keymap("n", "<Leader>ga", "<cmd>Telescope git_stash<cr>", opts)
keymap("n", "<Leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
keymap(
	"n",
	"<Leader>.",
	"<cmd> lua require('telescope.builtin').find_files({ prompt_title = '< VimRC >', cwd = '~/.config/nvim',hidden = true })<cr>",
	opts
)
keymap("n", "<Leader>go", "<cmd>Telescope git_commits<cr>", opts)
keymap("n", "<Leader>pc", "<cmd>Telescope colorscheme<cr>", opts)
keymap("n", "<Leader>ht", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<Leader>mp", "<cmd>Telescope man_pages<cr>", opts)
keymap("n", "<Leader>of", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<Leader>rg", "<cmd>Telescope registers<cr>", opts)
keymap("n", "<Leader>ke", "<cmd>Telescope keymaps<cr>", opts)
keymap("n", "<Leader>cm", "<cmd>Telescope commands<cr>", opts)
keymap("n", "<Leader>td", "<cmd>Telescope diagnostics<cr>", opts)
keymap("n", "<Leader>bo", "<cmd>Telescope bookmarks<cr>", opts)
-- keymap("n", "<Leader>ma", "<cmd>Telescope vim_bookmarks<cr>", opts)
keymap("n", "<Leader>sy", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap("n", "<Leader>lr", "<cmd>LspRestart<cr>", opts)

-- Diffview
keymap("n", "<Leader>gd", "<cmd>DiffviewOpen<cr>", opts)
keymap("n", "<Leader>cc", "<cmd>DiffviewClose<cr>", opts)

-- Harpoon
keymap("n", "<Leader>ha", "<cmd>Telescope harpoon marks<cr>", opts)
keymap("n", "<Leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<Leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<Leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<Leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<Leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<Leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)

-- Sniprun
keymap("n", "<Leader>sr", "<cmd>%SnipRun<cr>", opts)

-- Git blame
keymap("n", "<Leader>bl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", opts)
keymap("n", "<Leader>bt", "<cmd>GitBlameToggle<cr>", opts)
keymap("n", "<Leader>bf", "<cmd>GitBlameOpenCommitURL<cr>", opts)

-- TS
keymap("n", "<Leader>ia", "<cmd>TypescriptAddMissingImports<cr>", opts)
keymap("n", "<Leader>ru", "<cmd>TypescriptRemoveUnused<cr>", opts)
keymap("n", "<Leader>oi", "<cmd>TypescriptOrganizeImports<cr>", opts)

-- Replace
vim.cmd([[nnoremap <Leader>rr :%s///g<Left><Left>]])
vim.cmd([[xnoremap <Leader>rr :s///g<Left><Left>]])
vim.cmd(
	[[nnoremap <Leader>rq :cfdo %s///g \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]]
)

-- Vim Fugitive
keymap("n", "<Leader>gu", ":diffget<cr>", opts)
keymap("n", "<Leader>gs", ":diffput<cr>", opts)
keymap("n", "<Leader>gv", "<cmd>DiffviewFileHistory %<cr>", opts)

-- ToggleLine
vim.api.nvim_set_keymap("n", "<Leader>tl", "<cmd>ToggleLine<cr>", opts)

-- Hop
vim.api.nvim_set_keymap("n", "<Leader>w", "<cmd>lua require'hop'.hint_words()<cr>", opts)

-- JsonPath
keymap("n", "<leader>cp", "<cmd>JsonPath<CR>", opts)

-- Reformat file
keymap("n", "<leader>cr", ":e ++ff=dos<CR> | :set ff=unix<CR>", opts)

-- Hlslens
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"n",
-- 	[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
-- 	opts
-- )
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"N",
-- 	[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
-- 	opts
-- )
-- vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
-- vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
-- vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
-- vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)

-- Vifm
keymap("n", "<leader>vi", "<cmd>Vifm<cr>", opts)

-- BrowserSearch
-- keymap("n", "<leader>br", ":BrowserSearch", opts)
