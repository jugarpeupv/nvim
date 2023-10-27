-- auto install packer if not installedplug
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  -- utilities
  use {
    'dhruvmanila/browser-bookmarks.nvim',
    tag = '*',
    requires = {
      'kkharji/sqlite.lua',
      'nvim-telescope/telescope.nvim',
    }
  }

  use({
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({ replace_netrw = true })
      vim.api.nvim_set_keymap("n", "<leader>ef", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })
    end,
  })

  use({
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 48,
        }
      })
    end
  })
  -- use({ 'kazhala/close-buffers.nvim' })
  use({ "b0o/schemastore.nvim" })
  use({ "vifm/vifm.vim" })
  use({ "ray-x/lsp_signature.nvim" })
  use({ "andymass/vim-matchup" })
  -- use({ "HiPhish/nvim-ts-rainbow2", after = "nvim-treesitter" })
  use({ "lewis6991/impatient.nvim" })
  use({
    "phaazon/hop.nvim",
    branch = "v1",
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  })

  use({ "github/copilot.vim" })

  use { 'tpope/vim-repeat' }
  use({
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
  })

  use({ "nvim-treesitter/nvim-treesitter-context" })
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({ "wellle/targets.vim" })
  use({ "0x100101/lab.nvim", run = "cd js && npm ci" })
  use({ "sindrets/diffview.nvim" })
  use({ "mogelbrod/vim-jsonpath" })
  use({ "akinsho/bufferline.nvim" })
  -- use({
  --   "iamcco/markdown-preview.nvim",
  --   run = "cd app && npm install",
  --   setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
  --   ft = { "markdown" },
  -- })
  use({
    'toppair/peek.nvim',
    run = 'deno task --quiet build:fast',
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
  })

  -- use { "lukas-reineke/indent-blankline.nvim", commit = "6061c085417e22f1706c04ceb1cf59bf80d44993" }
  use { "lukas-reineke/indent-blankline.nvim" }

  use {
    'https://codeberg.org/esensar/nvim-dev-container',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  -- use({
  --   "RRethy/vim-illuminate",
  --   config = function()
  --     -- default configuration
  --     require('illuminate').configure({
  --       -- providers: provider used to get references in the buffer, ordered by priority
  --       providers = {
  --         'lsp',
  --         'treesitter',
  --         'regex',
  --       },
  --       -- delay: delay in milliseconds
  --       delay = 100,
  --       -- filetype_overrides: filetype specific overrides.
  --       -- The keys are strings to represent the filetype while the values are tables that
  --       -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
  --       filetype_overrides = {},
  --       -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
  --       filetypes_denylist = {
  --         'dirvish',
  --         'help',
  --         'dashboard',
  --         'fugitive',
  --         'diffview',
  --         'NvimTree',
  --         'startify',
  --         'dashboard',
  --         'packer',
  --         'neogitstatus',
  --         'Trouble',
  --         'alpha',
  --         'lir',
  --         'Outline',
  --         'spectre_panel',
  --         'toggleterm',
  --         'qf',
  --         'telescope',
  --         'TelescopePrompt'
  --       },
  --       -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
  --       filetypes_allowlist = {},
  --       -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
  --       -- See `:help mode()` for possible values
  --       modes_denylist = {},
  --       -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
  --       -- See `:help mode()` for possible values
  --       modes_allowlist = {},
  --       -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
  --       -- Only applies to the 'regex' provider
  --       -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  --       providers_regex_syntax_denylist = {},
  --       -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
  --       -- Only applies to the 'regex' provider
  --       -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
  --       providers_regex_syntax_allowlist = {},
  --       -- under_cursor: whether or not to illuminate under the cursor
  --       under_cursor = true,
  --       -- large_file_cutoff: number of lines at which to use large_file_config
  --       -- The `under_cursor` option is disabled when this cutoff is hit
  --       large_file_cutoff = nil,
  --       -- large_file_config: config to use for large files (based on large_file_cutoff).
  --       -- Supports the same keys passed to .configure
  --       -- If nil, vim-illuminate will be disabled for large files.
  --       large_file_overrides = nil,
  --       -- min_count_to_highlight: minimum number of matches required to perform highlighting
  --       min_count_to_highlight = 1,
  --     })
  --   end
  -- })
  --
  --
  -- use({'jamestthompson3/nvim-remote-containers'})

  use { 'akinsho/git-conflict.nvim', tag = "*", config = function()
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
  end }

  -- Lua
  -- use {
  --     "narutoxy/silicon.lua",
  --     requires = { "nvim-lua/plenary.nvim" },
  --     config = function()
  --       require('silicon').setup({})
  --     end
  -- }

  -- Again
  use("nvim-lua/plenary.nvim")          -- lua functions that many plugins use

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation



  -- essential plugins
  use("tpope/vim-surround")              -- add, delete, change surroundings (it's awesome)
  use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  --[[ use({ "numToStr/Comment.nvim" }) ]]

  -- -- file explorer
  use({ "nvim-tree/nvim-tree.lua" })
  --
  -- vs-code like icons
  use({ "nvim-tree/nvim-web-devicons" })

  use({ 'ryanoasis/vim-devicons' })

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })        -- fuzzy finder
  use({ "nvim-telescope/telescope-live-grep-args.nvim" })
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-telescope/telescope-media-files.nvim' }

  -- use { 'junegunn/fzf', run = function()
  --   vim.fn['fzf#install']()
  -- end
  -- }

  -- autocompletion
  use("hrsh7th/nvim-cmp")   -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path")   -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip")             -- snippet engine
  use("saadparwaiz1/cmp_luasnip")     -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim")           -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig


  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp")  -- for autocompletion
  -- use({
  --   "lvimuser/lsp-inlayhints.nvim",
  --   config = function()
  --     require("lsp-inlayhints").setup()
  --   end
  -- })
  -- use({ "nvimdev/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis

  -- use({
  --   'simrat39/inlay-hints.nvim',
  --   config = function()
  --     require("inlay-hints").setup({
  --       only_current_line = true,
  --
  --       eol = {
  --         right_align = true,
  --       }
  --     })
  --   end
  -- })

  use({
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
  })
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim")               -- vs-code like icons for autocompletion

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim")     -- bridges gap b/w mason & null-ls

  use { "mfussenegger/nvim-dap" }
  -- use { "jay-babu/mason-nvim-dap.nvim" }
  use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
  -- use {
  --   "microsoft/vscode-js-debug",
  --   opt = true,
  --   run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  -- }

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })

  use({
    'JoosepAlviste/nvim-ts-context-commentstring',
  })

  use {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
  }

  -- auto closing
  use("windwp/nvim-autopairs")                                 -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
  use({ 'tpope/vim-fugitive' })
  -- use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- use {
  --   'yamatsum/nvim-nonicons',
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  --[[ use('nvim-treesitter/playground') ]]

  -- colorscheme
  use({ 'Mofiqul/vscode.nvim' })
  --[[ use({ 'folke/tokyonight.nvim' }) ]]
  use({ 'catppuccin/nvim', requires = { "mg979/vim-visual-multi" } })
  use({ 'norcalli/nvim-colorizer.lua' })
  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
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
  }

  use({ "akinsho/toggleterm.nvim", tag = '*' })

  -- use({ "MunifTanjim/nui.nvim" })

  -- use({ "Bryley/neoai.nvim" })

  -- use {
  --   'Equilibris/nx.nvim',
  --   requires = {
  --     'nvim-telescope/telescope.nvim',
  --   },
  --   config = function()
  --     require('nx').setup {
  --       -- Base command to run all other nx commands, some other values may be:
  --       -- - `npm nx`
  --       -- - `yarn nx`
  --       -- - `pnpm nx`
  --       nx_cmd_root = 'nx',
  --
  --       -- Command running capabilities,
  --       -- see nx.m.command-runners for more details
  --       command_runner = require('nx.command-runners').terminal_cmd(),
  --       -- Form rendering capabilities,
  --       -- see nx.m.form-renderers for more detials
  --       form_renderer = require('nx.form-renderers').telescope(),
  --
  --       -- Whether or not to load nx configuration,
  --       -- see nx.loading-and-reloading for more details
  --       read_init = true,
  --     }
  --   end
  -- }
  -- -- use { 'edluffy/hologram.nvim', config = function()
  -- --   require('hologram').setup {
  -- --     auto_display = true -- WIP automatic markdown image display, may be prone to breaking
  -- --   }
  -- -- end }
  --
  -- use { "catppuccin/nvim", as = "catppuccin" }
  -- -- use({ 'mg979/vim-visual-multi' })
  --
  --
  --[[ use { "dhruvasagar/vim-zoom" } ]]
  --[[ use("szw/vim-maximizer") -- maximizes and restores current window ]]

  -- use({
  --   "utilyre/barbecue.nvim",
  --   tag = "*",
  --   requires = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons", -- optional dependency
  --   },
  --   after = "nvim-web-devicons",     -- keep this if you're using NvChad
  --   config = function()
  --     require('barbecue').setup(
  --       {
  --         exclude_filetypes = {
  --           "netrw",
  --           "toggleterm",
  --           "NvimTree",
  --           "Diff",
  --           "diffview",
  --           'dirvish',
  --           'help',
  --           'dashboard',
  --           'fugitive',
  --           'diffview',
  --           'NvimTree',
  --           'startify',
  --           'dashboard',
  --           'packer',
  --           'neogitstatus',
  --           'Trouble',
  --           'alpha',
  --           'lir',
  --           'Outline',
  --           'spectre_panel',
  --           'toggleterm',
  --           'qf',
  --         },
  --         show_dirname = true,
  --         show_basename = true,
  --         theme = {
  --           -- -- this highlight is used to override other highlights
  --           -- -- you can take advantage of its `bg` and set a background throughout your winbar
  --           -- -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
  --           -- normal = { fg = "#c0caf5" },
  --           --
  --           -- -- these highlights correspond to symbols table from config
  --           -- ellipsis = { fg = "#737aa2" },
  --           -- separator = { fg = "#737aa2" },
  --           -- modified = { fg = "#737aa2" },
  --           --
  --           -- these highlights represent the _text_ of three main parts of barbecue
  --           dirname = { fg = "#7f849c" },
  --           basename = { bold = true },
  --           context = {},
  --
  --         },
  --       }
  --     )
  --   end
  --
  -- })
  -- -- use {'stevearc/dressing.nvim'}
  -- -- If you are using Packer
  -- -- use 'shaunsingh/nord.nvim'
  -- use {
  --   "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
  --   event = "TermOpen",
  --   requires = {
  --     "akinsho/nvim-toggleterm.lua",
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-lua/popup.nvim",
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = function()
  --     require("telescope").load_extension "toggleterm"
  --     require("telescope-toggleterm").setup {
  --       telescope_mappings = {
  --         -- <ctrl-c> : kill the terminal buffer (default) .
  --         ["<C-c>"] = require("telescope-toggleterm").actions.exit_terminal,
  --       },
  --     }
  --   end,
  -- }
  use { 'axkirillov/hbac.nvim', config = function()
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
  end }


  use({
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
  })

  use { 'stevearc/oil.nvim' }
  -- use {
  --   "princejoogie/chafa.nvim",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "m00qek/baleia.nvim"
  --   },
  --   config = function()
  --     require("chafa").setup({
  --       render = {
  --         min_padding = 5,
  --         show_label = true,
  --       },
  --       events = {
  --         update_on_nvim_resize = true,
  --       },
  --     })
  --   end
  -- }
  use { 'edluffy/hologram.nvim', config = function()
    require('hologram').setup({
      auto_display = false
    })
  end
  }
  -- use {
  --   'edluffy/hologram.nvim',
  --   config = function()
  --     require("hologram").setup()
  --   end,

  --   rocks = { "magick" },
  -- }
  -- use {
  --   'samodostal/image.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   },
  -- }
  -- use { 'm00qek/baleia.nvim', tag = 'v1.3.0' }

  -- use { 'adelarsq/image_preview.nvim', config = function()
  --   require("image_preview").setup({})
  -- end }

  use({
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
  })


  use { 'Weissle/persistent-breakpoints.nvim', config = function()
    require('persistent-breakpoints').setup {
      save_dir = vim.fn.stdpath('data') .. '/nvim_checkpoints',
      -- when to load the breakpoints? "BufReadPost" is recommanded.
      load_breakpoints_event = nil,
      -- record the performance of different function. run :lua require('persistent-breakpoints.api').print_perf_data() to see the result.
      perf_record = false,
    }
  end }

  use { 'yorickpeterse/nvim-pqf', config = function()
    require('pqf').setup({
      signs = {
        error = '',
        warning = '',
        info = '',
        hint = "󰠠",
      },
      show_multiple_lines = false
    })
  end }

  -- use {
  --   'tanvirtin/vgit.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   }
  -- }

  -- use({ "petertriho/nvim-scrollbar", })

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

  -- use { 'j-hui/fidget.nvim', config = function()
  --   require "fidget".setup {
  --     window = {
  --       blend = 0
  --     }
  --   }
  -- end }
  use { 'tpope/vim-dispatch' }
  --[[ use { 'michaelb/sniprun', run = 'sh ./install.sh' } ]]
  -- use { 'michaelb/sniprun', run = 'sh ./install.sh'}
  use { 'mg979/vim-visual-multi', config = function()
    vim.cmd([[highlight! VM_Mono guibg=#004b72]])
  end }

  -- use { 'dburian/cmp-markdown-link' }
  --[[ use { 'nvim-telescope/telescope-node-modules.nvim' } ]]
  -- use {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --   }
  -- }
  -- use { 'echasnovski/mini.nvim' }

  use({
    "petertriho/nvim-scrollbar",
  })
  -- use { 'echasnovski/mini.files', config = function()
  --   require('mini.files').setup()
  -- end }
  use { "kkharji/sqlite.lua" }
  use { "nvim-telescope/telescope-smart-history.nvim" }
  use {
    'Equilibris/nx.nvim',
    requires = {
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
  }
  -- packer example:
  use {
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
  }
  use { 'joeveiga/ng.nvim' }

  use({ 'ckipp01/nvim-jenkinsfile-linter', requires = { "nvim-lua/plenary.nvim" } })
  --[[ use ({'gennaro-tedesco/nvim-commaround'}) ]]
  use {
    "lucastavaresa/SingleComment.nvim",
    keybindings = { { { "n", "v" }, "gcc" }, { "n", "gca" } },
    requires = {
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
  }

  -- use { 'stevearc/dressing.nvim', config = function()
  --   require("dressing").setup({
  --     input = {
  --       -- Set to false to disable the vim.ui.input implementation
  --       enabled = true,

  --       -- Default prompt string
  --       default_prompt = "Input:",

  --       -- Can be 'left', 'right', or 'center'
  --       title_pos = "left",

  --       -- When true, <Esc> will close the modal
  --       insert_only = true,

  --       -- When true, input will start in insert mode.
  --       start_in_insert = true,

  --       -- These are passed to nvim_open_win
  --       border = "rounded",
  --       -- 'editor' and 'win' will default to being centered
  --       relative = "cursor",

  --       -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
  --       prefer_width = 40,
  --       width = nil,
  --       -- min_width and max_width can be a list of mixed types.
  --       -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
  --       max_width = { 140, 0.9 },
  --       min_width = { 20, 0.2 },

  --       buf_options = {},
  --       win_options = {
  --         -- Disable line wrapping
  --         wrap = false,
  --         -- Indicator for when text exceeds window
  --         list = true,
  --         listchars = "precedes:…,extends:…",
  --         -- Increase this for more context when text scrolls off the window
  --         sidescrolloff = 0,
  --       },

  --       -- Set to `false` to disable
  --       mappings = {
  --         n = {
  --           ["<Esc>"] = "Close",
  --           ["<CR>"] = "Confirm",
  --         },
  --         i = {
  --           ["<C-c>"] = "Close",
  --           ["<CR>"] = "Confirm",
  --           ["<Up>"] = "HistoryPrev",
  --           ["<Down>"] = "HistoryNext",
  --         },
  --       },

  --       override = function(conf)
  --         -- This is the config that will be passed to nvim_open_win.
  --         -- Change values here to customize the layout
  --         return conf
  --       end,

  --       -- see :help dressing_get_config
  --       get_config = nil,
  --     },
  --     select = {
  --       -- Set to false to disable the vim.ui.select implementation
  --       enabled = true,

  --       -- Priority list of preferred vim.select implementations
  --       backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

  --       -- Trim trailing `:` from prompt
  --       trim_prompt = true,

  --       -- Options for telescope selector
  --       -- These are passed into the telescope picker directly. Can be used like:
  --       -- telescope = require('telescope.themes').get_ivy({...})
  --       telescope = nil,

  --       -- Options for fzf selector
  --       fzf = {
  --         window = {
  --           width = 0.5,
  --           height = 0.4,
  --         },
  --       },

  --       -- Options for fzf-lua
  --       fzf_lua = {
  --         -- winopts = {
  --         --   height = 0.5,
  --         --   width = 0.5,
  --         -- },
  --       },

  --       -- Options for nui Menu
  --       nui = {
  --         position = "50%",
  --         size = nil,
  --         relative = "editor",
  --         border = {
  --           style = "rounded",
  --         },
  --         buf_options = {
  --           swapfile = false,
  --           filetype = "DressingSelect",
  --         },
  --         win_options = {
  --           winblend = 0,
  --         },
  --         max_width = 80,
  --         max_height = 40,
  --         min_width = 40,
  --         min_height = 10,
  --       },

  --       -- Options for built-in selector
  --       builtin = {
  --         -- Display numbers for options and set up keymaps
  --         show_numbers = true,
  --         -- These are passed to nvim_open_win
  --         border = "rounded",
  --         -- 'editor' and 'win' will default to being centered
  --         relative = "editor",

  --         buf_options = {},
  --         win_options = {
  --           cursorline = true,
  --           cursorlineopt = "both",
  --         },

  --         -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
  --         -- the min_ and max_ options can be a list of mixed types.
  --         -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
  --         width = nil,
  --         max_width = { 140, 0.8 },
  --         min_width = { 40, 0.2 },
  --         height = nil,
  --         max_height = 0.9,
  --         min_height = { 10, 0.2 },

  --         -- Set to `false` to disable
  --         mappings = {
  --           ["<Esc>"] = "Close",
  --           ["<C-c>"] = "Close",
  --           ["<CR>"] = "Confirm",
  --         },

  --         override = function(conf)
  --           -- This is the config that will be passed to nvim_open_win.
  --           -- Change values here to customize the layout
  --           return conf
  --         end,
  --       },

  --       -- Used to override format_item. See :help dressing-format
  --       format_item_override = {},

  --       -- see :help dressing_get_config
  --       get_config = nil,
  --     },
  --   })
  -- end }

  -- lazy.nvim
  -- use {
  --   "folke/noice.nvim",
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- }

  use({
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  })



  if packer_bootstrap then
    require("packer").sync()
  end
end)
