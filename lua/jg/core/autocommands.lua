vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
  pattern = "Cargo.toml",
  callback = function()
    require("cmp").setup.buffer({ sources = { { name = "crates" } } })
  end,
})

vim.cmd [[
  augroup _general_settings
  autocmd!
  " autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
  autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
  autocmd BufWinEnter * :set formatoptions-=cro
  " autocmd FileType qf set nobuflisted
  augroup end

  " augroup _auto_resize
  " autocmd!
  " autocmd VimResized * tabdo wincmd =
  " augroup end
]]

vim.cmd [[autocmd BufRead,BufNewFile */node_modules/* lua vim.diagnostic.disable(0)]]
vim.cmd [[autocmd BufRead,BufNewFile */assets/* lua vim.diagnostic.disable(0)]]

vim.cmd [[
  augroup filetypedetect
  autocmd BufRead,BufNewFile *Jenkinsfile set filetype=groovy
  augroup END
]]

-- local wr_group = vim.api.nvim_create_augroup('WinResize', { clear = true })

-- local function open_nvim_tree(data)
--   -- buffer is a directory
--   local directory = vim.fn.isdirectory(data.file) == 1

--   if not directory then
--     return
--   end

--   -- create a new, empty buffer
--   vim.cmd.enew()

--   -- wipe the directory buffer
--   vim.cmd.bw(data.buf)

--   -- change to the directory
--   vim.cmd.cd(data.file)

--   -- open the tree
--   require("nvim-tree.api").tree.open()
-- end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- vim.cmd([[
--   augroup jsoncFtdetect
--   autocmd!
--   autocmd! BufNewFile,BufRead *.cjsn setfiletype jsonc
--   autocmd! BufNewFile,BufRead *.cjson setfiletype jsonc
--   autocmd! BufNewFile,BufRead *.jsonc setfiletype jsonc
--   autocmd! BufNewFile,BufRead *.json setfiletype jsonc

--   autocmd! BufNewFile,BufRead *json setfiletype jsonc
--   " autocmd! BufNewFile,BufRead infra/project.json setfiletype jsonc
--   " autocmd! BufNewFile,BufRead project.json setfiletype jsonc
--   " autocmd! BufNewFile,BufRead *project.json* setfiletype jsonc
--   " autocmd! BufNewFile,BufRead *project.json setfiletype jsonc
--   autocmd! BufNewFile,BufRead .eslintrc.json setlocal filetype=jsonc
--   autocmd! BufNewFile,BufRead .jshintrc setlocal filetype=jsonc
--   autocmd! BufNewFile,BufRead .mocharc.json setlocal filetype=jsonc
--   autocmd! BufNewFile,BufRead .mocharc.jsonc setlocal filetype=jsonc
--   autocmd! BufNewFile,BufRead coc-settings.json setlocal filetype=jsonc
--   autocmd! BufNewFile,BufRead coffeelint.json setlocal filetype=jsonc
--   autocmd! BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
--   autocmd! BufNewFile,BufRead */waybar/config setlocal filetype=jsonc
--   augroup end
-- ]])


-- It seems to be a bug with libuv
-- https://www.reddit.com/r/neovim/comments/14bcfmb/nonzero_exit_code/
-- vim.api.nvim_create_autocmd({ "VimLeave" }, {
--   callback = function()
--     vim.cmd("sleep 5m")
--   end,
-- })


-- Neovim version 10
-- local function get_client(event)
--   local client_id = event.data.client_id
--   local client = vim.lsp.get_client_by_id(client_id)

--   return client
-- end

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = get_client(ev)
--     if not client then
--       return
--     end
--     if client.server_capabilities.inlayHintProvider then
--       vim.lsp.inlay_hint.enable(0, true)
--     end
--   end
-- })

-- vim.cmd([[
--   augroup JsonToJsonc
--   autocmd! FileType json set filetype=jsonc
--   augroup END
-- ]])

-- vim.cmd([[
--   augroup FoldMethodSyntaxOnJson
--   autocmd! FileType json setlocal foldmethod=syntax
--   augroup END
-- ]])

-- vim.cmd([[
--   augroup FoldMethodSyntaxOnJsonc
--   autocmd! FileType jsonc setlocal foldmethod=syntax
--   augroup END
-- ]])

vim.cmd([[
  augroup WrapMarkdownAu
  autocmd! FileType markdown set wrap
  augroup END
]])

vim.cmd([[
  augroup WrapTelescopePreview
  autocmd! FileType TelescopePreview set wrap
  augroup END
]])

