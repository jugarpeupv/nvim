local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
  pattern = "Cargo.toml",
  callback = function()
    cmp.setup.buffer({ sources = { { name = "crates" } } })
  end,
})

vim.cmd [[
  augroup _general_settings
  autocmd!
  autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
  autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
  autocmd BufWinEnter * :set formatoptions-=cro
  autocmd FileType qf set nobuflisted
  augroup end

  augroup _auto_resize
  autocmd!
  autocmd VimResized * tabdo wincmd =
  augroup end
]]

vim.cmd [[autocmd BufRead,BufNewFile */node_modules/* lua vim.diagnostic.disable(0)]]
vim.cmd [[autocmd BufRead,BufNewFile */assets/* lua vim.diagnostic.disable(0)]]

vim.cmd [[
  augroup filetypedetect
  autocmd BufRead,BufNewFile *Jenkinsfile set filetype=groovy
  augroup END
]]

-- local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })
--
-- vim.api.nvim_create_autocmd(
--   'VimResized',
--   {
--     group = wr_group,
--     pattern = '*',
--     command = 'wincmd =',
--     desc = 'Automatically resize windows when the host window size changes.'
--   }
-- )

local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1
  if not directory then
    local real_file = vim.fn.filereadable(data.file) == 1
    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
    if not real_file and not no_name then
      return
    end
    -- -- open the tree but don't focus it
    -- require("nvim-tree.api").tree.toggle({ focus = false })
    -- -- find the file if it exists
    -- require("nvim-tree.api").tree.find_file(data.file)
    return
  end
  -- create a new, empty buffer
  vim.cmd.enew()
  -- wipe the directory buffer
  vim.cmd.bw(data.buf)
  -- change to the directory
  vim.cmd.cd(data.file)
  -- open the tree
  require("nvim-tree.api").tree.open()
end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.cmd [[
  augroup jsoncFtdetect
  autocmd!
  autocmd BufNewFile,BufRead *.cjsn setfiletype jsonc
  autocmd BufNewFile,BufRead *.cjson setfiletype jsonc
  autocmd BufNewFile,BufRead *.jsonc setfiletype jsonc
  autocmd BufNewFile,BufRead *.json setfiletype jsonc
  autocmd BufNewFile,BufRead .eslintrc.json setlocal filetype=jsonc
  autocmd BufNewFile,BufRead .jshintrc setlocal filetype=jsonc
  autocmd BufNewFile,BufRead .mocharc.json setlocal filetype=jsonc
  autocmd BufNewFile,BufRead .mocharc.jsonc setlocal filetype=jsonc
  autocmd BufNewFile,BufRead coc-settings.json setlocal filetype=jsonc
  autocmd BufNewFile,BufRead coffeelint.json setlocal filetype=jsonc
  autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
  autocmd BufNewFile,BufRead */waybar/config setlocal filetype=jsonc
  augroup end
]]


-- Neovim version 10
-- function get_client(event)
--   local client_id = event.data.client_id
--   local client = vim.lsp.get_client_by_id(client_id)
--
--   return client
-- end
--
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = get_client(ev)
--     if not client then
--       return
--     end
--     if client.server_capabilities.inlayHintProvider then
--       -- vim.lsp.buf.inlay_hint(0, nil)
--       vim.lsp.inlay_hint(0, nil)
--     end
--   end
-- })
