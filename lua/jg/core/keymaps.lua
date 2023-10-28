-- set leader key to space
vim.g.mapleader = " "
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- --Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +5<CR>", opts)
keymap("n", "<C-Down>", ":resize -5<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -5<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +5<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Folding
keymap("n", "<C-p>", "za", opts)

-- Paste
-- keymap("n", "p", "p=`]", opts) --autoindent
keymap("v", "p", '"_dP', opts)
keymap("n", "d", '"_d', opts)
keymap("v", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("n", "dd", '"_dd', opts)
keymap("n", "<leader>pu", "<cmd>pu<cr>", opts)



-- Cmd modifiers
vim.cmd([[map <M-g> gcc]])
-- keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown{previewer = false, width = 0.8 })<cr>", opts)
-- keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').git_files({ show_untracked = true, require('telescope.themes').get_dropdown{previewer = false, width = 0.8 }})<cr>", opts)
keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').git_files({ show_untracked = true, previewer = false })<cr>",
  opts)
keymap("t", "<M-p>", "<cmd>lua require('telescope.builtin').git_files({ show_untracked = true, previewer = false })<cr>",
  opts)
-- keymap("t", "<M-p>", "<cmd>lua require('telescope.builtin').git_files({ show_untracked = true, previewer = false })<cr>", opts)

-- keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').find_files({ hidden = true, previewer = false })<cr>", opts)
-- keymap("t", "<M-p>", "<cmd>lua require('telescope.builtin').find_files({ hidden = true, previewer = false })<cr>", opts)

-- keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').git_files({  show_untracked = true, hidden = true, previewer = false })<cr>", opts)

-- 		layout_config = {
-- 			horizontal = { width = 0.95, height = 0.8, preview_width = 0.45 },
-- 			vertical = { width = 0.99, height = 0.99 },
-- 			center = { width = 0.99, height = 0.99 },
-- 			bottom_pane = { width = 0.99, height = 0.99 },
-- 			prompt_position = "top",
-- 		},

