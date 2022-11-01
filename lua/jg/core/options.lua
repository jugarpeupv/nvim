local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = true -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.incsearch = true
opt.showcmd = true
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
opt.expandtab = true
opt.showbreak = string.rep(" ", 0) -- Make it so that long lines wrap smartly
opt.linebreak = true
opt.modelines = 1
opt.belloff = "all" -- Just turn the dang bell off
opt.inccommand = "split"
opt.mouse = "n"
opt.swapfile = false

opt.formatoptions = opt.formatoptions - "c" - "r" - "o"
opt.diffopt = { "iwhiteall", "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal", "followwrap" }
opt.pumblend = 0
vim.cmd([[set fillchars+=diff:╱]])
vim.cmd([[autocmd OptionSet * if &diff | execute 'set nowrap' | endif]])
vim.cmd([[autocmd OptionSet * if &diff | execute 'set nocursorline' | endif]])
vim.cmd[[set breakindent]]

-- ListChars
vim.cmd[[set showbreak=↪\]]

vim.o.ls = 0
-- vim.o.ch = 0

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word


-- Folding
vim.cmd[[set foldmethod=indent]]
vim.cmd[[set foldnestmax=10]]
vim.cmd[[set nofoldenable]]
vim.cmd[[set foldlevelstart=20]]

vim.cmd([[let &t_Cs = "\e[4:3m]"]])
vim.cmd([[let &t_Ce = "\e[4:0m]"]])
