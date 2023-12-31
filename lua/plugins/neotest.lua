return {
  "nvim-neotest/neotest",
  dependencies = {
    -- "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-jest",
  },
  event = "VeryLazy",

  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          -- jestCommand = "npm test --",
          jestCommand = function()
            local file = vim.fn.expand("%:p")
            local fullProjectPath = string.match(file, "(.-/[^/]+/)src")
            local projectName = fullProjectPath:match(".*/([^/]+)/$")
            return "nx test " .. projectName .. " --"
          end,
          jestConfigFile = function()
            local file = vim.fn.expand("%:p")
            if string.find(file, "/libs/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            end

            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
          -- env = { CI = true },
          cwd = function()
            -- local file = vim.fn.expand("%:p")
            -- if string.find(file, "/libs/") then
            --   local match_string = string.match(file, "(.-/[^/]+/)src")
            --   return match_string
            -- end
            return vim.fn.getcwd()
          end,
        }),
      },
    })
  end,
}
