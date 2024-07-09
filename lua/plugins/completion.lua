-- return {}
return {
  -- { "hrsh7th/cmp-nvim-lua", event = "InsertEnter" },
  -- { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
  -- -- { "hrsh7th/cmp-buffer" },
  -- -- { "hrsh7th/cmp-cmdline" },
  -- { "hrsh7th/cmp-path",     event = "InsertEnter" },
  -- { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
  -- {
  --   "L3MON4D3/LuaSnip",
  --   event = "InsertEnter",
  --   -- dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
  -- },
  -- { "rafamadriz/friendly-snippets", event = "InsertEnter" },
  {
    event = "InsertEnter",
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      },
      {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
          -- import nvim-autopairs safely
          local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
          if not autopairs_setup then
            return
          end

          -- configure autopairs
          autopairs.setup({
            -- enable_check_bracket_line = false,
            check_ts = true, -- enable treesitter
            disable_filetype = { "TelescopePrompt", "vim" },
            fast_wrap = {},
            ts_config = {
              lua = { "string" },          -- don't add pairs in lua string treesitter nodes
              javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
              java = false,                -- don't check treesitter on java
            },
          })

          -- setup cmp for autopairs
          -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
          -- require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())

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
                :with_pair(
                  function(opts)
                    -- We are checking if we are inserting a space in (), [], or {}
                    local pair = opts.line:sub(opts.col - 1, opts.col)
                    return vim.tbl_contains({
                      brackets[1][1] .. brackets[1][2],
                      brackets[2][1] .. brackets[2][2],
                      brackets[3][1] .. brackets[3][2],
                    }, pair)
                  end
                )
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
                  :replace_map_cr(
                    function(_)
                      return "<C-c>2xi<CR><C-c>O"
                    end
                  ),
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
      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    config = function()
      -- import nvim-cmp plugin safely
      local cmp_status, cmp = pcall(require, "cmp")
      if not cmp_status then
        return
      end

      -- import luasnip plugin safely
      local luasnip_status, luasnip = pcall(require, "luasnip")
      if not luasnip_status then
        return
      end

      -- import lspkind plugin safely
      local lspkind_status, lspkind = pcall(require, "lspkind")
      if not lspkind_status then
        return
      end

      luasnip.add_snippets("html", {
        luasnip.parser.parse_snippet("testtest", "worksworks"),
      })
      luasnip.filetype_extend("myangular", { "html" })
      -- load vs-code like snippets from plugins (e.g. friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      vim.opt.completeopt = "menu,menuone,noselect"

      cmp.setup.filetype({ "sagarename" }, {
        sources = {},
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- preslect = cmp.PreselectMode.Item,
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- ["<C-y>"] = cmp.mapping(function()
          --   if luasnip.jumpable(-1) then
          --     luasnip.jump(-1)
          --   end
          -- end, { "i", "s" }),
          -- ["<C-i>"] = cmp.mapping(function()
          --   if luasnip.expand_or_jumpable() then
          --     luasnip.expand_or_jump()
          --   end
          -- end, { "i", "s" }),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(),   -- close completion window
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          -- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          -- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          -- ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          -- Overload tab to accept Copilot suggestions.
          -- ["<Tab>"] = cmp.mapping(function(fallback)
          --   local copilot = require("copilot.suggestion")
          --   if cmp.visible() then
          --     -- cmp.mapping.confirm({ select = false })
          --     cmp.confirm({ select = true  })
          --     -- cmp.
          --     -- cmp.select_next_item()
          --     -- cmp.select_next_item()
          --   elseif copilot.is_visible() then
          --     copilot.accept()
          --   elseif luasnip.expand_or_locally_jumpable() then
          --     luasnip.expand_or_jump()
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),
          -- ["<S-Tab>"] = cmp.mapping(function(fallback)
          --   local copilot = require("copilot.suggestion")
          --   if copilot.is_visible() then
          --     copilot.accept()
          --   else
          --     fallback()
          --   end
          --   -- if cmp.visible() then
          --   --   cmp.select_prev_item()
          --   -- elseif luasnip.expand_or_locally_jumpable(-1) then
          --   --   luasnip.jump(-1)
          --   -- else
          --   --   fallback()
          --   -- end
          -- end, { "i", "s" }),
        }),
        -- window = {
        --   completion = cmp.config.window.bordered(),
        --   documentation = cmp.config.window.bordered(),
        -- },
        window = {
          completion = {
            -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
          },
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            -- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
          },
        },
        -- sources for autocompletion
        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            -- entry_filter = function(entry, ctx)
            --   return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
            -- end,
            -- entry_filter = function(entry, _)
            --   return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
            -- end,
          },
          { name = "nvim_lsp:marksman" },
          { name = "marksman" },
          { name = "luasnip" }, -- snippets
          { name = "path" }, -- file system paths
          -- { name = "buffer", keyword_length = 5, max_item_count = 5 },
          -- { name = "buffer" },
          -- { name = 'markdown-link' },
          -- { name = 'markdown' },
        }),
        sorting = {
          comparators = {
            cmp.config.compare.exact,
            -- cmp.config.compare.offset,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            -- require("cmp-under-comparator").under,
            -- function(entry1, entry2)
            --   local _, entry1_under = entry1.completion_item.label:find("^_+")
            --   local _, entry2_under = entry2.completion_item.label:find("^_+")
            --   entry1_under = entry1_under or 0
            --   entry2_under = entry2_under or 0
            --   if entry1_under > entry2_under then
            --     return false
            --   elseif entry1_under < entry2_under then
            --     return true
            --   end
            -- end,
            cmp.config.compare.kind,
            -- cmp.config.compare.offset,
            -- cmp.config.compare.exact,
            -- cmp.config.compare.score,
            -- -- cmp.config.compare.kind,
            -- -- cmp.config.compare.sort_text,
            -- -- cmp.config.compare.length,
            -- -- cmp.config.compare.order,

            -- -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
            -- -- -- copied from cmp-under, but I don't think I need the plugin for this.
            -- -- -- I might add some more of my own.
            -- function(entry1, entry2)
            --   local _, entry1_under = entry1.completion_item.label:find("^_+")
            --   local _, entry2_under = entry2.completion_item.label:find("^_+")
            --   entry1_under = entry1_under or 0
            --   entry2_under = entry2_under or 0
            --   if entry1_under > entry2_under then
            --     return false
            --   elseif entry1_under < entry2_under then
            --     return true
            --   end
            -- end,

            -- cmp.config.compare.kind,
            -- cmp.config.compare.sort_text,
            -- cmp.config.compare.length,
            -- cmp.config.compare.order,
          },
        },
        -- configure lspkind for vs-code like icons
        formatting = {
          -- format = require("tailwindcss-colorizer-cmp").formatter

          format = lspkind.cmp_format({
            maxwidth = 80,
            mode = "symbol_text",
            menu = {
              nvim_lsp = "[LSP]",
              -- buffer = "[Buffer]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
            },
            -- before = function(entry, vim_item)
            --   vim_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
            --   return vim_item
            -- end,
          }),
          -- format = function (entry, vim_item)
          --   vim_item.kind = lspkind.presets.default[vim_item.kind]
          --   vim_item.menu = ({
          --     nvim_lsp = "[LSP]",
          --     look = "[Dict]",
          --     buffer = "[Buffer]"
          --   })[entry.source.name]
          --
          --   vim_item.kind, vim_item.menu = vim_item.menu, vim_item.kind
          --   return vim_item
          -- end
          -- format = lspkind.cmp_format({
          --     -- mode = 'symbol',
          -- 	maxwidth = 50,
          -- 	ellipsis_char = "...",
          -- }),
        },
      })
      -- `/` cmdline setup.
      -- cmp.setup.cmdline("/", {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = {
      --     { name = "buffer" },
      --   },
      -- })
      -- `:` cmdline setup.
      -- cmp.setup.cmdline(":", {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = cmp.config.sources({
      --     { name = "path" },
      --   }, {
      --     {
      --       name = "cmdline",
      --       option = {
      --         ignore_cmds = { "Man", "!" },
      --       },
      --     },
      --   }),
      -- })
    end,
  },
}
