return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 48,
      },
    })

    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })
    -- Harpoon
    -- keymap("n", "<Leader>ha", "<cmd>Telescope harpoon marks<cr>", opts)
    -- keymap("n", "<Leader>aa", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
    -- keymap("n", "<Leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
    -- keymap("n", "<Leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)
    -- keymap("n", "<Leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
    -- keymap("n", "<Leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
    -- keymap("n", "<Leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts)
    -- keymap("n", "<Leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts)
    -- keymap("n", "<Leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts)
    -- keymap("n", "<Leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts)
    -- keymap("n", "<Leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts)
    -- keymap("n", "<Leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts)

    vim.keymap.set("n", "<leader>aa", function()
      harpoon:list():append()
    end)

    vim.keymap.set("n", "<Leader>ha", "<cmd>Telescope harpoon marks<cr>")
    vim.keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", "<Leader>1", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<Leader>2", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<Leader>3", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<Leader>4", function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set("n", "<C-k>", function() harpoon:list():prev() end)
    -- vim.keymap.set("n", "<C-j>", function() harpoon:list():next() end)
  end,
}
