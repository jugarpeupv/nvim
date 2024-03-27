-- return {}
return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  config = function()
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
      -- ignore_install = { "yaml" },
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
        -- "dap_repl",
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
      -- matchup = {
      --   enable = true,
      -- },
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = false,
        },
      },
    })
  end,
}
