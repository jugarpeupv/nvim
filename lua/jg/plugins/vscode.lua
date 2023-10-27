local c = require('vscode.colors')
require("vscode").setup({
  style = 'dark',
  -- Enable transparent background
  transparent = true,

  -- Enable italic comment
  italic_comments = false,

  -- Disable nvim-tree background color
  disable_nvimtree_bg = true,

  color_overrides = {
    vscGreen = '#4f856a'
  },
  -- Override highlight groups (see ./lua/vscode/theme.lua)
  -- group_overrides = {
  --   Comment = { fg = "#4f856a" }
  --   -- -- vscGreen = '#6A9955',
  --   -- vscGreen = '#4f856a',
  -- }
})

require('vscode').load('dark')

-- VS CODE
vim.cmd([[highlight BufferLineFill guibg=none]])
vim.cmd([[highlight EndOfBuffer guifg=#3b4251 guibg=none]])
vim.cmd([[highlight Pmenu guibg=none]])
-- vim.cmd([[highlight Pmenu guibg=#06182a]])
-- vim.cmd([[highlight Pmenu guibg=#292e42]])
-- vim.cmd([[highlight Pmenu guibg=#223E55]])
-- vim.cmd([[highlight Pmenu guibg=#223E55]])
-- vim.cmd([[highlight Pmenu guibg=#192632]])
-- vim.cmd([[highlight Pmenu guibg=#192632]])
vim.cmd([[highlight NvimTreeRootFolder guifg=#569CD6]])
vim.cmd([[highlight LspReferenceText gui=none guibg=#264F78]])
vim.cmd([[highlight LspReferenceRead gui=none guibg=#264F78]])
vim.cmd([[highlight LspReferenceWrite gui=none guibg=#264F78]])
vim.cmd([[highlight LspSignatureActiveParameter gui=none guifg=none guibg=#264F78]])
vim.cmd([[highlight gitblame gui=none guibg=#35394A guifg=black]])
-- vim.cmd([[highlight TSVariableBuiltin gui=none guifg=#569CD6 guibg=none]])
-- vim.cmd([[highlight TSVariable gui=none guifg=#4FC1FF guibg=none]])

-- vim.cmd([[highlight @variable.builtin gui=italic guifg=#569CD6 guibg=none]])
vim.cmd([[highlight @variable.builtin gui=none guifg=#569CD6 guibg=none]])
-- vim.cmd([[highlight @variable gui=none guifg=#4FC1FF guibg=none]])
-- vim.cmd([[highlight TSOperator gui=none guifg=#9CDCFE guibg=none]])

-- vim.cmd([[highlight NormalFloat guibg=none]])

vim.cmd([[highlight QuickFixLine guibg=#264F78]])
-- vim.cmd([[highlight NvimTreeVertSplit guifg=#3B4252]])
vim.cmd([[highlight NvimTreeVertSplit guifg=#737aa2]])
vim.cmd([[highlight StatusLineNC guibg=none]])
vim.cmd([[highlight StatusLine guibg=#292e42]])
vim.cmd([[highlight LineNR guifg=#3b4251]])
vim.cmd([[highlight CursorLineNR guifg=#737aa2]])
vim.cmd([[highlight IndentBlanklineChar guifg=#3b4251]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#737aa2]])

vim.cmd([[highlight NvimTreeIndentMarker guifg=#3b4251]])
vim.cmd([[highlight IncSearch guibg=#264F78]])
vim.cmd([[highlight CmpItemKindProperty guifg=#73daca]])

vim.cmd([[highlight CursorLine guibg=#35394A]])
vim.cmd([[highlight NvimTreeCursorLine gui=none guibg=#35394A]])
vim.cmd([[highlight NvimTreeOpenedFolderName guibg=none]])
vim.cmd([[highlight NvimTreeStatusLine gui=none guibg=none]])

vim.cmd([[highlight jsonCommentError guifg=#4f856a guibg=none]])
-- vim.cmd([[highlight Error guifg=#4f856a guibg=none]])
vim.cmd([[highlight TreesitterContextLineNumber guibg=#292e42 guifg=#737aa2]])
vim.cmd([[highlight Folded guifg=#737aa2]])


-- vim.cmd([[highlight DiagnosticVirtualTextWarn guifg=#DCDCAA guibg=none]])
-- vim.cmd([[highlight DiagnosticVirtualTextInfo guifg=#0db9d7 guibg=none]])
-- vim.cmd([[highlight DiagnosticVirtualTextError guifg=#db4b4b]])
-- vim.cmd([[highlight DiagnosticVirtualTextWarn guifg=#DCDCAA guibg=#233745]])
-- vim.cmd([[highlight DiagnosticVirtualTextInfo guifg=#0db9d7 guibg=#192b38]])
-- vim.cmd([[highlight DiagnosticVirtualTextHint guibg=#233745]])
-- vim.cmd([[highlight DiagnosticVirtualTextError guifg=#db4b4b guibg=#362c3d]])
-- vim.cmd([[highlight DiagnosticVirtualTextHint guifg=#1abc9c guibg=#233745]])
-- vim.cmd([[highlight DiagnosticVirtualTextHint guifg=#568FBF guibg=#233745]])


-- vim.cmd([[highlight DiagnosticHint guifg=#1abc9c]])
-- vim.cmd([[highlight DiagnosticUnderlineHint guisp=#1abc9c]])

-- vim.cmd([[highlight MatchParen guibg=#0c4775]])
vim.cmd([[highlight MatchParen guibg=#264F78]])
-- vim.cmd([[highlight NvimTreeFolderIcon guifg=#89b4fa]])
vim.cmd([[highlight NvimTreeFolderIcon guifg=#568FBF]])
-- vim.cmd([[highlight NvimTreeFolderIcon guifg=#C586C0]])
-- vim.cmd([[highlight NvimTreeFolderIcon guifg=#9CDCFE]])

vim.cmd([[highlight @punctuation.bracket guifg=#9CDCFE ]])

-- vim.cmd([[highlight MatchParen guibg=#752D4E]])
-- vim.cmd([[highlight Search guibg=#752D4E]])
vim.cmd([[highlight NvimtreeGitStaged guifg=#9CDCFE]])
vim.cmd([[highlight NvimtreeGitStaged guifg=#9CDCFE]])
vim.cmd([[highlight NvimtreeGitDeleted guifg=#9CDCFE]])
vim.cmd([[highlight NvimtreeGitIgnored guifg=#9CDCFE]])
vim.cmd([[highlight NvimtreeGitDirty guifg=#9CDCFE]])

-- *lsp-semantic-highlight*
-- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--   vim.api.nvim_set_hl(0, group, {})
-- end
--
-- vim.cmd([[highlight @lsp.type.class guifg=#4EC9B0]])
-- -- vim.cmd([[highlight @lsp.type.variable guifg=#569CD6]])
-- vim.cmd([[highlight @lsp.type.type guifg=#4EC9B0]])
-- vim.cmd([[highlight @lsp.type.typeParameter guifg=#4EC9B0]])



vim.cmd([[highlight TSRainbowRed guifg=#DCDCAA]])
vim.cmd([[highlight TSRainbowYellow guifg=#569CD6]])
vim.cmd([[highlight TSRainbowBlue guifg=#9CDCFE]])
vim.cmd([[highlight TSRainbowOrange guifg=#DCDCAA]])
vim.cmd([[highlight TSRainbowGreen guifg=#569CD6]])
vim.cmd([[highlight TSRainbowViolet guifg=#9CDCFE]])
vim.cmd([[highlight TSRainbowCyan guifg=#DCDCAA]])

-- vim.cmd([[highlight DiagnosticUnderlineWarn gui=none guisp=none]])
-- vim.cmd([[highlight DiagnosticUnderlineHint gui=none guisp=none]])
-- vim.cmd([[highlight DiagnosticUnderlineError gui=none guisp=none]])
-- vim.cmd([[highlight DiagnosticUnderlineInfo gui=none guisp=none]])


-- vim.cmd([[highlight DiagnosticUnderlineWarn gui=undercurl guisp=#DCDCAA]])
-- vim.cmd([[highlight DiagnosticUnderlineHint gui=undercurl guisp=#569CD6]])
-- vim.cmd([[highlight DiagnosticUnderlineInfo gui=undercurl guisp=#1abc9c]])
-- vim.cmd([[highlight DiagnosticUnderlineError gui=undercurl guisp=#F44747]])

vim.cmd([[highlight DiagnosticUnderlineWarn gui=underline guisp=#DCDCAA]])
vim.cmd([[highlight DiagnosticUnderlineHint gui=underline guisp=#569CD6]])
vim.cmd([[highlight DiagnosticUnderlineInfo gui=underline guisp=#1abc9c]])
vim.cmd([[highlight DiagnosticUnderlineError gui=underline guisp=#F44747]])

vim.cmd([[highlight DiagnosticUnnecessary gui=none guifg=#646695]])



--- -------------------- COMMON

vim.cmd([[highlight DiffAdd gui=none guifg=none guibg=#103235]])
vim.cmd([[highlight DiffChange gui=none guifg=none guibg=#272D43]])
vim.cmd([[highlight DiffText gui=none guifg=none guibg=#394b70]])
vim.cmd([[highlight DiffDelete gui=none guifg=none guibg=#3F2D3D]])
-- vim.cmd([[highlight DiffDelete gui=none guifg=#011528 guibg=#3F2D3D]])
vim.cmd([[highlight DiffviewDiffAddAsDelete guibg=#3f2d3d gui=none guifg=none]])
vim.cmd([[highlight DiffviewDiffDelete gui=none guifg=#3B4252 guibg=none]])


--

vim.cmd([[highlight DiffviewStatusDeleted gui=none guifg=#f38bad guibg=none]])
vim.cmd([[highlight DiffviewStatusModified gui=none guifg=#89b4fa guibg=none]])
vim.cmd([[highlight DiffviewStatusAdded gui=none guifg=#1abc9c guibg=none]])
vim.cmd([[highlight DiffviewStatusUntracked gui=none guifg=#1abc9c guibg=none]])
vim.cmd([[highlight DiffviewFilePanelInsertions gui=none guifg=#1abc9c guibg=none]])
vim.cmd([[highlight DiffviewFilePanelDeletions gui=none guifg=#f38bad guibg=none]])

--

-- Left panel
-- "DiffChange:DiffAddAsDelete",
-- "DiffText:DiffDeleteText",
vim.cmd([[highlight DiffAddAsDelete gui=none guifg=none guibg=#3F2D3D]])
vim.cmd([[highlight DiffDeleteText gui=none guifg=none guibg=#4B1818]])

-- Right panel
-- "DiffChange:DiffAdd",
-- "DiffText:DiffAddText",
vim.cmd([[highlight DiffAddText gui=none guifg=none guibg=#1C5458]])

vim.cmd([[highlight DiffDelete guifg=#011528]])

-- vim.cmd([[highlight ErrorMsg  guifg=orange]])

--
vim.cmd([[highlight BufferLineTabSeparator gui=none guifg=#03142a]])
vim.cmd([[highlight BufferLineTabSeparatorSelected gui=none guifg=#03142a]])



-- vscGray = '#808080',
-- vscViolet = '#646695',
-- vscBlue = '#569CD6',
-- vscAccentBlue = '#4FC1FE',
-- vscDarkBlue = '#223E55',
-- vscMediumBlue = '#18a2fe',
-- vscLightBlue = '#9CDCFE',
-- vscGreen = '#6A9955',
-- vscBlueGreen = '#4EC9B0',
-- vscLightGreen = '#B5CEA8',
-- vscRed = '#F44747',
-- vscOrange = '#CE9178',
-- vscLightRed = '#D16969',
-- vscYellowOrange = '#D7BA7D',
-- vscYellow = '#DCDCAA',
-- vscDarkYellow = '#FFD602',
-- vscPink = '#C586C0',


vim.cmd([[highlight! CmpPmenu guibg=none]])
vim.cmd([[highlight! CmpPmenuBorder guifg=#394b70]])

vim.cmd([[highlight MoreMsg guibg=none]])
vim.cmd([[highlight ModeMsg guibg=none]])

vim.cmd([[highlight @operator guifg=#9CDCFE]])
vim.cmd [[highlight TroubleCount guibg=none]]

vim.cmd [[highlight IlluminatedWordRead gui=none guibg=#3B4252]]
vim.cmd [[highlight IlluminatedWordText gui=none guibg=#3B4252]]
vim.cmd [[highlight IlluminatedWordWrite gui=none guibg=#3B4252]]

vim.cmd [[highlight CmpItemKindText gui=none guifg=#7f849c]]
vim.cmd [[highlight CmpItemKindKeyword gui=none guifg=#DCDCAA]]
vim.cmd [[highlight CmpItemKindModule gui=none guifg=#CE9178]]
vim.cmd [[highlight CmpItemKindSnippet gui=none guifg=#CE9178]]

-- vim.cmd[[highlight barbecue_dirname gui=none guifg=#7f849c]]
vim.cmd [[highlight NvimTreeBookmark gui=none guifg=#4EC9B0]]

vim.cmd [[highlight @error gui=none guifg=#F0C6C6]]

-- vim.cmd[[highlight Inven gui=none guibg=none guifg=#7f849c]]
-- vim.cmd[[set winhighlight="Normal:Inven,FloatNormal=Inven"]]

vim.cmd [[highlight BufferLineBufferVisible gui=none guifg=#7f849c]]


vim.cmd([[highlight NvimTreeWinSeparator guifg=#292e42]])
vim.cmd([[highlight NvimTreeIndentMarker guifg=#3b4251]])
vim.cmd([[highlight BufferLineOffsetSeparator guifg=#292e42]])

vim.cmd([[highlight @keyword gui=italic]])
vim.cmd([[highlight OilDir guifg=#569CD6]])

-- vim.cmd([[highlight NonText gui=bold guibg=#394b70 guifg=#7f849c ]])
-- vim.cmd([[highlight Title gui=bold guibg=#394b70 guifg=#7f849c]])
-- vim.cmd([[highlight Normal gui=none guibg=none guifg=#7f849c]])


-- vim.cmd([[highlight FidgetTask guifg=#3B4252 ]])
-- vim.cmd([[highlight FidgetTitle guifg=#3B4252]])


vim.cmd([[highlight FidgetTask guifg=#737aa2]])
vim.cmd([[highlight FidgetTitle guifg=#737aa2]])


vim.cmd([[highlight ScrollbarHandle guifg=none gui=none guibg=none]])
vim.cmd([[highlight ScrollbarCursorHandle guifg=#3B4252 gui=none guibg=#3B4252]])
