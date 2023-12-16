-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  {
    'dhruvmanila/browser-bookmarks.nvim',
    version = '*',
    dependencies = {
      'kkharji/sqlite.lua',
      'nvim-telescope/telescope.nvim',
    }
  },
  {
    'nvim-treesitter/playground',
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
        { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn",
        { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo",
        { text = " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint",
        { text = "󰌵", texthl = "DiagnosticSignHint" })

      require("neo-tree").setup({
        close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = false,
        enable_diagnostics = true,
        enable_normal_mode_for_inputs = false,                             -- Enable normal mode for input dialogs.
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
        sort_case_insensitive = false,                                     -- used when sorting files and directories in the tree
        sort_function = nil,                                               -- use a custom function for sorting files and directories in the tree
        -- sort_function = function (a,b)
        --       if a.type == b.type then
        --           return a.path > b.path
        --       else
        --           return a.type > b.type
        --       end
        --   end , -- this sorts files and directories descendantly
        default_component_configs = {
          container = {
            enable_character_fade = false 
          },
          indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            -- folder_empty = "󰜌",
            folder_empty = "",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            -- default = "*",
            default = "",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            -- symbol = "[+]",
            -- highlight = "NeoTreeModified",
            symbol = "!",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              -- added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
              -- modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              added     = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "!", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖", -- this can only be used in the git_status source
              renamed   = "󰁕", -- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              -- unstaged  = "󰄱",
              -- staged    = "",
              unstaged  = "",
              staged    = "",
              -- unstaged  = "!",
              -- staged    = "+",
              conflict  = "",
            }
          },
          -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
          file_size = {
            enabled = true,
            required_width = 64, -- min width of window required to show this column
          },
          type = {
            enabled = true,
            required_width = 122, -- min width of window required to show this column
          },
          last_modified = {
            enabled = true,
            required_width = 88, -- min width of window required to show this column
          },
          created = {
            enabled = true,
            required_width = 110, -- min width of window required to show this column
          },
          symlink_target = {
            enabled = true,
          },
        },
        -- A list of functions, each representing a global custom command
        -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
        -- see `:h neo-tree-custom-commands-global`
        commands = {},
        window = {
          position = "left",
          width = 40,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<space>"] = {
              "toggle_node",
              nowait = false,   -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            -- ["<space>"] = {
            --   "noop",
            -- },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "cancel", -- close preview or floating neo-tree window
            ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            -- Read `# Preview Mode` for more information
            -- ["l"] = "focus_preview",
            ["l"] = "open",
            ["<C-x>"] = "open_split",
            -- ["O"] = "open_split",
            ["<C-v>"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["W"] = "open_with_window_picker",
            ["w"] = "noop",
            --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
            ["h"] = "close_node",
            -- ['C'] = 'close_all_subnodes',
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["a"] = {
              "add",
              -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none" -- "none", "relative", "absolute"
              }
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
            -- ["d"] = "noop",
            ["D"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            -- ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
            ["i"] = "show_file_details",
          }
        },
        nesting_rules = {},
        filesystem = {
          filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false, -- only works on Windows for hidden files/directories
            hide_by_name = {
              --"node_modules"
            },
            hide_by_pattern = { -- uses glob style patterns
              --"*.meta",
              --"*/src/*/tsconfig.json",
            },
            always_show = { -- remains visible even if other settings would normally hide it
              --".gitignored",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
              ".DS_Store",
              --"thumbs.db"
            },
            never_show_by_pattern = { -- uses glob style patterns
              --".null-ls_*",
            },
          },
          follow_current_file = {
            enabled = false,                      -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = false,              -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
          group_empty_dirs = false,               -- when true, empty folders will be grouped together
          hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
          -- hijack_netrw_behavior = "disabled", -- netrw disabled, opening a directory opens neo-tree
          -- hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
          -- in whatever position is specified in window.position
          -- "open_current",  -- netrw disabled, opening a directory opens within the
          -- window like netrw would, regardless of window.position
          -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
          use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
          -- instead of relying on nvim autocmd events.
          window = {
            mappings = {
              -- ["<bs>"] = "navigate_up",
              ["<bs>"] = "noop",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["/"] = "fuzzy_finder",
              ["F"] = "fuzzy_finder_directory",
              ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
              -- ["D"] = "fuzzy_sorter_directory",
              ["f"] = "filter_on_submit",
              -- ["<c-x>"] = "clear_filter",
              ["<c-y>"] = "clear_filter",
              ["<C-x>"] = "noop",
              -- ["<c-x>"] = "noop",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
              ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
              ["oc"] = { "order_by_created", nowait = false },
              ["od"] = { "order_by_diagnostics", nowait = false },
              ["og"] = { "order_by_git_status", nowait = false },
              ["om"] = { "order_by_modified", nowait = false },
              ["on"] = { "order_by_name", nowait = false },
              ["os"] = { "order_by_size", nowait = false },
              ["ot"] = { "order_by_type", nowait = false },
            },
            fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
              ["<down>"] = "move_cursor_down",
              -- ["<C-n>"] = "move_cursor_down",
              ["<C-j>"] = "move_cursor_down",
              ["<up>"] = "move_cursor_up",
              -- ["<C-p>"] = "move_cursor_up",
              ["<C-k>"] = "move_cursor_up",
            },
          },

          commands = {} -- Add a custom command or override a global one using the same function name
        },
        buffers = {
          follow_current_file = {
            enabled = true,          -- This will find and focus the file in the active buffer every time
            --              -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
          group_empty_dirs = true,   -- when true, empty folders will be grouped together
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
              ["oc"] = { "order_by_created", nowait = false },
              ["od"] = { "order_by_diagnostics", nowait = false },
              ["om"] = { "order_by_modified", nowait = false },
              ["on"] = { "order_by_name", nowait = false },
              ["os"] = { "order_by_size", nowait = false },
              ["ot"] = { "order_by_type", nowait = false },
            }
          },
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              ["A"]  = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
              ["o"]  = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
              ["oc"] = { "order_by_created", nowait = false },
              ["od"] = { "order_by_diagnostics", nowait = false },
              ["om"] = { "order_by_modified", nowait = false },
              ["on"] = { "order_by_name", nowait = false },
              ["os"] = { "order_by_size", nowait = false },
              ["ot"] = { "order_by_type", nowait = false },
            }
          }
        }
      })

      -- vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    end
  },
  -- {
  --   "kelly-lin/ranger.nvim",
  --   config = function()
  --     require("ranger-nvim").setup({ replace_netrw = true })
  --     vim.api.nvim_set_keymap("n", "<leader>ef", "", {
  --       noremap = true,
  --       callback = function()
  --         require("ranger-nvim").open(true)
  --       end,
  --     })
  --   end,
  -- },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 48,
        }
      })
    end
  },
  { "b0o/schemastore.nvim", },
  { "vifm/vifm.vim", },
  { "ray-x/lsp_signature.nvim", },
  { "andymass/vim-matchup", },
  { "HiPhish/nvim-ts-rainbow2", after = "nvim-treesitter", },
  {
    "phaazon/hop.nvim",
    branch = "v1",
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
  { "github/copilot.vim", },
  { 'tpope/vim-repeat', },
  {
    'kevinhwang91/nvim-bqf',
    config = function()
      require('bqf').setup({
        auto_enable = true,
        auto_resize_height = true, -- highly recommended enable
        preview = {
          auto_preview = false,
        }
      })
    end
  },

  { "nvim-treesitter/nvim-treesitter-context", },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  { "wellle/targets.vim", },
  { "0x100101/lab.nvim",                       build = "cd js && npm ci" },
  { "sindrets/diffview.nvim", },
  -- { "mogelbrod/vim-jsonpath" },
  -- { "akinsho/bufferline.nvim" },
  {
    'toppair/peek.nvim',
    build = 'deno task --quiet build:fast',
    config = function()
      -- default config:
      require('peek').setup({
        auto_load = true,        -- whether to automatically load preview when
        -- entering another markdown buffer
        close_on_bdelete = true, -- close preview window on buffer delete
        syntax = true,           -- enable syntax highlighting, affects performance
        theme = 'dark',          -- 'dark' or 'light'
        update_on_change = true,
        app = 'webview',         -- 'webview', 'browser', string or a table of strings
        -- explained below

        filetype = { 'markdown' }, -- list of filetypes to recognize as markdown
        -- relevant if update_on_change is true
        throttle_at = 200000,      -- start throttling when file exceeds this
        -- amount of bytes in size
        throttle_time = 'auto',    -- minimum amount of time in milliseconds
        -- that has to pass before starting new render
      })

      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end
  },
  { "lukas-reineke/indent-blankline.nvim", },
  -- {
  --   'https://codeberg.org/esensar/nvim-dev-container',
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' }
  -- },
  {
    'akinsho/git-conflict.nvim',
    version = "*",
  },
  { "nvim-lua/plenary.nvim", },
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-surround", },
  { "vim-scripts/ReplaceWithRegister", },
  -- { "nvim-tree/nvim-tree.lua", },
  { "nvim-tree/nvim-web-devicons", },
  -- { 'ryanoasis/vim-devicons' },
  { "nvim-lualine/lualine.nvim", },
  { "nvim-telescope/telescope-fzf-native.nvim",     build = "make", },
  { "nvim-telescope/telescope.nvim",                branch = "0.1.x", },
  { "nvim-telescope/telescope-live-grep-args.nvim", },
  { 'nvim-telescope/telescope-ui-select.nvim', },
  -- { 'nvim-telescope/telescope-media-files.nvim' },

  { "hrsh7th/nvim-cmp", },
  { "hrsh7th/cmp-buffer", },
  { "hrsh7th/cmp-path", },
  { "L3MON4D3/LuaSnip", },
  { "saadparwaiz1/cmp_luasnip", },
  { "rafamadriz/friendly-snippets", },
  { "williamboman/mason.nvim", },
  { "williamboman/mason-lspconfig.nvim", },

  { "neovim/nvim-lspconfig", },
  { "hrsh7th/cmp-nvim-lsp", },
  {
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('lspsaga').setup({
        -- keybinds for navigation in lspsaga window
        move_in_saga = { prev = "<C-k>", next = "<C-j>" },
        -- use enter to open file with finder
        finder_action_keys = {
          open = "<CR>",
        },
        lightbulb = {
          enable = false,
          enable_in_insert = true,
          sign = true,
          sign_priority = 40,
          virtual_text = false,
        },
        code_action = {
          num_shortcut = true,
          show_server_name = false,
          extend_gitsigns = true,
          keys = {
            -- string | table type
            quit = { 'q', '<ESC>' },
            exec = "<CR>",
          },
        },
        -- use enter to open file with definition preview
        definition_action_keys = {
          edit = "<CR>",
          exit = "<ESC>"
        },
        symbol_in_winbar = {
          enable = false,
          separator = '  ',
          hide_keyword = false,
          show_file = true,
          folder_level = 2,
          respect_root = false,
          color_mode = true,
          virtual_text = false
        },
        ui = {
          kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
        },
        symbols_in_winbar = {
          enable = false,
          sign = false,
          virtual_text = false
        },
        implement = {
          enable = false
        },
        outline = {
          detail = false,
          layout = 'float',
          max_height = 1,
          left_width = 0.4,
          keys = {
            quit = '<leader>q'
          }
        }
        -- ui = {
        --   -- currently only round theme
        --   theme = 'round',
        --   -- border type can be single,double,rounded,solid,shadow.
        --   border = 'single',
        --   winblend = 0,
        --   expand = '',
        --   collapse = '',
        --   preview = '',
        --   -- code_action = '',
        --   code_action = '💡',
        --   diagnostic = '🐞',
        --   -- diagnostic = '',
        --   incoming = ' ',
        --   outgoing = ' ',
        --   colors = {
        --     --float window normal bakcground color
        --     normal_bg = '#071b2e',
        --     --title background color
        --     title_bg = '#afd700',
        --     red = '#264F78',
        --     magenta = '#d1d4cf',
        --     orange = '#569CD6',
        --     yellow = '#DCDCAA',
        --     green = '#4f856a',
        --     cyan = '#36d0e0',
        --     blue = '#61afef',
        --     purple = '#CBA6F7',
        --     white = '#d1d4cf',
        --     -- black = '#1c1c19',
        --     black = '#071b2e'
        --   },
        --   kind = {},
        -- },
      })
    end
  },
  { "jose-elias-alvarez/typescript.nvim", },
  { "onsails/lspkind.nvim", },
  { "jose-elias-alvarez/null-ls.nvim", },
  { "jayp0521/mason-null-ls.nvim", },
  { "mfussenegger/nvim-dap", },
  -- {
  --   "mxsdev/nvim-dap-vscode-js",
  --   dependencies = { "mfussenegger/nvim-dap" },
  --   config = function()
  --     require("dap-vscode-js").setup({
  --       -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  --       -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  --       debugger_path = "/Users/jgarcia/.local/share/nvim/lazy/vscode-js-debug",
  --       -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  --       adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  --       -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  --       -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  --       -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
  --     })

  --     for _, language in ipairs({ "typescript", "javascript" }) do
  --       require("dap").configurations[language] = {
  --         {
  --           type = "pwa-node",
  --           request = "launch",
  --           name = "Launch file",
  --           program = "${file}",
  --           cwd = "${workspaceFolder}",
  --         },
  --         {
  --           type = "pwa-node",
  --           request = "attach",
  --           name = "Attach",
  --           processId = require 'dap.utils'.pick_process,
  --           cwd = "${workspaceFolder}",
  --         }
  --       }
  --     end
  --   end
  -- },
  -- {
  --   "microsoft/vscode-js-debug",
  --   build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  -- },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      require("dapui").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      -- { "elgiano/nvim-treesitter-angular" ,
      -- branch = "topic/jsx-fix" }
    },
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
  },

  { "windwp/nvim-autopairs", },
  { "windwp/nvim-ts-autotag",     after = "nvim-treesitter" },
  { 'lewis6991/gitsigns.nvim' },
  { 'tpope/vim-fugitive' },
  -- { 'Mofiqul/vscode.nvim' },
  { 'catppuccin/nvim',            dependencies = { "mg979/vim-visual-multi" } },
  { 'norcalli/nvim-colorizer.lua' },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        position = "right", -- position of the list can be: bottom, top, left, right
        height = 10, -- height of the trouble list when position is top or bottom
        width = 50, -- width of the list when position is left or right
        icons = true, -- use devicons for filenames
        mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
        fold_open = "", -- icon used for open folds
        fold_closed = "", -- icon used for closed folds
        group = true, -- group results by file
        padding = true, -- add an extra new line on top of the list
        action_keys = {
          -- key mappings for actions in the trouble list
          -- map to {} to remove a mapping, for example:
          -- close = {},
          close = "q",                     -- close the list
          cancel = "<esc>",                -- cancel the preview and get back to your last window / buffer / cursor
          refresh = "r",                   -- manually refresh
          jump = { "<cr>", "<tab>" },      -- jump to the diagnostic or open / close folds
          open_split = { "<c-x>" },        -- open buffer in new split
          open_vsplit = { "<c-v>" },       -- open buffer in new vsplit
          open_tab = { "<c-t>" },          -- open buffer in new tab
          jump_close = { "o" },            -- jump to the diagnostic and close the list
          toggle_mode = "m",               -- toggle between "workspace" and "document" diagnostics mode
          toggle_preview = "P",            -- toggle auto_preview
          hover = "K",                     -- opens a small popup with the full multiline message
          preview = "p",                   -- preview the diagnostic location
          close_folds = { "zM", "zm" },    -- close all folds
          open_folds = { "zR", "zr" },     -- open all folds
          toggle_fold = { "zA", "za" },    -- toggle fold of current file
          previous = "k",                  -- previous item
          next = "j"                       -- next item
        },
        indent_lines = true,               -- add an indent guide below the fold icons
        auto_open = false,                 -- automatically open the list when you have diagnostics
        auto_close = false,                -- automatically close the list when you have no diagnostics
        auto_preview = true,               -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
        auto_fold = false,                 -- automatically fold a file trouble list at creation
        auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
        signs = {
          -- icons / text used for a diagnostic
          -- error = "",
          error = "",
          -- warning = "",
          warning = "",
          -- hint = "",
          hint = "󰠠",
          information = "",
          -- information = "",
          other = "﫠"
        },
        use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
      }
    end
  },
  -- { "akinsho/toggleterm.nvim", version = '*' },
  -- {
  --   'axkirillov/hbac.nvim',
  --   config = function()
  --     require("hbac").setup({
  --       autoclose                  = true, -- set autoclose to false if you want to close manually
  --       threshold                  = 10,   -- hbac will start closing unedited buffers once that number is reached
  --       close_command              = function(bufnr)
  --         vim.api.nvim_buf_delete(bufnr, {})
  --       end,
  --       close_buffers_with_windows = true, -- hbac will close buffers with associated windows if this option is `true`
  --       telescope                  = {
  --         mappings = {
  --           n = {
  --             close_unpinned = "<M-c>",
  --             delete_buffer = "<C-z>",
  --             pin_all = "<M-a>",
  --             unpin_all = "<M-u>",
  --             toggle_selections = "<M-y>",
  --           },
  --           i = {
  --             -- as above
  --           },
  --         },
  --         -- Pinned/unpinned icons and their hl groups. Defaults to nerdfont icons
  --         pin_icons = {
  --           pinned = { "󰐃 ", hl = "DiagnosticOk" },
  --           unpinned = { "󰤱 ", hl = "DiagnosticError" },
  --         },
  --       },
  --     })
  --   end
  -- },
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require 'hlslens'.setup(
        {
          auto_enable = true,
          nearest_only = true,
          nearest_float_when = 'never',
          calm_down = true
        }
      )
    end
  },
  -- { 'stevearc/oil.nvim' },
  {
    '3rd/image.nvim',
    rocks = { "magick" },
    config = function()
      -- default config
      require("image").setup({
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = true,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "norg" },
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = true,                                      -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        editor_only_render_when_focused = false,                                  -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = false,                                  -- auto show/hide images in the correct Tmux window (needs visual-activity off)
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
      })
    end
  },


  {
    'Weissle/persistent-breakpoints.nvim',
    config = function()
      require('persistent-breakpoints').setup {
        save_dir = vim.fn.stdpath('data') .. '/nvim_checkpoints',
        -- when to load the breakpoints? "BufReadPost" is recommanded.
        load_breakpoints_event = { "BufReadPost" },
        -- record the performance of different function. run :lua require('persistent-breakpoints.api').print_perf_data() to see the result.
        perf_record = false,
      }
    end
  },

  {
    'yorickpeterse/nvim-pqf',
    config = function()
      require('pqf').setup({
        signs = {
          error = '',
          warning = '',
          info = '',
          hint = "󰠠",
        },
        show_multiple_lines = false
      })
    end
  },

  -- use {
  --   'AckslD/nvim-trevJ.lua',
  --   config = 'require("trevj").setup()',  -- optional call for configurating non-default filetypes etc
  --
  --   -- uncomment if you want to lazy load
  --   -- module = 'trevj',
  --
  --   -- an example for configuring a keybind, can also be done by filetype
  --   -- setup = function()
  --   --   vim.keymap.set('n', '<leader>j', function()
  --   --     require('trevj').format_at_cursor()
  --   --   end)
  --   -- end,
  -- }

  {
    'j-hui/fidget.nvim',
    tag = "legacy",
    config = function()
      require "fidget".setup {
        window = {
          blend = 0
        }
      }
    end
  },
  { 'tpope/vim-dispatch' },
  {
    'mg979/vim-visual-multi',
    config = function()
      vim.cmd([[highlight! VM_Mono guibg=#004b72]])
      vim.cmd([[highlight! VM_Extend guibg=#004b72]])
      vim.g.VM_Mono_hl = 'Visual'
      vim.g.VM_Mono = 'Visual'
      vim.g.VM_Extend = 'Visual'
      vim.g.VM_Extend_hl = 'Visual'
      vim.g.VM_Insert_hl = 'Visual'
    end
  },
  { "petertriho/nvim-scrollbar" },
  { "kkharji/sqlite.lua" },
  { "nvim-telescope/telescope-smart-history.nvim" },
  {
    'Equilibris/nx.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require("nx").setup {
        nx_cmd_root = 'nx',

        -- Command running capabilities,
        -- see nx.m.command-runners for more details
        command_runner = require('nx.command-runners').terminal_cmd(),
        -- Form rendering capabilities,
        -- see nx.m.form-renderers for more detials
        form_renderer = require('nx.form-renderers').telescope(),

        -- Whether or not to load nx configuration,
        -- see nx.loading-and-reloading for more details
        read_init = false
      }
    end
  },
  {
    "LunarVim/bigfile.nvim",
    config = function()
      -- default config
      require("bigfile").setup {
        filesize = 3, -- size of the file in MiB, the plugin round file sizes to the closest MiB
        -- pattern = function(bufnr, filesize_mib)
        --   -- you can't use `nvim_buf_line_count` because this runs on BufReadPre
        --   local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
        --   local file_length = #file_contents
        --   local filetype = vim.filetype.match({ buf = bufnr })
        --   if file_length > 5000 then
        --     return true
        --   end
        -- end,
        features = { -- features to disable
          "indent_blankline",
          "illuminate",
          "lsp",
          "treesitter",
          "syntax",
          "matchparen",
          "vimopts",
          "filetype",
        },
      }
    end
  },
  {
    "lucastavaresa/SingleComment.nvim",
    -- keybindings = { { { "n", "v" }, "gcc" }, { "n", "gca" } },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "JoosepAlviste/nvim-ts-context-commentstring"
    },
    config = function()
      vim.keymap.set(
        "n",
        "gcc",
        require("SingleComment").SingleComment,
        { expr = true }
      )
      vim.keymap.set("v", "gcc", require("SingleComment").Comment, {})
      vim.keymap.set("n", "gca", require("SingleComment").ToggleCommentAhead, {})
      vim.keymap.set("n", "gcA", require("SingleComment").CommentAhead, {})
      vim.keymap.set({ "n", "v" }, "gcb", require("SingleComment").BlockComment)
    end
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },
  {
    "fdschmidt93/telescope-egrepify.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

  },
  { 'dyng/ctrlsf.vim',  branch = "feature/add-devicon" },
  -- { "folke/neodev.nvim", opts = {} },
  {
    "LiadOz/nvim-dap-repl-highlights",
    config = function()
      require('nvim-dap-repl-highlights').setup()
    end
  },
  { 'junegunn/fzf',     build = "./install --all", },
  { 'junegunn/fzf.vim', },
  {
    dir = 'gabrielpoca/replacer.nvim',
    opts = { rename_files = false },
    keys = {
      {
        '<leader>hH',
        function() require('replacer').run() end,
        desc = "run replacer.nvim"
      }
    }
  },
  { 'sindrets/winshift.nvim', },
  -- {
  --   'https://codeberg.org/esensar/nvim-dev-container',
  --   config = function()
  --     require("devcontainer").setup {
  --     }
  --   end
  -- },
  -- { 'jamestthompson3/nvim-remote-containers' }

  -- { "dhruvasagar/vim-zoom" }
  -- { "troydm/zoomwintab.vim" },
  -- {
  --   "b0o/incline.nvim",
  -- },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = false
      },
      messages = {
        enabled = false
      },
      popupmenu = {
        enabled = false
      },
      notify = {
        enabled = false
      },
      lsp = {
        signature = {
          enabled = false
        },
        message = {
          enabled = false
        },
        progress = {
          enabled = false
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    'stsewd/fzf-checkout.vim',

  },
  -- {
  --   'm00qek/baleia.nvim', tag = 'v1.3.0',
  --   config = function ()
  --     vim.cmd([[ let s:baleia = luaeval("require('baleia').setup { }")]])
  --     vim.cmd([[command! BaleiaColorize call s:baleia.once(bufnr('%')) ]])
  --   end
  -- },
  {
    -- 'ekickx/clipboard-image.nvim'
    -- fork
    'dfendr/clipboard-image.nvim',

  },
  -- {
  --   'mikesmithgh/kitty-scrollback.nvim',
  --   enabled = true,
  --   ,
  --   cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
  --   event = { 'User KittyScrollbackLaunch' },
  --   -- version = '*', -- latest stable version, may have breaking changes if major version changed
  --   -- version = '^2.0.0', -- pin major version, include fixes and features that do not have breaking changes
  --   config = function()
  --     require('kitty-scrollback').setup()
  --   end,
  -- }
  -- { "EdenEast/nightfox.nvim" } -- lazy
})