-- keymap("n", "<M-p>", "<cmd>lua require('telescope-config/custom').git_files()<cr>", opts)
-- keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>", opts)
-- keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
-- keymap("n", "<M-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<M-j>", "<cmd>NvimTreeToggle<cr>", opts)
keymap("i", "<M-j>", "<cmd>NvimTreeToggle<cr>", opts)
keymap("t", "<M-j>", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<M-.>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<M-x>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- keymap("n", "<M-x>", "<cmd>Lspsaga code_action<CR>", opts)
-- keymap("n", "<M-.>", "<cmd>Lspsaga code_action<CR>", opts)

-- Ctrls + shit modifiers
keymap("n", "<M-e>", "<cmd>cnext<cr>", opts)
keymap("n", "<M-k>", "<cmd>cprev<cr>", opts)
-- keymap("n", "<M-l>", "<cmd>lnext<cr>", opts)
-- keymap("n", "<M-h>", "<cmd>lprev<cr>", opts)

-- Utilities
keymap("n", "<BS>", "<C-^>", opts)
keymap("n", "<Leader>q", "<cmd>q!<CR>", opts)
-- keymap("n", "<Leader>q", "<cmd>BDelete this<CR>", opts)
keymap("n", "<Leader>n", "<cmd>nohlsearch<CR>", opts)
keymap("n", "<Leader>d", ":NvimTreeFindFile<cr>", opts)
-- keymap("n", "<Leader>d", ":NvimTreeFocus<cr>", opts)
keymap(
  "n",
  "<Leader>fi",
  "<cmd>lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true })<cr>",
  opts
)
-- keymap("n", "<Leader>ps", "<cmd>lua require('telescope.builtin').grep_string()<CR>", opts)
-- keymap(
-- 	"n",
-- 	"<Leader>bu",
-- 	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
-- 	opts
-- )
keymap(
  "n",
  "<Leader>bu",
  "<cmd>lua require('telescope.builtin').buffers({ ignore_current_buffer = false, show_all_buffers = false })<cr>",
  opts
)
keymap("n", "<leader>tr", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<leader>nm", "<cmd>Telescope node_modules list<cr>", opts)
-- keymap("n", "<Leader>fr", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
-- keymap("n", "<Leader>fi", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)
keymap("n", "<Leader>ps",
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>", opts);
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
      "--hidden",
      "--smart-case",
      "--glob=!icarSDK.js",
      "--glob=!package-lock.json",
      "--glob=!**/.git/**"
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
keymap("n", "<Leader>ga", "<cmd>G add .<cr>", opts)
keymap("n", "<Leader>gS", "<cmd>G stash<cr>", opts)
keymap("n", "<Leader>gO", "<cmd>G stash pop<cr>", opts)
keymap("n", "<Leader>gs", "<cmd>Telescope git_stash<cr>", opts)
keymap("n", "<Leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
keymap(
  "n",
  "<Leader>.",
  "<cmd> lua require('telescope.builtin').find_files({ prompt_title = '< VimRC >', cwd = '~/.config/nvim',hidden = false })<cr>",
  opts
)
-- keymap("n", "<Leader>pc", "<cmd>Telescope colorscheme<cr>", opts)
keymap("n", "<Leader>po", "<cmd>PeekOpen<cr>", opts)
keymap("n", "<Leader>pc", "<cmd>PeekClose<cr>", opts)
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
keymap("n", "<Leader>aa", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<Leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<Leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
keymap("n", "<Leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
keymap("n", "<Leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
keymap("n", "<Leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
keymap("n", "<Leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
keymap("n", "<Leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts)
keymap("n", "<Leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts)
keymap("n", "<Leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts)
keymap("n", "<Leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts)

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
vim.cmd([[nnoremap <Leader>rr :%s///gc<Left><Left><Left>]])
vim.cmd([[xnoremap <Leader>rr :s///gc<Left><Left><Left>]])
vim.cmd([[nnoremap <Leader>sw /\<\><Left><Left>]])

vim.cmd(
  [[nnoremap <Leader>rq :cfdo %s///g \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]]
)

vim.cmd(
  [[xnoremap <Leader>rq :cfdo %s///g \| update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>]]
)


-- Vim Fugitive
-- keymap("n", "<Leader>gu", ":diffget<cr>", opts)
-- keymap("n", "<Leader>gs", ":diffput<cr>", opts)
keymap("v", "<Leader>gv", "<cmd>'<,'>DiffviewFileHistory<cr>", opts)
keymap("n", "<Leader>gv", "<cmd>DiffviewFileHistory %<cr>", opts)
keymap("n", "<Leader>gP", "<cmd>Git! push<cr>", opts)
keymap("n", "<Leader>gp", "<cmd>Git! pull<cr>", opts)
-- keymap("n", "<Leader>gc", "<cmd>Git commit<cr>", opts)
keymap("n", "<Leader>go", "<cmd>:!git-open<cr>", opts)
keymap("n", "<Leader>np", "<cmd>:e ~/.npmrc<cr>", opts)
keymap("n", "<Leader>aw", "<cmd>:e ~/.aws/config<cr>", opts)
keymap("n", "<Leader>zh", "<cmd>:e ~/.zshrc<cr>", opts)
keymap("n", "<Leader>gc", "<cmd>Telescope git_commits<cr>", opts)
keymap("n", "<Leader>gl", "<cmd>G log<cr>", opts)

-- ToggleLine
vim.api.nvim_set_keymap("n", "<Leader>tl", "<cmd>ToggleLine<cr>", opts)

-- Hop
vim.api.nvim_set_keymap("n", "<Leader>w", "<cmd>lua require'hop'.hint_words()<cr>", opts)

-- JsonPath
keymap("n", "<leader>cp", "<cmd>JsonPath<CR>", opts)

-- Reformat file
keymap("n", "<leader>cr", ":e ++ff=dos<CR> | :set ff=unix<CR>", opts)

-- Hlslens
vim.api.nvim_set_keymap(
  "n",
  "n",
  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  opts
)
vim.api.nvim_set_keymap(
  "n",
  "N",
  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  opts
)
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)

-- Vifm
keymap("n", "<leader>vi", "<cmd>Vifm<cr>", opts)

-- BrowserSearch
-- keymap("n", "<leader>br", ":BrowserSearch", opts)

-- vim.keymap.set('n', "<C-'!>", '<CMD>lua require("FTerm").toggle()<CR>')
-- vim.keymap.set('t', "<C-'!>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')


-- DAP
vim.keymap.set('n', '<leader>ee', function() require "dap".toggle_breakpoint() end)
vim.keymap.set('n', '<leader>en', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- vim.keymap.set('n', '<Leader>hh', function() require"dap".step_out() end)
vim.keymap.set('n', "<Leader>kk", function() require "dap".step_into() end)
vim.keymap.set('n', '<Leader>jj', function() require "dap".step_over() end)
vim.keymap.set('n', '<Leader>G', function() require "dap".continue() end)
vim.keymap.set('n', '<leader>ec', function() require "dap".run_to_cursor() end)
vim.keymap.set('n', '<leader>et', function() require "dap".terminate() end)
vim.keymap.set('n', '<leader>eC', function() require "dap".clear_breakpoints() end)
vim.keymap.set('n', '<leader>ea', function() require "debughelper-config".attach() end)
vim.keymap.set('n', '<leader>eE', function() require "debughelper-config".attachToRemote() end)
vim.keymap.set('n', '<leader>eJ', function() require "debughelper-config".attachToPort8080() end)
vim.keymap.set('n', '<leader>eh', function() require "dap.ui.widgets".hover() end)
vim.keymap.set('n', '<leader>es',
  function()
    local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
  end)
vim.keymap.set('n', '<leader>ek', ':lua require"dap".up()<CR>zz')
vim.keymap.set('n', '<leader>ej', ':lua require"dap".down()<CR>zz')
vim.keymap.set('n', '<leader>er', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
-- vim.keymap.set('n', '<leader>ee', function() require"dap".set_exception_breakpoints({"all"}) end)
-- vim.keymap.set('n', '<leader>lo', "<cmd> lua require('dap.ext.vscode').load_launchjs('.vscode/launch.json', { ['pwa-node'] = { 'typescript' } })<cr>", opts)


-- The Primeagean
vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv")

vim.keymap.set('n', "J", "mzJ`z")
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")
-- vim.keymap.set('n', "n", "nzzzv")
-- vim.keymap.set('n', "N", "Nzzzv")

vim.keymap.set('n', "<leader>rs", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Hlslens
-- vim.api.nvim_set_keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
-- vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  { silent = true, noremap = true }
)

-- Peek markdown
vim.keymap.set('n', '<leader>md', '<CMD>PeekOpen<CR>')
vim.keymap.set('n', '<leader>mc', '<CMD>PeekClose<CR>')

-- Fterm
-- vim.keymap.set('n', '<C-q>', '<CMD>lua require("FTerm").toggle()<CR>')
-- -- vim.keymap.set('t', '<C-q>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
-- vim.keymap.set('t', '<C-q>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')


-- Diffview
vim.keymap.set('n', '<leader>ll', '<CMD>DiffviewFileHistory --range=HEAD<CR>')
vim.keymap.set('n', '<leader>l5', '<CMD>DiffviewFileHistory --range=HEAD~50..HEAD<CR>')
vim.keymap.set('n', '<leader>l0', '<CMD>DiffviewFileHistory --range=HEAD~10..HEAD<CR>')

vim.cmd [[nnoremap q <Nop>]]
vim.cmd [[tnoremap <C-n> <C-\><C-n>]]

vim.keymap.set("n", "<leader>th", "<cmd>sp|term<cr>i",
  { silent = true, noremap = true }
)

vim.keymap.set("n", "<leader>tv", "<cmd>vsp|term<cr>i",
  { silent = true, noremap = true }
)

-- vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>",
--   {silent = true, noremap = true}
-- )
--
-- vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>",
--   {silent = true, noremap = true}
-- )


vim.cmd [[:tnoremap <C-Up> <C-\><C-N>:resize +5<cr>]]
vim.cmd [[:tnoremap <C-Down> <C-\><C-N>:resize -5<cr>]]
vim.cmd [[:tnoremap <C-Left> <C-\><C-N>:vertical resize -5<cr>]]
vim.cmd [[:tnoremap <C-Right> <C-\><C-N>:vertical resize +5<cr>]]

-- vim.cmd[[:tnoremap <C-o> <C-\><C-N><C-o>]]


-- vim.cmd[[:tnoremap <C-h> <C-\><C-N><C-w>h]]
-- vim.cmd[[:tnoremap <C-j> <C-\><C-N><C-w>j]]
-- vim.cmd[[:tnoremap <C-k> <C-\><C-N><C-w>k]]
-- vim.cmd[[:tnoremap <C-l> <C-\><C-N><C-w>l]]

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
  vim.keymap.set('t', '<C-o>', [[<C-\><C-n><C-o>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


keymap("n", "<Leader>oa", "<cmd>Oil<cr>", opts)

vim.keymap.set('n', 'cc', '<Plug>(git-conflict-ours)')
vim.keymap.set('n', 'ci', '<Plug>(git-conflict-theirs)')
vim.keymap.set('n', 'cb', '<Plug>(git-conflict-both)')
vim.keymap.set('n', 'c0', '<Plug>(git-conflict-none)')
vim.keymap.set('n', 'cp', '<Plug>(git-conflict-prev-conflict)')
vim.keymap.set('n', 'cn', '<Plug>(git-conflict-next-conflict)')

local actions = require("diffview.actions")

vim.keymap.set('n', '-', actions.toggle_stage_entry)


vim.keymap.set("n", "<leader><leader>j", [[<cmd>lua require("jenkinsfile_linter").validate()<CR>]])

if vim.lsp.inlay_hint then
  vim.keymap.set("n", "<leader>ih", function()
    vim.lsp.inlay_hint(0, nil)
  end, { desc = "Toggle Inlay Hints" })
end

-- local opts = { noremap = true, silent = true }
-- local keymap = vim.api.nvim_set_keymap
-- -- Save breakpoints to file automatically.
-- keymap("n", "<YourKey1>", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", opts)
-- keymap("n", "<YourKey2>", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", opts)
-- keymap("n", "<YourKey3>", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)


-- vim.cmd[[let g:VM_maps["Add Cursor Up"] = 'C-Up']]
-- vim.cmd[[let g:VM_maps["Add Cursor Down"] = 'C-Down']]

-- lab
vim.keymap.set('n', '<leader>la', '<CMD>Lab code run<CR>')
vim.keymap.set('n', '<leader>ls', '<CMD>Lab code stop<CR>')

-- local ng = require("ng");
-- vim.keymap.set("n", "<leader>at", ng.goto_template_for_component, opts)
-- vim.keymap.set("n", "<leader>ac", ng.goto_component_with_template_file, opts)
-- vim.keymap.set("n", "<leader>aT", ng.get_template_tcb, opts)


-- comments the current line, or a number of lines 5gcc
vim.keymap.set("n", "gcc", require("SingleComment").SingleComment, { expr = true })
-- comments the selected lines
vim.keymap.set("v", "gcc", require("SingleComment").Comment, {})
-- toggle a comment top/ahead of the current line
vim.keymap.set("n", "gca", require("SingleComment").ToggleCommentAhead, {})
-- comments ahead of the current line
vim.keymap.set("n", "gcA", require("SingleComment").CommentAhead, {})
-- comment a block, and removes the innermost block comment in normal mode
vim.keymap.set({ "n", "v" }, "gcb", require("SingleComment").BlockComment)
