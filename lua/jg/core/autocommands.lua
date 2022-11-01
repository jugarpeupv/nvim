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

vim.cmd[[autocmd BufRead,BufNewFile */node_modules/* lua vim.diagnostic.disable(0)]]
vim.cmd[[autocmd BufRead,BufNewFile */assets/* lua vim.diagnostic.disable(0)]]

vim.cmd [[
  augroup filetypedetect
  autocmd BufRead,BufNewFile *Jenkinsfile set filetype=groovy
  augroup END
]]
