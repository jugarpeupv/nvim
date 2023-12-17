vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

vim.loader.enable()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("jg.plugins-setup")
require("jg.core.autocommands")
require("jg.core.keymaps")
require("jg.plugins.devicons")
require("jg.plugins.nvim-tree")
require("jg.core.options")
require("jg.plugins.ctrlsf-config")
require("jg.plugins.comment-string-config")
require("jg.plugins.telescope")
require("jg.plugins.lsp.mason")
require("jg.plugins.lsp.lspconfig")
require("jg.plugins.lsp.mason-dap")
require("jg.plugins.lsp.null-ls")
require("jg.plugins.autopairs")
require("jg.plugins.treesitter")
require("jg.plugins.gitsigns")
require("jg.plugins.treesitter-context")
-- require("jg.plugins.lab")
require("jg.plugins.indent-line")
require('jg.plugins.barbecue-config')
require("jg.plugins.diffview-config")
-- require("jg.plugins.bufferline-config")
require("jg.plugins.json-path")
-- require("jg.plugins.devcontainers")
require("jg.plugins.tmux-navigator")
require("jg.plugins.text-objects")
-- require("jg.plugins.toggle-term")
-- require("jg.plugins.bqf-config")
require('jg.plugins.oil-config')
-- require('jg.plugins.image-config')
require('jg.plugins.scrollbar-config')
require("jg.plugins.colorizer")
require("jg.plugins.catpuccin")
require("jg.plugins.lualine")
require("jg.plugins.signature")
-- require("jg.plugins.incline-config")
require("jg.plugins.git-conflicts")
require("jg.plugins.winshift-config")
require("jg.plugins.nvim-cmp")
-- require("jg.plugins.vscode")
