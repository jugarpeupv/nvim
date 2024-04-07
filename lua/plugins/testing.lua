-- return {}

return {
  {
    event = "VeryLazy",
    "preservim/vimux",
  },
  {
    "vim-test/vim-test",
    event = "VeryLazy",
    -- dependencies = { 'preservim/vimux' },
    config = function()
      vim.keymap.set("n", "<leader>te", ":TestNearest<CR>")
      vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
      -- vim.cmd("let test#strategy = 'vimux'")
      vim.cmd("let test#strategy = 'neovim_sticky'")
      -- vim.cmd("let g:test#javascript#runner = 'jest'")
      vim.cmd("let g:test#javascript#runner = 'nx'")
      vim.cmd("let g:VimuxHeight = '35'")
    end,
  },
}

-- return {
--   { "jugarpeupv/neotest-jest", dev = true },
--   { "nvim-neotest/neotest",
--   config = function()
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "neotest-output-panel",
--       callback = function()
--         vim.cmd("norm G")
--       end,
--     })
--     require("neotest").setup({
--       adapters = {
--         require("neotest-jest")({
--           -- jestCommand = "npm test --",
--           jestCommand = function()
--             local file = vim.fn.expand("%:p")
--             local fullProjectPath = string.match(file, "(.-/[^/]+/)src")
--             local projectName = fullProjectPath:match(".*/([^/]+)/$")
--             return "nx test " .. projectName .. " --"
--           end,
--           jestConfigFile = function()
--             local file = vim.fn.expand("%:p")
--             if string.find(file, "/libs/") then
--               return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
--             end

--             return vim.fn.getcwd() .. "/jest.config.ts"
--           end,
--           -- env = { CI = true },
--           cwd = function()
--             -- local file = vim.fn.expand("%:p")
--             -- if string.find(file, "/libs/") then
--             --   local match_string = string.match(file, "(.-/[^/]+/)src")
--             --   return match_string
--             -- end
--             return vim.fn.getcwd()
--           end,
--         }),
--       },
--     })
--   end,
--   }
-- }