vim.api.nvim_create_autocmd('filetype', {
  pattern = 'NvimTree',
  desc = 'Mappings for NvimTree',
  group = vim.api.nvim_create_augroup("NvimTreeBulkCommands", { clear = true }),
  callback = function()
    -- Yank marked files
    vim.keymap.set('n', 'bgy',
      function()
        local api = require 'nvim-tree.api'
        local marks = api.marks.list()
        if #marks == 0 then
          print('No items marked')
          return
        end
        local absolute_file_paths = ''
        for _, mark in ipairs(marks) do
          absolute_file_paths = absolute_file_paths .. mark.absolute_path .. '\n'
        end
        -- Using system registers for multi-instance support.
        vim.fn.setreg("+", absolute_file_paths)
        print('Yanked ' .. #marks .. ' items')
      end,
      { remap = true, buffer = true })

    -- Paste files
    vim.keymap.set('n', 'bgp',
      function()
        local api = require 'nvim-tree.api'
        local source_paths = {}
        for path in vim.fn.getreg('+'):gmatch('[^\n%s]+') do
          source_paths[#source_paths + 1] = path
        end
        local node = api.tree.get_node_under_cursor()
        local is_folder = node.fs_stat and node.fs_stat.type == 'directory' or false
        local target_path = is_folder and node.absolute_path or
            vim.fn.fnamemodify(node.absolute_path, ":h")
        for _, source_path in ipairs(source_paths) do
          vim.fn.system { 'cp', '-R', source_path, target_path }
        end
        api.tree.reload()
        print('Pasted ' .. #source_paths .. ' items')
      end,
      { remap = true, buffer = true })
  end
})

vim.api.nvim_create_autocmd('filetype', {
  pattern = 'yml',
  group = vim.api.nvim_create_augroup("YmlSyntaxOff", { clear = true }),
  callback = function()
    vim.cmd("set syntax=OFF")
  end,
})

vim.api.nvim_create_autocmd('filetype', {
  pattern = 'yaml',
  group = vim.api.nvim_create_augroup("YamlSyntaxOff", { clear = true }),
  callback = function()
    vim.cmd("set syntax=OFF")
  end,
})

-- vim.api.nvim_create_autocmd('BufRead', {
--   pattern = '*.json',
--   group = vim.api.nvim_create_augroup("jsonSyntaxOff", { clear = true }),
--   callback = function()
--     print('hi')
--     vim.cmd("set filetype=jsonc")
--   end,
-- })

-- vim.cmd[[au! BufRead,BufNewFile *.json set filetype=jsonc]]

-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   pattern = '*',
--   group = vim.api.nvim_create_augroup("winbarGroupAu", { clear = true }),
--   callback = function()
--     if vim.bo.filetype == '' then
--       return
--     end
--     vim.wo.winbar = "%{%v:lua.require'jg.custom.winbar'.eval()%}"
--   end,
-- })



vim.api.nvim_create_autocmd({ 'BufRead', 'BufEnter' }, {
  group = vim.api.nvim_create_augroup('set-png-ft', { clear = true }),
  pattern = '*.png',
  callback = function()
    vim.cmd([[set filetype=png]])
  end,
})

vim.api.nvim_create_autocmd('CursorMoved', {
  group = vim.api.nvim_create_augroup('auto-hlsearch', { clear = true }),
  callback = function ()
    if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
      vim.schedule(function () vim.cmd.nohlsearch() end)
    end
  end
})



-- -- yanking registers
-- local prev0, prev9
-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = vim.api.nvim_create_augroup("yank_history", {}),
--   desc = "Store previous yanks in latter half of numbered registers (VimEnter hooks)",
--   pattern = "*",
--   callback = function()
--     prev0 = vim.fn.getreginfo("0")
--     prev9 = vim.fn.getreginfo("9")
--   end
-- })

-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group = "yank_history",
--   desc = "Store previous yanks in latter half of numbered registers",
--   pattern = "*",
--   callback = function()
--     if vim.v.event.regname ~= "" then return end
--     vim.fn.setreg("6", vim.fn.getreginfo("7"))
--     vim.fn.setreg("7", vim.fn.getreginfo("8"))
--     vim.fn.setreg("8", vim.fn.getreginfo("9"))
--     if vim.v.event.operator == "y" then
--       prev0.isunnamed = false
--       vim.fn.setreg("9", prev0)
--       prev9 = vim.fn.getreginfo("9")
--       prev0 = vim.fn.getreginfo("0")
--     else
--       vim.fn.setreg("9", prev9)
--     end
--   end,
-- })

-- vim.cmd([[autocmd OptionSet * if &diff | execute 'set nowrap' | endif]])
-- vim.cmd([[autocmd OptionSet * if &diff | execute 'set wrap' | endif]])
-- vim.cmd([[autocmd OptionSet * if &diff | execute 'set nocursorline' | endif]])
-- vim.cmd([[autocmd OptionSet * if !&diff | execute 'set cursorline' | endif]])
-- vim.cmd([[autocmd OptionSet * if &diff | execute 'TSContextDisable' | endif]])

-- vim.cmd([[autocmd OptionSet * if &diff | execute 'set nowrap' | endif]])
-- vim.cmd([[autocmd OptionSet * if &diff | execute 'set wrap' | endif]])
-- vim.cmd([[autocmd OptionSet * if &diff | execute 'set nocursorline' | endif]])
-- vim.cmd([[autocmd OptionSet * if !&diff | execute 'set cursorline' | endif]])
-- vim.cmd([[autocmd OptionSet * if &diff | execute 'TSContextDisable' | endif]])

-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   callback = function()
--     if require("nvim-treesitter.parsers").has_parser() then
--       vim.opt.foldmethod = "expr"
--       -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--       -- vim.o.foldtext = "v:lua.vim.treesitter.foldtext()"
--       -- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--       -- vim.wo.foldtext = 'v:lua.vim.treesitter.foldtext()'
--       vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--     else
--       vim.opt.foldmethod = "indent"
--     end
--   end,
-- })
