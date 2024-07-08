-- return {}

return {
  "catppuccin/nvim",
  -- dependencies = { "mg979/vim-visual-multi" },
  priority = 1000,

  -- event = "VeryLazy",
  --
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, or mocha
      transparent_background = true,
      color_overrides = {
        all = {
          surface0 = "#444444",
          surface1 = "#666666",
          surface2 = "#a3a7bc",
          surface3 = "#a3a7bc",

          -- yellow = "#36C0D8",
          -- yellow = "#89ddff",
          green = "#F2CDCD",
          maroon = "#FAB387",

          yellow = "#2ac3de",
          -- green = "#F2CDCD",
          -- maroon = "#FAB387",


          -- yellow = "#74C7EC",
          -- yellow = "#0db9d7",
          -- yellow = "#90dcd1",
          -- yellow = "#F9E2AF",
          -- yellow = "#F38BA8",
          -- yellow = "#F5C2E7",
          -- yellow = "#A6E3A1",
          -- yellow = "#74C7EC",
          -- yellow = "#89ddff",
          -- yellow = "#90dcd1",
          -- yellow = "#94E2D5",
          -- yellow = "#179299",
          -- yellow = "#74C7EC",
          -- yellow = "#37d3dc",

          -- yellow = "#41a6b5",
          -- yellow = "#8ee2cf",
          -- green = "#8ee2cf",
          -- red = "#ff007c",
          -- maroon = "#F38BA8",
          -- maroon = "#8ee2cf",
          -- maroon = "#CA9EE6"
          -- maroon = "#EBA0AC",
          -- maroon = "#F5C2E7",
          -- maroon = "#FD90E0"
          -- maroon = "#B4BEFE",
          -- maroon = "#ff007c",
          -- maroon = "#BAC2DE",
          -- maroon = "#89DCEB",
          -- maroon = "#8ee2cf",
          -- maroon = "#74C7EC"
          -- maroon = "#CBA6F7",

          --
          -- yellow = "#F2CDCD",
          -- green = "#a1dfcf",
          -- red = "#89ddff",
          -- maroon = "#CBA6F7",
          --
          --[[ green = "#a1dfcf", ]]
          -- yellow = "#2ac3de",

          -- yellow = "#89ddff",
          -- yellow = "#0db9d7",
          -- red = "#89ddff",
          -- maroon = "#F38BA8",
          --
          --
          -- yellow = "#0db9d7",
          -- maroon = "#2ac3de",
          -- maroon = "#7aa2f7",
          -- maroon = "#F38BA8",
          -- yellow = "#8ee2cf",
          -- red = "#89B4FA",
          -- teal = "#F9E2AF",
          -- sky = "#F5C2E7"
          -- maroon = "#89ddff",
          -- maroon = "#9d7cd8",
          -- maroon = "#c0caf5",
          -- text = "#c0caf5",
          -- text = "#bbc2e0"
        },
      },
      -- integrations = {
      --   neotest = true,
      --   markdown = true,
      --   dropbar = {
      --     enabled = true,
      --     color_mode = true, -- enable color for kind's texts, not just kind's icons
      --   },
      --   cmp = true,
      --   hop = true,
      --   gitsigns = true,
      --   harpoon = true,
      --   telescope = true,
      --   rainbow_delimiters = true,
      --   -- ts_rainbow2 = false,
      --   lsp_trouble = true,
      --   neotree = true,
      --   lsp_saga = true,
      --   mason = true,
      --   dap = true,
      --   -- native_lsp = true,
      --   navic = {
      --     enabled = false,
      --     custom_bg = "NONE",
      --   },
      --   nvimtree = true,
      --   treesitter = true,
      --   neogit = true,
      --   semantic_tokens = true,
      --   treesitter_context = true,
      --   illuminate = true,
      --   gitgutter = true,
      -- },
      show_end_of_buffer = true, -- show the '~' characters after the end of buffers
      -- term_colors = true,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      styles = {
        comments = {},
        conditionals = { "bold" },
        loops = { "bold" },
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
    })

    -- setup must be called before loading
    vim.cmd.colorscheme("catppuccin")

    vim.cmd([[highlight StatusLine guibg=#292e42]])
    vim.cmd([[highlight NvimTreeStatusLineNC guibg=none]])

    -- vim.cmd([[hi MatchParen guibg=#394b70]])
    vim.cmd([[hi IlluminatedWordText guibg=#394b70]])
    vim.cmd([[hi IlluminatedWordRead guibg=#394b70]])
    vim.cmd([[hi IlluminatedWordWrite guibg=#394b70]])
    vim.cmd([[hi illuminatedCurWord guibg=#394b70]])
    vim.cmd([[hi illuminatedWord guibg=#394b70]])
    -- vim.cmd([[hi Boolean guifg=#F5C2E7]])

    vim.cmd([[highlight NeoTreeRootName gui=none]])
    vim.cmd([[highlight NeoTreeFileStatsHeader guifg=#3b4261]])
    vim.cmd([[highlight NeoTreeFileStats guifg=#3b4261]])
    -- #6C7087
    -- vim.cmd [[highlight NvimTreeGitDirty guifg=#f2cdcd]]
    vim.cmd([[highlight NvimTreeGitDirty guifg=#F9E2AF]])
    vim.cmd([[highlight NvimTreeGitStaged guifg=#8ee2cf]])
    vim.cmd([[highlight NvimTreeExecFile gui=none guifg=#F5C2E7]])
    -- vim.cmd([[highlight NvimTreeExecFile gui=none guifg=#F38BA8]])
    vim.cmd([[highlight NvimTreeModifiedFile gui=none guifg=#737aa2]])
    -- vim.cmd [[highlight NvimTreeModifiedFile gui=none guifg=#EFF1F5]]
    vim.cmd([[highlight NvimTreeGitNew guifg=#89ddff]])
    vim.cmd([[highlight NvimTreeRootFolder gui=none]])

    vim.cmd([[hi Folded guibg=#1f2335 guifg=#737aa2]])

    -- vim.cmd([[highlight LspInlayHint guibg=#1f2335]])
    -- vim.cmd([[hi LspInlayHint guifg=#5c5f79]])
    -- vim.cmd([[hi LspInlayHint guifg=#4f7080]])
    vim.cmd([[hi LspInlayHint guibg=#0F2745 guifg=#737aa2]])

    vim.cmd([[hi NvimTreeBookmark guifg=#f2cdcd]])

    vim.cmd("hi HlSearchNear guifg=#181826 guibg=#F38BA8")
    vim.cmd("hi HlSearchLensNear guifg=#181826 guibg=#F38BA8")

    vim.cmd([[hi @markup.heading.1.marker  guifg=#F5C2E7]])
    vim.cmd([[hi @markup.heading.1.markdown  guifg=#F5C2E7]])
    vim.cmd([[hi @markup.heading.2.markdown  guifg=#89ddff]])
    vim.cmd([[hi @markup.heading.3.markdown  guifg=#94E2D5]])
    vim.cmd([[hi @markup.heading.4.markdown  guifg=#F9E2AF]])

    -- vim.cmd([[hi @text.title.1.markdown  guifg=#89ddff]])
    -- vim.cmd([[hi @text.title.2.markdown  guifg=#89B4FA]])
    -- vim.cmd([[hi @text.title.3.markdown  guifg=#CBA6F7]])
    -- vim.cmd([[hi @text.title.3.markdown  guifg=#f2cdcd]])
    vim.cmd([[hi Ignore guifg=#394b70]])

    vim.cmd([[hi NeotestPassed guifg=#8ee2cf]])

    -- vim.cmd[[highlight EgrepifyFile gui=none guifg=#F38BA8]]
    -- vim.cmd [[highlight EgrepifyFile gui=none guifg=#FAB387]]
    vim.cmd([[highlight EgrepifyFile gui=none guifg=#f2cdcd]])
    vim.cmd([[highlight EgrepifyLnum gui=none guifg=#737aa2]])

    -- vim.cmd([[highlight CursorLine guibg=#35394A]])
    -- vim.cmd([[highlight CursorLine guibg=#3B4252]])
    -- vim.cmd([[highlight CursorLine guibg=none gui=none]])
    -- vim.cmd([[highlight NvimTreeCursorLine guibg=#3B4252]])
    -- vim.cmd([[highlight CursorLine guibg=#292e42]])
    -- vim.cmd([[highlight NvimTreeCursorLine guibg=#292e42]])

    -- vim.cmd([[highlight CursorLine guibg=#394b70]])
    -- vim.cmd([[highlight NvimTreeCursorLine guibg=#394b70]])

    vim.cmd([[highlight CursorLine guibg=#3b4261]])
    vim.cmd([[highlight NvimTreeCursorLine guibg=#3b4261]])

    vim.cmd([[highlight LineNR guifg=#3b4261]])
    vim.cmd([[highlight CursorLineNR guifg=#737aa2]])

    vim.cmd([[highlight IndentBlanklineChar guifg=#3b4251]])
    vim.cmd([[highlight IndentBlanklineContextChar guifg=#737aa2]])

    -- vim.cmd([[@ibl           xxx cleared]])
    vim.cmd([[highlight @ibl.indent.char.1  guifg=#3b4251]])
    vim.cmd([[highlight @ibl.whitespace.char.1 guifg=#3b4251]])
    vim.cmd([[highlight @ibl.scope.char.1 guifg=#737aa2]])
    vim.cmd([[highlight @ibl.scope.underline.1 guisp=#737aa2]])

    vim.cmd([[highlight IblIndent guifg=#3b4251]])
    vim.cmd([[highlight IblScope guifg=#737aa2]])

    vim.cmd([[highlight HarpoonBorder guifg=#394b70]])

    -- vim.cmd([[highlight TSRainbowRed guifg=#8AADF4]])
    -- vim.cmd([[highlight TSRainbowYellow guifg=#C6A0F6]])
    -- vim.cmd([[highlight TSRainbowBlue guifg=#F0C6C6]])
    -- vim.cmd([[highlight TSRainbowOrange guifg=#8AADF4]])
    -- vim.cmd([[highlight TSRainbowGreen guifg=#C6A0F6]])
    -- vim.cmd([[highlight TSRainbowViolet guifg=#F0C6C6]])
    -- vim.cmd([[highlight TSRainbowCyan guifg=#8AADF4]])

    vim.cmd([[highlight TSRainbowRed guifg=#74C7EC]])
    vim.cmd([[highlight TSRainbowYellow guifg=#C6A0F6]])
    vim.cmd([[highlight TSRainbowBlue guifg=#89B4FA]])
    vim.cmd([[highlight TSRainbowOrange guifg=#74C7EC]])
    vim.cmd([[highlight TSRainbowGreen guifg=#C6A0F6]])
    vim.cmd([[highlight TSRainbowViolet guifg=#89B4FA]])
    vim.cmd([[highlight TSRainbowCyan guifg=#74C7EC]])

    -- vim.cmd([[highlight DiagnosticUnderlineWarn gui=undercurl]])
    -- vim.cmd([[highlight DiagnosticUnderlineHint gui=undercurl]])
    -- vim.cmd([[highlight DiagnosticUnderlineInfo gui=undercurl]])
    -- vim.cmd([[highlight DiagnosticUnderlineError gui=undercurl guisp=#f38bad]])

    -- vim.cmd([[highlight DiagnosticUnderlineWarn gui=underline guisp=#F9E2AF]])
    -- -- vim.cmd([[highlight DiagnosticUnderlineHint gui=underline guisp=#2ac3de]])
    -- vim.cmd([[highlight DiagnosticUnderlineHint gui=underline guisp=#89ddff]])
    -- vim.cmd([[highlight DiagnosticUnderlineInfo gui=underline guisp=#89B4FA]])
    -- vim.cmd([[highlight DiagnosticUnderlineError gui=underline guisp=#f38bad]])

    vim.cmd([[highlight DiagnosticUnderlineWarn gui=undercurl guisp=#F9E2AF]])
    -- vim.cmd([[highlight DiagnosticUnderlineHint gui=undercurl guisp=#2ac3de]])
    vim.cmd([[highlight DiagnosticUnderlineHint gui=underline guisp=#89ddff]])
    vim.cmd([[highlight DiagnosticUnderlineInfo gui=undercurl guisp=#89B4FA]])
    vim.cmd([[highlight DiagnosticUnderlineError gui=undercurl guisp=#f38bad]])

    -- vim.cmd([[highlight DiagnosticUnderlineWarn gui=none]])
    -- vim.cmd([[highlight DiagnosticUnderlineHint gui=none]])
    -- vim.cmd([[highlight DiagnosticUnderlineInfo gui=none]])
    -- vim.cmd([[highlight DiagnosticUnderlineError gui=none]])

    -- vim.cmd([[highlight DiffviewFilePanelCounter guifg=#CBA6F7]])

    vim.cmd([[hi DiffviewFilePanelRootPath guifg=#B4BEFE]])
    -- vim.cmd([[highlight DiffviewFilePanelTitle guifg=#CBA6F7]])
    vim.cmd([[highlight DiffviewFilePanelTitle guifg=#B4BEFE]])
    vim.cmd([[highlight DiffviewFilePanelCounter guifg=#89B4FA]])
    -- vim.cmd([[highlight DiffviewFilePanelSelected guifg=#f2cdcd]])
    vim.cmd([[highlight DiffviewFilePanelSelected guifg=none]])
    -- vim.cmd([[highlight TelescopeSelection guibg=#f2cdcd guifg = none]])
    vim.cmd([[highlight TelescopeSelection guibg=#394b70 guifg = none gui=none]])
    -- vim.cmd([[highlight TelescopeMatching guibg=none guifg = #18a2fe]])
    vim.cmd([[highlight TelescopePreviewLine guibg=#394b70 gui = none]])
    -- vim.cmd([[highlight TelescopePreviewLine guibg=#004b72 gui = none]])
    -- vim.cmd([[highlight TelescopeMatching guifg=#f2cdcd]])
    -- vim.cmd([[highlight TelescopeSelection guibg=#004b72 guifg = none]])
    -- vim.cmd([[highlight TelescopeSelection guibg=#004b72]])

    -- vim.cmd[[hi NvimTreeNormal guifg=#B4BEFE]]

    vim.cmd([[highlight! CmpPmenu guibg=none]])
    vim.cmd([[highlight! CmpPmenuBorder guifg=#394b70]])
    vim.cmd([[highlight! PmenuSel guibg=#394b70]])

    --- -------------------- COMMON

    vim.cmd([[highlight DiffAdd gui=none guifg=none guibg=#103235]])
    vim.cmd([[highlight DiffChange gui=none guifg=none guibg=#272D43]])
    vim.cmd([[highlight DiffText gui=none guifg=none guibg=#394b70]])
    vim.cmd([[highlight DiffDelete gui=none guifg=none guibg=#3F2D3D]])
    -- vim.cmd([[highlight DiffDelete gui=none guifg=#011528 guibg=#3F2D3D]])
    vim.cmd([[highlight DiffviewDiffAddAsDelete guibg=#3f2d3d gui=none guifg=none]])
    vim.cmd([[highlight DiffviewDiffDelete gui=none guifg=#3B4252 guibg=none]])

    -- fugitive
    vim.cmd([[highlight diffAdded gui=none guifg=none guibg=#103235]])
    vim.cmd([[highlight diffRemoved gui=none guifg=none guibg=#3F2D3D]])

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
    -- vim.cmd([[highlight BufferLineTabSeparator gui=none guifg=#03142a]])
    -- vim.cmd([[highlight BufferLineTabSeparatorSelected gui=none guifg=#03142a]])

    vim.cmd([[highlight BufferLineTabSeparator gui=none guifg=#13182e]])
    vim.cmd([[highlight BufferLineTabSeparatorSelected gui=none guifg=#13182e]])
    vim.cmd([[highlight BufferLineTabSelected gui=none guibg=#394b70]])

    vim.cmd([[highlight InclineNormal  guibg=#292e42]])
    -- vim.cmd([[highlight InclineNormal  guibg=#3b4261]])
    vim.cmd([[highlight InclineNormalNC  guibg=#292e42 guifg=#7C7F93]])
    -- vim.cmd([[highlight InclineNormalNC  guibg=#292e42 guifg=#7C7F93]])
    vim.cmd([[highlight Winbar guifg=#bbc2e0]])
    vim.cmd([[highlight WinbarNC guifg=#7C7F93]])

    -- vim.cmd([[highlight InclineNormal  guibg=#394b70]])
    -- vim.cmd([[highlight InclineNormalNC  guibg=#394b70 guifg=#666666]])

    -- vim.cmd([[highlight TreesitterContextLineNumber guibg=#292e42 guifg=#737aa2]])
    vim.cmd([[highlight TreesitterContextLineNumber guibg=#0F2745 guifg=#737aa2]])
    -- vim.cmd([[highlight TreesitterContextLineNumber guibg=#394b70 guifg=#737aa2]])
    vim.cmd([[highlight TreesitterContext guifg=none guibg=none]])

    -- vim.cmd([[highlight NvimTreeWinSeparator guifg=#292e42]])
    vim.cmd([[ hi WinSeparator guifg=#292e42 ]])
    vim.cmd([[hi NvimTreeFolderIcon guifg=#89B4FA]])
    vim.cmd([[highlight NvimTreeFolderArrowClosed guifg=#89B4FA]])
    vim.cmd([[highlight NvimTreeFolderArrowOpen guifg=#89B4FA]])
    vim.cmd([[highlight NvimTreeWinSeparator guifg=#292e42]])
    vim.cmd([[highlight NvimTreeIndentMarker guifg=#292e42]])
    vim.cmd([[highlight BufferLineOffsetSeparator guifg=#292e42]])
    vim.cmd([[highlight TelescopeBorder guifg=#394b70]])

    vim.cmd([[highlight DiagnosticWarn guifg=#F9E2AF]])
    vim.cmd([[highlight DiagnosticFloatingWarn guifg=#F9E2AF]])
    vim.cmd([[highlight DiagnosticSignWarn guifg=#F9E2AF]])
    vim.cmd([[hi DiagnosticError guifg=#F38BA8]])
    vim.cmd([[hi DiagnosticSignError guifg=#F38BA8]])

    vim.cmd([[highlight GitSignsAdd guifg=#2ac3de]])
    vim.cmd([[highlight GitSignsChange guifg=#F2CDCD]])
    vim.cmd([[highlight GitSignsChangeInLine guifg=#F2CDCD]])
    vim.cmd([[highlight GitSignsDelete guifg=#F38BA8]])
    -- vim.cmd([[hi GitSignsCurrentLineBlame guifg=black]])

    -- vim.cmd([[highlight NormalFloat guibg=none blend=0]])
    -- vim.cmd([[highlight Normal guibg=none blend=0]])
    -- vim.cmd([[highlight NormalNC guibg=none blend=0]])
    -- vim.cmd([[highlight NormalSB guibg=none blend=0]])
    vim.cmd([[hi TroublePreview guibg=#264F78 guifg=none]])
    -- vim.cmd([[hi TroubleFileName guifg=none guibg=#394b70 guifg=#B4BEFE]])
    vim.cmd([[hi TroubleFileName guifg=none guibg=#1E1E2E guifg=#B4BEFE]])

    vim.cmd([[highlight DiagnosticHint guifg=#89DCEB]])
    vim.cmd([[highlight DiagnosticFloatingHint guifg=#89DCEB]])
    vim.cmd([[highlight DiagnosticSignHint guifg=#89DCEB]])
    vim.cmd([[highlight Visual gui=none cterm=none guibg=#264F78]])
    -- vim.cmd([[hi DiffviewFilePanelFileName guifg=#B4BEFE]])
    vim.cmd([[hi DiffviewFilePanelFileName guifg=#c0caf5]])
    vim.cmd([[hi @tag guifg=#F5C2E7]])
    vim.cmd([[hi @tag.attribute guifg=#B4BEFE]])
    -- vim.cmd([[hi @tag guifg=#B4BEFE]])
    -- vim.cmd([[hi @label guifg=#B4BEFE]])
    vim.cmd([[hi Error guifg=#F38BA8]])
    vim.cmd([[hi ErrorMsg guifg=#F38BA8]])
    -- vim.cmd([[hi @property guifg=#CDD6F4]])
    vim.cmd([[hi TreesitterContextBottom guifg=none gui=none]])

    -- vim.cmd([[hi @property.scss guifg=#89ddff]])
    -- vim.cmd([[hi @property.class.scss guifg=#89ddff]])
    vim.cmd([[hi @property.class.scss guifg=#CBA6F7]])
    -- vim.cmd([[hi @parameter guifg=#B4BEFE]])

    -- vim.cmd([[highlight CmpItemKindText gui=bold,italic]])
    -- vim.cmd([[highlight CmpItemKindVariable gui=bold,italic]])
    -- vim.cmd([[highlight CmpItemKindMethod gui=bold,italic]])
    -- vim.cmd([[highlight CmpItemKindSnippet gui=bold,italic]])
    -- vim.cmd([[highlight CmpItemKindField gui=bold,italic]])
    -- vim.cmd([[highlight CmpItemKindKeyword gui=bold,italic]])
    -- vim.cmd([[highlight CmpItemKindFunction gui=bold,italic]])
    -- vim.cmd([[highlight CmpItemKindClass gui=bold,italic]])

    vim.cmd([[highlight @lsp.type.type guifg=#2ac3de]])
    vim.cmd([[highlight @lsp.type.interface guifg=#2ac3de]])
    vim.cmd([[highlight @attribute.typescript guifg=#2ac3de]])


    -- vim.cmd([[highlight @lsp.type.type guifg=#89ddff]])
    -- vim.cmd([[highlight @lsp.type.interface guifg=#89ddff]])
    -- vim.cmd([[highlight @attribute.typescript guifg=#89ddff]])

    vim.cmd([[highlight @lsp.type.class.markdown guifg=#F5C2E7]])

    -- vim.cmd([[highlight @lsp.type.type guifg=#F5C2E7]])
    -- vim.cmd([[highlight @lsp.type.interface guifg=#F5C2E7]])
    -- vim.cmd([[highlight @attribute.typescript guifg=#F5C2E7]])

    -- vim.cmd([[highlight @lsp.type.type guifg=#89ddff]])
    -- vim.cmd([[highlight @lsp.type.interface guifg=#89ddff]])
    -- vim.cmd([[highlight @attribute.typescript guifg=#89ddff]])

    -- vim.cmd([[highlight @lsp.type.parameter.dockerfile guifg=#B4BEFE]])

    -- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })

    -- vim.cmd([[highlight LspSignatureActiveParameter guifg=#B4BEFE guibg=#3e5767]])

    vim.cmd([[highlight LspSignatureActiveParameter gui=none guifg=none guibg=#264F78]])
    vim.cmd([[highlight SignatureActiveParameter gui=none guifg=none guibg=#264F78]])

    -- vim.cmd([[highlight WarningMsg guifg=#f38bad]])
    vim.cmd([[highlight WarningMsg guifg=#F2CDCD]])

    vim.cmd([[highlight GitConflictAncestor guibg=#303446]])
    vim.cmd([[highlight GitConflictAncestorLabel guibg=#45475A]])

    -- vim.g.VM_Mono_hl = 'Visual'
    -- vim.g.VM_Mono = 'Visual'
    -- vim.g.VM_Extend = 'Visual'
    -- vim.cmd([[highlight! VM_Mono guibg=#004b72]])
    -- vim.cmd([[highlight! VM_Extend guibg=#004b72]])

    -- unused variable highlight
    -- vim.cmd([[highlight DiagnosticUnnecessary guifg=#6c7087 gui=undercurl ]])
    -- vim.cmd([[highlight DiagnosticUnnecessary guifg=#6c7087]])

    vim.cmd([[highlight DiagnosticUnnecessary guifg=#747ebd]])
    vim.cmd([[highlight CopilotSuggestion gui=none]])
    -- vim.cmd([[highlight Comment guifg=#747ebd]])

    -- vim.cmd([[highlight ScrollbarCursor  ctermfg=0 guifg=#cdd6f4]])
    -- vim.cmd([[highlight ScrollbarCursorHandle  ctermfg=0 guifg=#cdd6f4 guibg=#3b4252 blend=0]])
    -- vim.cmd([[highlight ScrollbarCursorHandle guifg=#3b4261 guibg=#3b4261]])

    -- good
    vim.cmd([[highlight ScrollbarCursorHandle guifg=none guibg=#3b4252]])
    vim.cmd([[highlight ScrollbarHandle  guibg=none blend=100]])
    vim.cmd([[highlight ScrollbarWarnHandle  ctermfg=0 guifg=#F9E2AF guibg=none blend=0]])
    vim.cmd([[highlight ScrollbarWarn   ctermfg=0 guifg=#F9E2AF]])
    vim.cmd([[highlight ScrollbarError  ctermfg=0 guifg=#f38ba8]])
    vim.cmd([[highlight ScrollbarErrorHandle  ctermfg=0 guifg=#f38ba8 guibg=none blend=0]])
    vim.cmd([[highlight ScrollbarHint   ctermfg=0 guifg=#2ac3de]])
    vim.cmd([[highlight ScrollbarHintHandle  ctermfg=0 guifg=#2ac3de guibg=none blend=0]])
    vim.cmd([[highlight ScrollbarMisc   ctermfg=0 guifg=#cdd6f4]])
    vim.cmd([[highlight ScrollbarMiscHandle  ctermfg=0 guifg=#cdd6f4 guibg=none blend=0]])
    vim.cmd([[highlight ScrollbarSearch  ctermfg=0 guifg=#cdd6f4]])
    vim.cmd([[highlight ScrollbarSearchHandle  ctermfg=0 guifg=#cdd6f4 guibg=none blend=0]])
    vim.cmd([[highlight ScrollbarGitChange  ctermfg=0 guifg=#2ac3de]])
    vim.cmd([[highlight ScrollbarGitChangeHandle  ctermfg=0 guifg=#2ac3de guibg=none blend=0]])
    vim.cmd([[highlight ScrollbarGitDelete  ctermfg=0 guifg=#f38ba8]])
    vim.cmd([[highlight ScrollbarGitDeleteHandle  ctermfg=0 guifg=#f38ba8 guibg=none blend=0]])
    vim.cmd([[highlight ScrollbarInfo   ctermfg=0 guifg=#89dceb]])
    vim.cmd([[highlight ScrollbarInfoHandle  ctermfg=0 guifg=#89dceb guibg=none blend=0]])
    vim.cmd([[highlight ScrollbarGitAdd  ctermfg=0 guifg=#f2cdcd]])
    vim.cmd([[highlight ScrollbarGitAddHandle  ctermfg=0 guifg=#f2cdcd guibg=none blend=0]])

    -- vim.cmd([[highlight Keyword  gui=bold]])
    -- vim.cmd([[highlight Include  gui=bold]])
    vim.cmd([[highlight @keyword  gui=bold guifg=#CBA6F7]])
    vim.cmd([[highlight @keyword.return  gui=bold]])
    vim.cmd([[highlight @keyword.operator  gui=bold]])
    vim.cmd([[highlight @keyword.exception  gui=bold guifg=#F5C2E7]])

    vim.cmd([[highlight Constant gui=none cterm=none guibg=none blend=0]])
    vim.cmd([[highlight Title gui=none cterm=none guibg=none blend=0]])
    vim.cmd([[highlight NonText gui=none cterm=none guibg=none blend=0]])

    -- vim.cmd([[highlight NoiceLspProgressTitle guibg=none blend=0]])
    -- vim.cmd([[highlight NoiceLspProgressClient guibg=none blend=0]])
    -- vim.cmd([[highlight NoiceLspProgressSpinner guibg=none blend=0]])

    -- vim.cmd([[highlight VertSplit  guifg=#03142a]])
    vim.cmd([[highlight VertSplit  guifg=#292e42]])

    vim.cmd([[highlight FloatBorder  guifg=#394b70]])
    vim.cmd([[highlight SagaBorder  guifg=#394b70]])
    vim.cmd([[highlight SagaTitle  guifg=#394b70]])
    vim.cmd([[highlight @variable.builtin guifg=#89ddff]])

    vim.cmd([[highlight ctrlsfMatch guifg=#F2CDCD guibg=#394b70]])

    vim.cmd([[highlight @text.uri gui=none]])

    vim.cmd([[highlight QuickFixLine gui=none guibg=#264F78]])

    vim.cmd([[highlight TabLine guibg=none]])
    vim.cmd([[highlight TabLineSel guibg=none]])

    -- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })
    -- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })
    -- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })
    -- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })
    -- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })
    -- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })
    -- vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { link = "Search" })

    vim.api.nvim_set_hl(0, "DapUIPlayPauseNC", { link = "DapUIPlayPause" })
    vim.api.nvim_set_hl(0, "DapUIRestartNC", { link = "DapUIRestart" })
    vim.api.nvim_set_hl(0, "DapUIStopNC", { link = "DapUIStop" })
    vim.api.nvim_set_hl(0, "DapUIStepOverNC", { link = "DapUIStepOver" })
    vim.api.nvim_set_hl(0, "DapUIStepIntoNC", { link = "DapUIStepInto" })
    vim.api.nvim_set_hl(0, "DapUIStepBackNC", { link = "DapUIStepBack" })
    vim.api.nvim_set_hl(0, "DapUIStepOutNC", { link = "DapUIStepOut" })

    -- vim.cmd([[highlight DiagnosticVirtualTextWarn guifg=#DCDCAA guibg=none]])
    -- vim.cmd([[highlight DiagnosticVirtualTextInfo guifg=#2ac3de guibg=none]])
    -- vim.cmd([[highlight DiagnosticVirtualTextError guifg=#db4b4b]])
    -- vim.cmd([[highlight DiagnosticVirtualTextHint guibg=#233745]])
    vim.cmd([[highlight DiagnosticVirtualTextWarn guifg=#DCDCAA guibg=#233745]])
    vim.cmd([[highlight DiagnosticVirtualTextInfo guifg=#2ac3de guibg=#192b38]])
    vim.cmd([[highlight DiagnosticVirtualTextError guifg=#db4b4b guibg=#362c3d]])
    vim.cmd([[highlight DiagnosticVirtualTextHint guifg=#89DCEB guibg=#233745]])

    vim.cmd([[hi EndOfBuffer guifg=#737aa2]])
    -- vim.cmd([[highlight DiagnosticVirtualTextHint guifg=#568FBF guibg=#233745]])

    vim.cmd([[highlight DiagnosticVirtualTextWarnLine guifg=#DCDCAA guibg=#292e42]])
    vim.cmd([[highlight DiagnosticVirtualTextInfoLine guifg=#2ac3de guibg=#292e42]])
    vim.cmd([[highlight DiagnosticVirtualTextErrorLine guifg=#db4b4b guibg=#292e42]])
    vim.cmd([[highlight DiagnosticVirtualTextHintLine guifg=#89DCEB guibg=#292e42]])

    vim.cmd([[hi DiagnosticUnderlineHint gui=undercurl]])
    vim.cmd([[hi barbecue_modified guifg=#bbc2e0]])
    -- vim.cmd([[hi Keyword gui=italic]])

    -- vim.cmd([[highlight ScrollbarCursorHandle guifg=#3B4252 gui=none guibg=#03142a]])
    -- vim.cmd([[highlight ScrollbarCursorHandle guifg=#7C7F93 guibg=#a3a7bc]])
    -- vim.cmd([[highlight ScrollbarCursorHandle guifg=#7C7F93 guibg=#a7F93]])
    -- vim.cmd([[highlight ScrollbarCursorHandle guifg=#a3a7bc guibg=#7C7F93]])
    -- vim.cmd([[highlight ScrollbarCursor guifg=red guibg=red]])
    -- vim.cmd([[highlight ScrollbarCursor  guibg=#]])
    -- vim.cmd([[highlight ScrollbarCursor ctermfg=red gui=none guifg=red guibg=#03142a]])
    -- vim.cmd([[highlight ScrollbarCursor guifg=03142a guibg=black]])
    -- vim.cmd([[highlight ScrollbarCursorHandle guifg=#3B4252 gui=none guibg=#3B4252]])
    -- vim.cmd([[highlight ScrollbarHandle guifg=none gui=none guibg=#3B4252]])
    -- vim.cmd([[highlight ScrollbarHandle guifg=none gui=none guibg=none]])

    -- Name	Latte	Frappe	Macchiato	Mocha	Usage
    -- rosewater	#dc8a78	#F2D5CF	#F4DBD6	#F5E0DC	Winbar
    -- flamingo	#DD7878	#EEBEBE	#F0C6C6	#F2CDCD	Target word
    -- pink	#ea76cb	#F4B8E4	#F5BDE6	#F5C2E7	Just pink
    -- mauve	#8839EF	#CA9EE6	#C6A0F6	#CBA6F7	Tag
    -- red	#D20F39	#E78284	#ED8796	#F38BA8	Error
    -- maroon	#E64553	#EA999C	#EE99A0	#EBA0AC	Lighter red
    -- peach	#FE640B	#EF9F76	#F5A97F	#FAB387	Number
    -- yellow	#df8e1d	#E5C890	#EED49F	#F9E2AF	Warning
    -- green	#40A02B	#A6D189	#A6DA95	#A6E3A1	Diff add
    -- teal	#179299	#81C8BE	#8BD5CA	#94E2D5	Hint
    -- sky	#04A5E5	#99D1DB	#91D7E3	#89DCEB	Operator
    -- sapphire	#209FB5	#85C1DC	#7DC4E4	#74C7EC	Constructor
    -- blue	#1e66f5	#8CAAEE	#8AADF4	#89B4FA	Diff changed
    -- lavender	#7287FD	#BABBF1	#B7BDF8	#B4BEFE	CursorLine Nr
    -- text	#4C4F69	#c6d0f5	#CAD3F5	#CDD6F4	Default fg
    -- subtext1	#5C5F77	#b5bfe2	#B8C0E0	#BAC2DE	Indicator
    -- subtext0	#6C6F85	#a5adce	#A5ADCB	#A6ADC8	Float title
    -- overlay2	#7C7F93	#949cbb	#939AB7	#9399B2	Popup fg
    -- overlay1	#8C8FA1	#838ba7	#8087A2	#7F849C	Conceal color
    -- overlay0	#9CA0B0	#737994	#6E738D	#6C7086	Fold color
    -- surface2	#ACB0BE	#626880	#5B6078	#585B70	Default comment
    -- surface1	#BCC0CC	#51576d	#494D64	#45475A	Darker comment
    -- surface0	#CCD0DA	#414559	#363A4F	#313244	Darkest comment
    -- base	#EFF1F5	#303446	#24273A	#1E1E2E	Default bg
    -- mantle	#E6E9EF	#292C3C	#1E2030	#181825	Darker bg
    -- crust	#DCE0E8	#232634	#181926	#11111B	Darkest bg

    -- Tokyo night

    -- M.default = {
    --   none = "NONE",
    --   bg_dark = "#1f2335",
    --   bg = "#24283b",
    --   bg_highlight = "#292e42",
    --   terminal_black = "#414868",
    --   fg = "#c0caf5",
    --   fg_dark = "#a9b1d6",
    --   fg_gutter = "#3b4261",
    --   dark3 = "#545c7e",
    --   comment = "#565f89",
    --   dark5 = "#737aa2",
    --   blue0 = "#3d59a1",
    --   blue = "#7aa2f7",
    --   cyan = "#7dcfff",
    --   blue1 = "#2ac3de",
    --   blue2 = "#0db9d7",
    --   blue5 = "#89ddff",
    --   blue6 = "#b4f9f8",
    --   blue7 = "#394b70",
    --   magenta = "#bb9af7",
    --   magenta2 = "#ff007c",
    --   purple = "#9d7cd8",
    --   orange = "#ff9e64",
    --   yellow = "#e0af68",
    --   green = "#9ece6a",
    --   green1 = "#73daca",
    --   green2 = "#41a6b5",
    --   teal = "#1abc9c",
    --   red = "#f7768e",
    --   red1 = "#db4b4b",
    --   git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
    --   gitSigns = {
    --     add = "#266d6a",
    --     change = "#536c9e",
    --     delete = "#b2555b",
    --   },
    -- }
    --

    vim.cmd([[
let g:fzf_colors =
\ { 'fg':      ['fg', 'Visual'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'TelescopeMatching'],
  \ 'fg+':     ['fg', 'Normal', 'Normal', 'Normal'],
  \ 'bg+':     ['bg', 'Normal', 'Normal'],
  \ 'hl+':     ['fg', 'TelescopeMatching'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
]])

    --     vim.cmd [[
    -- let g:fzf_colors =
    -- \ { 'fg':      ['fg', 'Visual'],
    --   \ 'bg':      ['bg', 'Normal'],
    --   \ 'hl':      ['fg', 'TelescopeMatching'],
    --   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    --   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    --   \ 'hl+':     ['fg', 'TelescopeMatching'],
    --   \ 'info':    ['fg', 'PreProc'],
    --   \ 'border':  ['fg', 'Ignore'],
    --   \ 'prompt':  ['fg', 'Conditional'],
    --   \ 'pointer': ['fg', 'Exception'],
    --   \ 'marker':  ['fg', 'Keyword'],
    --   \ 'spinner': ['fg', 'Label'],
    --   \ 'header':  ['fg', 'Comment'] }
    -- ]]

    vim.cmd([[let g:fzf_checkout_view_mode = 'inline']])
    vim.cmd([[let g:fzf_checkout_git_options = "--format='%(color:#c0caf5)%(refname:short)'"]])
    vim.cmd([[let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-q': 'fill_quickfix'}]])
  end,
}
