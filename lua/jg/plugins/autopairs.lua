-- import nvim-autopairs safely
local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
  return
end

-- configure autopairs
autopairs.setup({
  check_ts = true,                      -- enable treesitter
  ts_config = {
    lua = { "string" },                 -- don't add pairs in lua string treesitter nodes
    javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
    java = false,                       -- don't check treesitter on java
  },
})

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then
  return
end

-- import nvim-cmp plugin safely (completions plugin)
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
  return
end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())


-- Rules

-- Add spaces between parentheses
local npairs   = require 'nvim-autopairs'
local Rule     = require 'nvim-autopairs.rule'
local cond = require'nvim-autopairs.conds'

local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
npairs.add_rules {
  Rule(' ', ' ')
      :with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({
          brackets[1][1] .. brackets[1][2],
          brackets[2][1] .. brackets[2][2],
          brackets[3][1] .. brackets[3][2],
        }, pair)
      end)
}
for _, bracket in pairs(brackets) do
  npairs.add_rules {
    Rule(bracket[1] .. ' ', ' ' .. bracket[2])
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match('.%' .. bracket[2]) ~= nil
        end)
        :use_key(bracket[2])
  }
end


-- arrow key on javascript
npairs.add_rules {
  Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
      :use_regex(true)
      :set_end_pair_length(2),
}


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
