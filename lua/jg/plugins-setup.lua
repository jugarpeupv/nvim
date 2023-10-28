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
  { "b0o/schemastore.nvim" },
  { "vifm/vifm.vim" },
  { "ray-x/lsp_signature.nvim" },
  { "andymass/vim-matchup" },
  { "HiPhish/nvim-ts-rainbow2", after = "nvim-treesitter" },
  {
    "phaazon/hop.nvim",
    branch = "v1",
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
  { "github/copilot.vim" },
  { 'tpope/vim-repeat' },
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
      require('bqf').setup({
        auto_enable = true,
        auto_resize_height = true, -- highly recommended enable
        preview = {
          auto_preview = false,
        },
      })
    end
  },

  { "nvim-treesitter/nvim-treesitter-context" },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  { "wellle/targets.vim" },
  { "0x100101/lab.nvim", build = "cd js && npm ci" },
  { "sindrets/diffview.nvim" },
  { "mogelbrod/vim-jsonpath" },
  { "akinsho/bufferline.nvim" },
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
  { "lukas-reineke/indent-blankline.nvim" },
  {
    'https://codeberg.org/esensar/nvim-dev-container',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  },
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function()
      require('git-conflict').setup({
        -- default_mappings = true,    -- disable buffer local mapping created by this plugin
        default_mappings = false,
        -- default_mappings = {
        --   ours = 'o',
        --   theirs = 't',
        --   none = '0',
        --   both = 'b',
        --   next = 'n',
        --   prev = 'p',
        -- },
        disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
        highlights = {
          -- They must have background color, otherwise the default color will be used
          incoming = 'DiffText',
          current = 'DiffAdd',
        }
      })
    end
  },
  { "nvim-lua/plenary.nvim" },
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-surround" },
  { "vim-scripts/ReplaceWithRegister" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-tree/nvim-web-devicons" },
  { 'ryanoasis/vim-devicons' },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
  { "nvim-telescope/telescope.nvim",               branch = "0.1.x" },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'nvim-telescope/telescope-media-files.nvim' },

  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
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
  { "jose-elias-alvarez/typescript.nvim" },
  { "onsails/lspkind.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "jayp0521/mason-null-ls.nvim" },

  { "mfussenegger/nvim-dap" },
  { 'rcarriga/nvim-dap-ui',              dependencies = { 'mfussenegger/nvim-dap' } },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
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

  { "windwp/nvim-autopairs" },
  { "windwp/nvim-ts-autotag",     after = "nvim-treesitter" },
  { 'lewis6991/gitsigns.nvim' },
  { 'tpope/vim-fugitive' },
  { 'Mofiqul/vscode.nvim' },
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
  { "akinsho/toggleterm.nvim", version = '*' },
  {
    'axkirillov/hbac.nvim',
    config = function()
      require("hbac").setup({
        autoclose                  = true, -- set autoclose to false if you want to close manually
        threshold                  = 15,   -- hbac will start closing unedited buffers once that number is reached
        close_command              = function(bufnr)
          vim.api.nvim_buf_delete(bufnr, {})
        end,
        close_buffers_with_windows = true, -- hbac will close buffers with associated windows if this option is `true`
        telescope                  = {
          mappings = {
            n = {
              close_unpinned = "<M-c>",
              delete_buffer = "<C-z>",
              pin_all = "<M-a>",
              unpin_all = "<M-u>",
              toggle_selections = "<M-y>",
            },
            i = {
              -- as above
            },
          },
          -- Pinned/unpinned icons and their hl groups. Defaults to nerdfont icons
          pin_icons = {
            pinned = { "󰐃 ", hl = "DiagnosticOk" },
            unpinned = { "󰤱 ", hl = "DiagnosticError" },
          },
        },
      })
    end
  },
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
  { 'stevearc/oil.nvim' },
  {
    '3rd/image.nvim',
    config = function()
      -- default config
      require("image").setup({
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
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
        window_overlap_clear_enabled = false,                                     -- toggles images when windows are overlapped
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
        load_breakpoints_event = nil,
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
        pattern = function(bufnr, filesize_mib)
          -- you can't use `nvim_buf_line_count` because this runs on BufReadPre
          local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
          local file_length = #file_contents
          local filetype = vim.filetype.match({ buf = bufnr })
          if file_length > 5000 then
            return true
          end
        end,
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
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  { 'dyng/ctrlsf.vim' }

})
