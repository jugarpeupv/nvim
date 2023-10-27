require("toggleterm").setup({
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 7
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-q>]],
  -- -- on_create = fun(t: Terminal), -- function to run when the terminal is first created
  -- on_open = function ()
  -- end, -- function to run when the terminal opens
  -- -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  -- -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
  -- -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
  -- -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
  hide_numbers = false, -- hide the number column in toggleterm buffers
  -- shade_filetypes = {},
  -- autochdir = true,     -- when neovim changes it current directory the terminal will change it's own when next it's opened
  -- -- highlights = {
  -- --   -- highlights which map to a highlight group name and a table of it's values
  -- --   -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
  -- --   Normal = {
  -- --     guibg = "<VALUE-HERE>",
  -- --   },
  -- --   NormalFloat = {
  -- --     link = 'Normal'
  -- --   },
  -- --   FloatBorder = {
  -- --     guifg = "<VALUE-HERE>",
  -- --     guibg = "<VALUE-HERE>",
  -- --   },
  -- -- },
  -- shade_terminals = true,      -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  -- -- shading_factor = '<number>', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  start_in_insert = true,
  -- insert_mappings = true,      -- whether or not the open mapping applies in insert mode
  -- terminal_mappings = true,    -- whether or not the open mapping applies in the opened terminals
  persist_size = false,
  persist_mode = true,         -- if set to true (default) the previous terminal mode will be remembered
  -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
  direction = 'horizontal',
  -- direction = 'horizontal',
  -- close_on_exit = true,        -- close the terminal window when the process exits
  -- -- Change the default shell. Can be a string or a function returning a string
  -- shell = vim.o.shell,
  shell = '/opt/homebrew/bin/zsh',
  -- auto_scroll = true -- automatically scroll to the bottom on terminal output
  -- -- This field is only relevant if direction is set to 'float'
  -- -- float_opts = {
  -- --   -- The border key is *almost* the same as 'nvim_open_win'
  -- --   -- see :h nvim_open_win for details on borders however
  -- --   -- the 'curved' border is a custom border type
  -- --   -- not natively supported but implemented in this plugin.
  -- --   border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
  -- --   -- like `size`, width and height can be a number or function which is passed the current terminal
  -- --   width = <value>,
  -- --   height = <value>,
  -- --   winblend = 3,
  -- --   zindex = <value>,
  -- -- },
  -- winbar = {
  --   enabled = true,
  --   name_formatter = function(term) --  term: Terminal
  --     return term.nameterm
  --   end
  -- },
})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lz", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})


local function select_terminal(opts)
  local terms = require("toggleterm.terminal")
  local terminals = terms.get_all(opts.bang)
  if #terminals == 0 then return end
  vim.ui.select(terminals, {
    prompt = "Please select a terminal to open (or focus): ",
    format_item = function(term) return term.id .. ": " .. term:_display_name() end,
  }, function(term)
    if not term then return end
    if term:is_open() then
      term:focus()
    else
      term:open()
    end
  end)
end

local command = vim.api.nvim_create_user_command
command("TermSelect", select_terminal, { bang = true })
