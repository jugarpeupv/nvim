return {
  {
    "toppair/peek.nvim",
    -- event = "VeryLazy",
    keys = { "<leader>po", "<leader>pc" },
    build = "deno task --quiet build:fast",
    config = function()
      -- default config:
      require("peek").setup({
        auto_load = true,    -- whether to automatically load preview when
        -- entering another markdown buffer
        close_on_bdelete = true, -- close preview window on buffer delete
        syntax = true,       -- enable syntax highlighting, affects performance
        theme = "dark",      -- 'dark' or 'light'
        update_on_change = true,
        app = "webview",     -- 'webview', 'browser', string or a table of strings
        -- explained below

        filetype = { "markdown" }, -- list of filetypes to recognize as markdown
        -- relevant if update_on_change is true
        throttle_at = 200000,  -- start throttling when file exceeds this
        -- amount of bytes in size
        throttle_time = "auto", -- minimum amount of time in milliseconds
        -- that has to pass before starting new render
      })

      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

      keymap("n", "<Leader>po", "<cmd>PeekOpen<cr>", opts)
      keymap("n", "<Leader>pc", "<cmd>PeekClose<cr>", opts)
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    after = "nvim-treesitter",
    event = "VeryLazy",
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        -- strategy = {
        --   [""] = rainbow_delimiters.strategy["global"],
        --   vim = rainbow_delimiters.strategy["local"],
        -- },
        -- query = {

        --   [""] = "rainbow-delimiters",
        --   lua = "rainbow-blocks",
        -- },
        -- priority = {
        --   [""] = 110,
        --   lua = 210,
        -- },
        highlight = {
          "TSRainbowRed",
          "TSRainbowYellow",
          "TSRainbowBlue",
          "TSRainbowOrange",
          "TSRainbowGreen",
          "TSRainbowViolet",
          "TSRainbowCyan",
        },
      }
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    after = "nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require("lspsaga").setup({
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
            quit = { "q", "<ESC>" },
            exec = "<CR>",
          },
        },
        -- use enter to open file with definition preview
        definition_action_keys = {
          edit = "<CR>",
          exit = "<ESC>",
        },
        symbol_in_winbar = {
          enable = false,
          separator = "  ",
          hide_keyword = false,
          show_file = true,
          folder_level = 2,
          respect_root = false,
          color_mode = true,
          virtual_text = false,
        },
        -- ui = {
        --   kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
        -- },
        symbols_in_winbar = {
          enable = false,
          sign = false,
          virtual_text = false,
        },
        implement = {
          enable = false,
        },
        outline = {
          detail = false,
          layout = "float",
          max_height = 1,
          left_width = 0.4,
          keys = {
            quit = "<leader>q",
          },
        },
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
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "User FilePost",
    config = function()
      -- require("indent_blankline").setup {
      --   -- char = '┊',
      --   space_char_blankline = " ",
      --   show_trailing_blankline_indent = false,
      --   -- use_treesitter = true,
      --   -- use_treesitter_scope = true,
      --   show_end_of_line = true,
      --   show_current_context = true,
      --   -- show_current_context_start = true,
      -- }

      require("ibl").setup({
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
          injected_languages = true,
          -- highlight = { "Function", "Label" },
          -- char = "|",
          -- char = "┋",
          char = "▏",
          -- char = "│",
          -- char = "▕",
          priority = 500,
        },
        indent = {
          char = "▏",
          -- tab_char = ">"
          tab_char = "",
          repeat_linebreak = true,
          -- tab_char = "┋"
          -- tab_char = { "a", "b", "c" },
          -- char = "┋"
        },
        whitespace = { remove_blankline_trail = false },
        exclude = {
          filetypes = { "dashboard" },
          buftypes = { "terminal" },
        },
      })

      -- vim.opt.list = true
      -- vim.opt.listchars = "eol:↵,trail:·,tab:  "
      -- vim.opt.listchars = "eol:↵,trail:·,tab:  "
      -- vim.opt.listchars = "trail:·,tab: >>"
      -- vim.cmd[[set listchars=trail:·,precedes:«,extends:»,tab:▸\]]
      -- vim.opt.listchars = "trail:·,tab: "
      -- vim.opt.listchars = "trail:·,tab: ,space:⋅ "
      -- vim.opt.listchars = "space:⋅,tab: "

      -- require("indent_blankline").setup {
      --   -- char = '┊',
      --   space_char_blankline = " ",
      --   show_trailing_blankline_indent = false,
      --   -- use_treesitter = true,
      --   -- use_treesitter_scope = true,
      --   show_end_of_line = true,
      --   show_current_context = true,
      --   -- show_current_context_start = true,
      -- }
    end,
  },
  {
    "m00qek/baleia.nvim",
    tag = "v1.3.0",
    config = function()
      vim.g.terminal_color_0 = "#a3a7bc"
      vim.g.terminal_color_1 = "#F38BA8"
      vim.g.terminal_color_2 = "#94E2D5"
      vim.g.terminal_color_3 = "#F9E2AF"
      vim.g.terminal_color_4 = "#B4BEFE"
      vim.g.terminal_color_5 = "#CA9EE6"
      vim.g.terminal_color_6 = "#89DCEB"
      vim.g.terminal_color_7 = "#a3a7bc"
      vim.g.terminal_color_8 = "#a3a7bc"
      vim.g.terminal_color_9 = "#F38BA8"
      vim.g.terminal_color_10 = "#94E2D5"
      vim.g.terminal_color_11 = "#F9E2AF"
      vim.g.terminal_color_12 = "#89DCEB"
      vim.g.terminal_color_13 = "#F2CDCD"
      vim.g.terminal_color_14 = "#89DCEB"
      vim.g.terminal_color_15 = "#a3a7bc"

      local baleia = require("baleia").setup({})

      vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
        pattern = "*-tmux-logs",
        callback = function()
          baleia.once(vim.fn.bufnr(vim.fn.expand("%")))
        end,
      })

      -- vim.api.nvim_create_autocmd("User", {
      --   pattern = "TelescopePreviewerLoaded",
      --   callback = function(args)
      --     print(vim.inspect(args))
      --     if args.buf ~= nil then
      --       baleia.once(vim.fn.bufnr(args.buf))
      --     end
      --     -- if args.data.filetype ~= "help" then
      --     --   vim.wo.number = true
      --     -- elseif args.data.bufname:match("*.csv") then
      --     --   vim.wo.wrap = false
      --     -- end
      --   end,
      -- })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      -- import nvim-autopairs safely
      local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
      if not autopairs_setup then
        return
      end

      -- configure autopairs
      autopairs.setup({
        -- enable_check_bracket_line = false,
        check_ts = true,                 -- enable treesitter
        ts_config = {
          lua = { "string" },            -- don't add pairs in lua string treesitter nodes
          javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
          java = false,                  -- don't check treesitter on java
        },
      })

      -- import nvim-autopairs completion functionality safely
      -- local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
      -- if not cmp_autopairs_setup then
      --   return
      -- end

      -- -- import nvim-cmp plugin safely (completions plugin)
      -- local cmp_setup, cmp = pcall(require, "cmp")
      -- if not cmp_setup then
      --   return
      -- end

      -- -- make autopairs and completion work together
      -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      -- Rules

      -- Add spaces between parentheses
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")

      local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
      npairs.add_rules({
        -- Rule for a pair with left-side ' ' and right side ' '
        Rule(" ", " ")
        -- Pair will only occur if the conditional function returns true
            :with_pair(function(opts)
              -- We are checking if we are inserting a space in (), [], or {}
              local pair = opts.line:sub(opts.col - 1, opts.col)
              return vim.tbl_contains({
                brackets[1][1] .. brackets[1][2],
                brackets[2][1] .. brackets[2][2],
                brackets[3][1] .. brackets[3][2],
              }, pair)
            end)
            :with_move(cond.none())
            :with_cr(cond.none())
        -- We only want to delete the pair of spaces when the cursor is as such: ( | )
            :with_del(
              function(opts)
                local col = vim.api.nvim_win_get_cursor(0)[2]
                local context = opts.line:sub(col - 1, col + 2)
                return vim.tbl_contains({
                  brackets[1][1] .. "  " .. brackets[1][2],
                  brackets[2][1] .. "  " .. brackets[2][2],
                  brackets[3][1] .. "  " .. brackets[3][2],
                }, context)
              end
            ),
      })
      -- For each pair of brackets we will add another rule
      for _, bracket in pairs(brackets) do
        npairs.add_rules({
          -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
          Rule(bracket[1] .. " ", " " .. bracket[2])
              :with_pair(cond.none())
              :with_move(function(opts)
                return opts.char == bracket[2]
              end)
              :with_del(cond.none())
              :use_key(bracket[2])
          -- Removes the trailing whitespace that can occur without this
              :replace_map_cr(function(_)
                return "<C-c>2xi<CR><C-c>O"
              end),
        })
      end

      -- arrow key on javascript
      npairs.add_rules({
        Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
            :use_regex(true)
            :set_end_pair_length(2),
      })

      -- auto addspace on =
      -- npairs.add_rules {
      --   Rule('=', '')
      --       :with_pair(cond.not_inside_quote())
      --       :with_pair(function(opts)
      --         local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
      --         if last_char:match('[%w%=%s]') then
      --           return true
      --         end
      --         return false
      --       end)
      --       :replace_endpair(function(opts)
      --         local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
      --         local next_char = opts.line:sub(opts.col, opts.col)
      --         next_char = next_char == ' ' and '' or ' '
      --         if prev_2char:match('%w$') then
      --           return '<bs> =' .. next_char
      --         end
      --         if prev_2char:match('%=$') then
      --           return next_char
      --         end
      --         if prev_2char:match('=') then
      --           return '<bs><bs>=' .. next_char
      --         end
      --         return ''
      --       end)
      --       :set_end_pair_length(0)
      --       :with_move(cond.none())
      --       :with_del(cond.none())
      -- }

      -- https://github.com/rstacruz/vim-closer/blob/master/autoload/closer.vim
      local get_closing_for_line = function(line)
        local i = -1
        local clo = ""

        while true do
          i, _ = string.find(line, "[%(%)%{%}%[%]]", i + 1)
          if i == nil then
            break
          end
          local ch = string.sub(line, i, i)
          local st = string.sub(clo, 1, 1)

          if ch == "{" then
            clo = "}" .. clo
          elseif ch == "}" then
            if st ~= "}" then
              return ""
            end
            clo = string.sub(clo, 2)
          elseif ch == "(" then
            clo = ")" .. clo
          elseif ch == ")" then
            if st ~= ")" then
              return ""
            end
            clo = string.sub(clo, 2)
          elseif ch == "[" then
            clo = "]" .. clo
          elseif ch == "]" then
            if st ~= "]" then
              return ""
            end
            clo = string.sub(clo, 2)
          end
        end

        return clo
      end

      autopairs.remove_rule("(")
      autopairs.remove_rule("{")
      autopairs.remove_rule("[")

      autopairs.add_rule(Rule("[%(%{%[]", "")
        :use_regex(true)
        :replace_endpair(function(opts)
          return get_closing_for_line(opts.line)
        end)
        :end_wise(function(opts)
          -- Do not endwise if there is no closing
          return get_closing_for_line(opts.line) ~= ""
        end))
    end,
  },
  {
    "sindrets/winshift.nvim",
    event = "VeryLazy",
    config = function()
      require("winshift").setup({
        highlight_moving_win = true, -- Highlight the window being moved
        focused_hl_group = "Visual", -- The highlight group used for the moving window
        moving_win_options = {
          -- These are local options applied to the moving window while it's
          -- being moved. They are unset when you leave Win-Move mode.
          wrap = false,
          cursorline = false,
          cursorcolumn = false,
          colorcolumn = "",
        },
        keymaps = {
          disable_defaults = false, -- Disable the default keymaps
          win_move_mode = {
            ["h"] = "left",
            ["j"] = "down",
            ["k"] = "up",
            ["l"] = "right",
            ["H"] = "far_left",
            ["J"] = "far_down",
            ["K"] = "far_up",
            ["L"] = "far_right",
            ["<left>"] = "left",
            ["<down>"] = "down",
            ["<up>"] = "up",
            ["<right>"] = "right",
            ["<S-left>"] = "far_left",
            ["<S-down>"] = "far_down",
            ["<S-up>"] = "far_up",
            ["<S-right>"] = "far_right",
          },
        },
        ---A function that should prompt the user to select a window.
        ---
        ---The window picker is used to select a window while swapping windows with
        ---`:WinShift swap`.
        ---@return integer? winid # Either the selected window ID, or `nil` to
        ---   indicate that the user cancelled / gave an invalid selection.
        window_picker = function()
          return require("winshift.lib").pick_window({
            -- A string of chars used as identifiers by the window picker.
            picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            filter_rules = {
              -- This table allows you to indicate to the window picker that a window
              -- should be ignored if its buffer matches any of the following criteria.
              cur_win = true,                          -- Filter out the current window
              floats = true,                           -- Filter out floating windows
              filetype = { "NvimTree", "nvimtree", "alpha" }, -- List of ignored file types
              buftype = {},                            -- List of ignored buftypes
              bufname = {},                            -- List of vim regex patterns matching ignored buffer names
            },
            ---A function used to filter the list of selectable windows.
            ---@param winids integer[] # The list of selectable window IDs.
            ---@return integer[] filtered # The filtered list of window IDs.
            filter_func = nil,
          })
        end,
      })
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
    config = function()
      require("hlslens").setup({
        auto_enable = true,
        nearest_only = true,
        nearest_float_when = "never",
        calm_down = true,
      })

      local opts = { noremap = true, silent = true }
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
    end,
  },
  { "vifm/vifm.vim", event = "VeryLazy" },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    config = function()
      vim.cmd([[highlight! VM_Mono guibg=#004b72]])
      vim.cmd([[highlight! VM_Extend guibg=#004b72]])
      vim.g.VM_Mono_hl = "Visual"
      vim.g.VM_Mono = "Visual"
      vim.g.VM_Extend = "Visual"
      vim.g.VM_Extend_hl = "Visual"
      vim.g.VM_Insert_hl = "Visual"
    end,
  },
  {
    "b0o/schemastore.nvim",
    event = "VeryLazy",
  },
  {
    "LunarVim/bigfile.nvim",
    event = "VeryLazy",
    config = function()
      -- default config
      require("bigfile").setup({
        filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
        -- pattern = function(bufnr, filesize_mib)
        --   -- you can't use `nvim_buf_line_count` because this runs on BufReadPre
        --   local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
        --   local file_length = #file_contents
        --   local filetype = vim.filetype.match({ buf = bufnr })
        --   if file_length > 2000 then
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
      })
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    config = function()
      require("bqf").setup({
        magic_window = true,
        func_map = {},
        filter = {
          fzf = {
            action_for = {},
            extra_opts = {},
          },
        },
        auto_enable = true,
        auto_resize_height = true, -- highly recommended enable
        preview = {
          border = "single",
          buf_label = true,
          delay_syntax = 10,
          -- should_preview_cb = function()
          --   return false
          -- end,
          show_title = true,
          win_height = 0,
          win_vheight = 0,
          winblend = 0,
          wrap = true,
          show_scroll_bar = true,
          auto_preview = false,
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 10,
          keymap = {
            -- accept = "<TAB>",
            accept = false,
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
  {
    "dyng/ctrlsf.vim",
    branch = "feature/add-devicon",
    event = "VeryLazy",
    config = function()
      vim.g.ctrlsf_context = "-C 0"
      vim.g.ctrlsf_populate_qflist = 1
      -- vim.g.ctrlsf_auto_preview = 1
      vim.g.ctrlsf_fold_result = 1
      -- vim.g.ctrlsf_preview_position = 'inside'
      vim.g.ctrlsf_auto_close = {
        normal = 0,
        compact = 0,
      }
      -- vim.g.ctrlsf_position = "left_local"
      vim.g.ctrlsf_position = "right"
      vim.g.ctrlsf_mapping = {
        open = { "<CR>", "o" },
        openb = "O",
        split = "<C-X>",
        vsplit = { "<C-V>", "gd" },
        tab = "t",
        tabb = "T",
        popen = "p",
        popenf = "P",
        quit = "q",
        next = "<C-J>",
        prev = "<C-K>",
        -- nfile   = "<C-N>",
        -- pfile   = "<C-P>",
        pquit = "q",
        loclist = "",
        chgmode = "M",
        stop = "<C-C>",
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    config = function()
      local harpoon = require("harpoon")

      harpoon.setup({
        menu = {
          width = vim.api.nvim_win_get_width(0) - 48,
        },
      })

      harpoon:extend({
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item({ vsplit = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item({ split = true })
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-t>", function()
            harpoon.ui:select_menu_item({ tabedit = true })
          end, { buffer = cx.bufnr })
        end,
      })
      -- Harpoon
      -- keymap("n", "<Leader>ha", "<cmd>Telescope harpoon marks<cr>", opts)
      -- keymap("n", "<Leader>aa", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
      -- keymap("n", "<Leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
      -- keymap("n", "<Leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
      -- keymap("n", "<Leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
      -- keymap("n", "<Leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
      -- keymap("n", "<Leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
      -- keymap("n", "<Leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
      -- keymap("n", "<Leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts)
      -- keymap("n", "<Leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts)
      -- keymap("n", "<Leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts)
      -- keymap("n", "<Leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts)

      vim.keymap.set("n", "<leader>aa", function()
        harpoon:list():add()
      end)

      vim.keymap.set("n", "<Leader>ha", "<cmd>Telescope harpoon marks<cr>")
      vim.keymap.set("n", "<leader>hh", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set("n", "<Leader>1", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<Leader>2", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<Leader>3", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<Leader>4", function()
        harpoon:list():select(4)
      end)
      vim.keymap.set("n", "<Leader>5", function()
        harpoon:list():select(5)
      end)
      vim.keymap.set("n", "<Leader>6", function()
        harpoon:list():select(6)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      -- vim.keymap.set("n", "<C-k>", function() harpoon:list():prev() end)
      -- vim.keymap.set("n", "<C-j>", function() harpoon:list():next() end)
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    -- event = "VeryLazy",
    lazy = true,
    config = function()
      local present, devicons = pcall(require, "nvim-web-devicons")

      if not present then
        return
      end

      -- devicons.set_icon {
      --   ["service.ts"] = { icon = "", color = "#d6d25a", name = "AngularService"},
      --   ["%service.ts"] = { icon = "", color = "#d6d25a", name = "AngularService"},
      --   [".service.ts"] = { icon = "", color = "#d6d25a", name = "AngularService"},
      --   ["directive.ts"] = { icon = "", color = "#6f32a8", name = "AngularDirective"},
      --   ["module.ts"] = { icon = "", color = "#C24C38", name = "AngularModule"},
      --   ["stories.ts"] = { icon = "s", color = 'red', name = "Storie"},
      --   -- [".editorconfig"] = { icon = "🚦", name = "Editorconfig"},
      --   -- [".eslintignore"] = { icon = "🉐", name = "Eslintignore"},
      --   -- -- [".eslintignore"] = { icon = "🧿", name = "Eslintignore"},
      --   -- [".eslintrc"] = { icon = "🈳", name = "Eslintrc"},
      --   -- [".prettierrc"] = { icon = "🈶", name = "PrettierRc"},
      --   -- [".prettierignore"] = { icon = "🉑", name = "PrettierIgnore"},
      --   -- ["Jenkinsfile"] = { icon = "", name = "PrettierIgnore"},
      -- }

      local options = {
        override = {
          html = {
            icon = "",
            name = "html",
            color = "#C24C38",
          },
          dockerfile = {
            icon = "",
            color = "#9CDCFE",
            name = "Dockerfile4",
          },
          groovy = {
            icon = "",
            name = "groovyfile",
          },
          [".npmrc"] = {
            icon = "",
            color = "#F38BA8",
            name = "npmrc1",
          },
          ["out"] = {
            icon = "",
            color = "#F38BA8",
            cterm_color = "124",
            name = "Out",
          },
          zsh = {
            icon = "",
            color = "#9CDCFE",
            cterm_color = "65",
            name = "Zsh",
          },
          ["csv"] = {
            icon = "",
            color = "#9CDCFE",
            name = "Csv",
          },
          ["md"] = {
            icon = "",
            color = "#9CDCFE",
            name = "Markdown2",
          },
          json = {
            icon = "",
            name = "json",
            color = "#F9E2AF",
          },
          js = {
            icon = "",
            name = "javascript",
            color = "#F9E2AF",
          },
          ["cjs"] = {
            icon = "",
            color = "#F9E2AF",
            name = "Cjs",
          },
          txt = {
            icon = "󰈚",
            name = "txtname",
            -- color = "#F9E2AF"
            color = "#8ee2cf",
          },
          toml = {
            icon = "",
            name = "toml",
            -- color = "#F9E2AF"
            color = "#737aa2",
          },
          zip = {
            icon = "",
            name = "zipp",
            -- color = "#F9E2AF"
            color = "#F9E2AF",
          },

          ["CODEOWNERS"] = { icon = "󱖨", color = "#73daca", name = "codeownersfile1" },

          ["d.ts"] = {
            -- icon = "",
            icon = "󰛦",
            -- color = "#F38BA8",
            -- color = "#CBA6F7",
            color = "#89B4FA",
            -- cterm_color = "172",
            name = "TypeScriptDeclaration",
          },

          --[[ json = {
      icon = "",
      name = "json",
      color = "#DAE732"
    }, ]]
          -- js = {
          --   icon = "",
          --   name = "js",
          --   -- color = "#DAE732"
          --   color = "#B3BD36"
          -- },
          -- js = {
          --   icon = "󰌞",
          --   name = "js",
          --   -- color = "#DAE732"
          --   color = "#B3BD36"
          -- },
          -- ts = {
          --    icon = "󰛦",
          --    name = "ts",
          --    color = "#18a2fe"
          -- },
          -- default_icon = {
          --  -- icon = "🀪",
          --   -- icon = "🀀",
          --   icon = "🀅",
          --  color = "grey",
          --  name = "Default",
          -- }
          -- default_icon = {
          --   icon = "🀀",
          --   color = "white",
          --   name = "Default",
          -- },
          -- default = {
          --   -- icon = "󰙄",
          --   -- icon = "󰈤",
          --   -- icon = "🀄️",
          --   -- icon = "",
          --   icon = "📄",
          --   -- color = "#73daca",
          --   -- color = "grey",
          --   name = "Default",
          -- },
          default_icon = {
            -- icon = "󰙄",
            -- icon = "󰈤",
            -- icon = "🀄️",
            -- icon = "",
            -- icon = "🀀",
            -- icon = "",
            icon = "",
            -- icon = "",
            -- icon = "",
            -- icon = "📄",
            -- color = "#73daca",
            -- color = "grey",
            name = "DefaultIcon",
          },
        },
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true,
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = false,
        -- globally enable "strict" selection of icons - icon will be looked up in
        -- different tables, first by filename, and if not found by extension; this
        -- prevents cases when file doesn't have any extension but still gets some icon
        -- because its name happened to match some extension (default to false)
        strict = false,
        -- same as `override` but specifically for overrides by filename
        -- takes effect when `strict` is true
        override_by_filename = {
          [".gitignore"] = {
            icon = "",
            color = "#F38BA8",
            name = "Gitignore",
          },
          [".dockerignore"] = { icon = "", color = "#9CDCFE", name = "DockerfileIgnore" },
          ["Dockerfile"] = { icon = "", color = "#9CDCFE", name = "Dockerfile2" },
          ["dockerfile"] = { icon = "", color = "#9CDCFE", name = "Dockerfile5" },
          ["app.routes.ts"] = { icon = "󰑪", color = "#73daca", name = "AngularRoutes" },
          ["webpack.config.js"] = { icon = "󰜫", color = "#9CDCFE", name = "WebpackConfig" },
          ["webpack.prod.config.js"] = { icon = "󰜫", color = "#9CDCFE", name = "WebpackConfigProd" },

          ["webpack.config.ts"] = { icon = "󰜫", color = "#9CDCFE", name = "WebpackConfigTS" },
          ["webpack.prod.config.ts"] = { icon = "󰜫", color = "#9CDCFE", name = "WebpackConfigProdTS" },
          ["package.json"] = { icon = "", color = "#73daca", name = "PackageJson" },
          [".package.json"] = { icon = "", color = "#73daca", name = "PackageJson1" },
          ["*.package.json"] = { icon = "", color = "#73daca", name = "PackageJson2" },
          ["*package.json"] = { icon = "", color = "#73daca", name = "PackageJson3" },
          ["package-lock.json"] = { icon = "", color = "#73daca", name = "PackageLockJson" },
          ["pnpm-lock.yaml"] = { icon = "", color = "#F9E2AF", name = "pnpmLockYaml" },
          -- ["CODEOWNERS"] = { icon = "", color = "#F38BA8", name = "codeownersfile" },
          ["codeowners"] = { icon = "󱖨", color = "#73daca", name = "codeownersfile2" },
          -- ["*Jenkins*"] = { icon = "", color = 'black', name = "jenkinsfile" },
          -- ["jenkinsfileci"] = { icon = "", name = "Jenkins3"},
          -- ["jenkinsfilecd"] = { icon = "", name = "Jenkins4"},
          ["jenkinsfileci"] = { icon = "", name = "Jenkins3" },
          ["jenkinsfilecd"] = { icon = "", name = "Jenkins4" },
          ["JenkinsfileCD"] = { icon = "", name = "Jenkins5" },
          ["JenkinsfileCI"] = { icon = "", name = "Jenkins7" },

          -- [".nxignore"] = { icon = "🐋", color = "blue", name = "nxignore"},
          -- ["nx.json"] = { icon = "🐋", name = "nxjson"},

          -- [".nxignore"] = { icon = "󱢺 ", color = "#9CDCFE", name = "nxignore"},
          -- ["nx.json"] = { icon = "󱢺 ", color = "#9CDCFE", name = "nxjson"},

          -- ["sonar-project.properties"] = { icon = "󰐷", color = "#5E2C84", name = "sonarproperties"},
          ["sonar-project.properties"] = { icon = "󰐷", color = "#CBA6F7", name = "sonarproperties" },
          -- [".nxignore"] = { icon = "󰝆", color = "#7C7F93", name = "nxignore"},
          -- ["nx.json"] = { icon = "󰝆", color = "#9CDCFE", name = "nxjson"},
          ["nx.json"] = { icon = "󰰔", color = "#9CDCFE", name = "nxjson" },
          [".nxignore"] = { icon = "󰰔", color = "#7C7F93", name = "nxignore" },

          [".eslintignore"] = { icon = "󰱺", color = "#7C7F93", name = "eslintignore" },
          [".eslintrc.json"] = { icon = "󰱺", color = "#9CDCFE", name = "eslintrcjson" },
          [".eslintrc.base.json"] = { icon = "󰱺", color = "#9CDCFE", name = "eslintrcjson" },
          [".eslint-report.json"] = { icon = "󰱺", color = "#9CDCFE", name = "eslintreportjson" },

          --[[ [".prettierignore"] = { icon = "󰫽", color = "#7C7F93", name = "prettierignore"}, ]]
          [".prettierignore"] = { icon = "", color = "#7C7F93", name = "prettierignore" },

          --[[ [".prettierrc"] = { icon = "󰫽", color = "#0D8874", name = "prettierrc"}, ]]
          [".prettierrc"] = { icon = "", color = "#73daca", name = "prettierrc" },
          -- [".prettierrc"] = { icon = "", color = "#73daca", name = "prettierrc" },

          --[[ ["project.json"] = { icon = "", color = '#9CDCFE', name = 'ProjectJson' }, ]]
          ["project.json"] = { icon = "", color = "#9CDCFE", name = "ProjectJson" },
          -- ["tsconfig.json"] = { icon = "", color = "#F9E2AF", name = "TsConfigJson" },

          ["tsconfig.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile2" },
          ["tsconfig.editor.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile2" },
          ["tsconfig.base.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile2" },
          ["tsconfig.app.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile1" },
          ["tsconfig.lib.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile1" },
          ["tsconfig.spec.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile1" },
        },
        -- same as `override` but specifically for overrides by extension
        -- takes effect when `strict` is true
        override_by_extension = {
          [".env"] = {
            icon = "",
            -- color = "#F9E2AF",
            color = "#F2CDCD",
            -- cterm_color = "227",
            name = "Env2",
          },
          ["log"] = {
            icon = "",
            -- color = "#81e043",
            color = "#73daca",
            name = "Log",
          },
          -- ["md"] = {
          --   icon = "",
          --   color = "#9CDCFE",
          --   name = "Markdown"
          -- },
          ["module.ts"] = { icon = "", color = "#C24C38", name = "AngularModule1" },
          ["*.module.ts"] = { icon = "", color = "#C24C38", name = "AngularModule2" },
          [".module.ts"] = { icon = "", color = "#C24C38", name = "AngularModule" },
          ["service.ts"] = { icon = "", color = "#F9E2AF", name = "AngularService1" },
          [".service.ts"] = { icon = "", color = "#F9E2AF", name = "AngularService2" },

          ["component.ts"] = { icon = "󰚿", color = "#89b4fa", name = "AngularComponent1" },

          ["routes.ts"] = { icon = "󰑪", color = "#73daca", name = "AngularRoutesFile" },
          [".routes.ts"] = { icon = "󰑪", color = "#73daca", name = "AngularRoutesFile" },
          ["*.routes.ts"] = { icon = "󰑪", color = "#73daca", name = "AngularRoutesFile" },

          ["angular.json"] = { icon = "󰚿", color = "#f38ba8", name = "AngularJson" },
          ["*angular.json"] = { icon = "󰚿", color = "#f38ba8", name = "AngularJson" },
          ["*.angular.json"] = { icon = "󰚿", color = "#f38ba8", name = "AngularJson" },
          [".angular.json"] = { icon = "󰚿", color = "#f38ba8", name = "AngularJson" },

          ["directive.ts"] = { icon = "", color = "#6f32a8", name = "AngularDirective" },
          ["*.directive.ts"] = { icon = "", color = "#6f32a8", name = "AngularDirective" },
          [".directive.ts"] = { icon = "", color = "#6f32a8", name = "AngularDirective" },
          -- [".stories.ts"] = { icon = "s", color = "#F38BA8", name = "Storie1" },

          -- ["stories.ts"] = { icon = "s", color = "#F38BA8", name = "Storie2" },

          [".stories.ts"] = { icon = "", color = "#f55385", name = "Storie1" },

          ["stories.ts"] = { icon = "", color = "#f55385", name = "Storie2" },

          ["bun.lockb"] = { icon = "", color = "#F5C2E7", name = "bunlock" },
          -- ["bun.lockb"] = { icon = "󰳯", color = "#F2CDCD", name = "bunlock" },

          -- ["*codeowners"] = { icon = "", color = "#F38BA8", name = "codeownersfile" },

          ["codeowners"] = { icon = "󱖨", color = "#73daca", name = "codeownersfile3" },

          -- ["d.ts"] = { icon = "󰛦", color = '#107DC7', name = "dtypescript" },
          -- ["d.ts"] = { icon = "󰛦", color = "#89b4fb", name = "dtypescript" },

          [".editorconfig"] = { icon = "", color = "#c0caf5", name = "Editorconfig" },
          ["drawio"] = { icon = "󰇟", color = "#F9E2AF", name = "drawio1" },
        },
      }

      devicons.setup(options)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    config = function()
      -- import gitsigns plugin safely
      local setup, gitsigns = pcall(require, "gitsigns")
      if not setup then
        return
      end

      -- configure/enable gitsigns
      -- gitsigns.setup()

      gitsigns.setup({
        -- signs = {
        --   add = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        --   change = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        --   -- add          = { hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
        --   -- change       = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        --   delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        --   topdelete = {
        --     hl = "GitSignsDelete",
        --     text = "‾",
        --     numhl = "GitSignsDeleteNr",
        --     linehl = "GitSignsDeleteLn",
        --   },
        --   changedelete = {
        --     hl = "GitSignsChange",
        --     text = "~",
        --     numhl = "GitSignsChangeNr",
        --     linehl = "GitSignsChangeLn",
        --   },
        --   -- untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
        --   untracked = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        -- },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 300,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        -- yadm = {
        --   enable = false,
        -- },
      })
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    branch = "v1",
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    config = function()
      require("various-textobjs").setup({ useDefaultKeymaps = true })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      -- { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      -- { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
    config = function()
      vim.g.tmux_navigator_disable_when_zoomed = 1
      vim.g.tmux_navigator_preserve_zoom = 1
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    event = "VeryLazy",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "VeryLazy",
    config = function()
      require("hlslens").setup({
        auto_enable = true,
        nearest_only = true,
        nearest_float_when = "never",
        calm_down = true,
      })

      local opts = { noremap = true, silent = true }
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
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup({
        yaml = { names = false },
        md = { names = false },
        markdown = { names = false },
        scss = { names = false },
        [".scss"] = { names = false },
        [".md"] = { names = false },
        ["*"] = { names = false },
      })
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    event = "VeryLazy",
    -- dependencies = {
    --   { "kkharji/sqlite.lua", module = "sqlite" },
    --   -- you'll need at least one of these
    --   -- {'nvim-telescope/telescope.nvim'},
    --   -- {'ibhagwan/fzf-lua'},
    -- },
    config = function()
      require("neoclip").setup({
        history = 200,
        enable_persistent_history = true,
        length_limit = 1048576,
        continuous_sync = false,
        db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
        filter = nil,
        preview = true,
        prompt = nil,
        default_register = "+",
        default_register_macros = "q",
        enable_macro_history = false,
        content_spec_column = false,
        disable_keycodes_parsing = false,
        on_select = {
          move_to_front = false,
          close_telescope = true,
        },
        on_paste = {
          set_reg = false,
          move_to_front = false,
          close_telescope = true,
        },
        on_replay = {
          set_reg = false,
          move_to_front = false,
          close_telescope = true,
        },
        on_custom_action = {
          close_telescope = true,
        },
        keys = {
          telescope = {
            i = {
              select = "<cr>",
              paste = "<c-p>",
              paste_behind = "<c-r>",
              replay = "<c-q>", -- replay a macro
              delete = "<c-d>", -- delete an entry
              edit = "<c-e>", -- edit an entry
              custom = {},
            },
            n = {
              select = "<cr>",
              paste = "p",
              --- It is possible to map to more than one key.
              -- paste = { 'p', '<c-p>' },
              paste_behind = "P",
              replay = "q",
              delete = "d",
              edit = "e",
              custom = {},
            },
          },
          fzf = {
            select = "default",
            paste = "ctrl-p",
            paste_behind = "ctrl-r",
            custom = {},
          },
        },
      })
    end,
  },
}
