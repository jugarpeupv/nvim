-- set colorscheme to nightfly with protected call
-- in case it isn't installed
-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- if not status then
-- 	print("Colorscheme not found!") -- print error if colorscheme not installed
-- 	return
-- end



-- local c = require('vscode.colors')
require("vscode").setup({
	-- Enable transparent background
	transparent = true,

	-- Enable italic comment
	italic_comments = false,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- color_overrides = {
	-- },

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
	  Comment = { fg = "#4f856a" }
	}
})

-- VS CODE
vim.cmd([[highlight BufferLineFill guibg=none]])
vim.cmd([[highlight EndOfBuffer guifg=#3b4251 guibg=none]])
-- vim.cmd([[highlight Pmenu guibg=#06182a]])
vim.cmd([[highlight Pmenu guibg=#292e42]])
vim.cmd([[highlight NvimTreeRootFolder guifg=#569CD6]])
vim.cmd([[highlight LspReferenceText gui=none guibg=#264F78]])
vim.cmd([[highlight LspReferenceRead gui=none guibg=#264F78]])
vim.cmd([[highlight LspReferenceWrite gui=none guibg=#264F78]])
vim.cmd([[highlight LspSignatureActiveParameter gui=none guifg=none guibg=#264F78]])
vim.cmd([[highlight gitblame gui=none guibg=#35394A guifg=black]])
vim.cmd([[highlight TSVariableBuiltin gui=none guifg=#569CD6 guibg=none]])
vim.cmd([[highlight TSVariable gui=none guifg=#4FC1FF guibg=none]])
vim.cmd([[highlight TSOperator gui=none guifg=#9CDCFE guibg=none]])
vim.cmd([[highlight NormalFloat guibg=none]])
vim.cmd([[highlight QuickFixLine guibg=#264F78]])
vim.cmd([[highlight NvimTreeVertSplit guifg=#3B4252]])
vim.cmd([[highlight StatusLineNC guibg=none]])
vim.cmd([[highlight StatusLine guibg=#292e42]])
vim.cmd([[highlight LineNR guifg=#3b4251]])
vim.cmd([[highlight CursorLineNR guifg=#737aa2]])
vim.cmd([[highlight IndentBlanklineChar guifg=#3b4251]])
vim.cmd([[highlight IncSearch guibg=#264F78]])
vim.cmd([[highlight CmpItemKindProperty guifg=#73daca]])

vim.cmd([[highlight CursorLine guibg=#35394A]])
vim.cmd([[highlight NvimTreeCursorLine gui=none guibg=#35394A]])
vim.cmd([[highlight NvimTreeOpenedFolderName guibg=none]])
vim.cmd([[highlight NvimTreeStatusLine gui=none guibg=none]])

vim.cmd([[highlight jsonCommentError guifg=#4f856a guibg=none]])
vim.cmd([[highlight Error guifg=#4f856a guibg=none]])
vim.cmd([[highlight TreesitterContextLineNumber guibg=#292e42 guifg=#737aa2]])
vim.cmd([[highlight Folded guifg=#737aa2]])

-- vim.cmd([[highlight DiffAdd gui=none guifg=none guibg=#143B3F]])
-- vim.cmd([[highlight DiffChange gui=none guifg=none guibg=#272D43]])
-- vim.cmd([[highlight DiffText gui=none guifg=none guibg=#394b70]])
-- vim.cmd([[highlight DiffDelete gui=none guifg=none guibg=#3F2D3D]])
-- vim.cmd([[highlight DiffviewDiffAddAsDelete guibg=#3f2d3d]])
-- vim.cmd([[highlight DiffviewDiffDelete gui=none guifg=#3B4252 guibg=none]])


vim.cmd([[highlight DiffAdd guibg=#143B3F]])
vim.cmd([[highlight DiffChange guibg=#272D43]])
vim.cmd([[highlight DiffText guibg=#394b70]])
vim.cmd([[highlight DiffDelete guibg=#3F2D3D]])
vim.cmd([[highlight DiffviewDiffAddAsDelete guibg=#3f2d3d]])
vim.cmd([[highlight DiffviewDiffDelete guifg=#3B4252 guibg=none]])


