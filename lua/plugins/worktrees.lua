-- return {}
return {
  -- "ThePrimeagen/git-worktree.nvim",
  "polarmutex/git-worktree.nvim",
  -- "nooproblem/git-worktree.nvim",
  version = "^2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = { "<leader>wt", "<leader>wc" },
  config = function()
    -- require("git-worktree").setup({
    --   -- change_directory_command = "cd", -- default: "cd",
    --   -- update_on_change = true,      -- default: true,
    --   -- -- update_on_change_command = <str> -- default: "e .",
    --   -- clearjumps_on_change = true,  -- default: true,
    --   -- autopush = false,             -- default: false,
    -- })

    vim.keymap.set(
      { "n" },
      "<leader>wt",
      ":lua require('telescope').extensions.git_worktree.git_worktree()<cr>",
      { noremap = true, silent = true, expr = false }
    )
    vim.keymap.set(
      { "n" },
      "<leader>wc",
      ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
      { noremap = true, silent = true, expr = false }
    )

    local Hooks = require("git-worktree.hooks")

    local api_nvimtree = require("nvim-tree.api")

    Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
      local prev_node_modules_path = prev_path .. "/node_modules"
      local prev_node_modules_exists = vim.fn.isdirectory(prev_node_modules_path)

      if prev_node_modules_exists then
        os.rename(prev_node_modules_path, path .. "/node_modules")
        api_nvimtree.tree.reload()
      end
    end)

    Hooks.register(Hooks.type.CREATE, function(path, branch)

      local relative_path = path;
      print("[Create]: relative path: " .. relative_path)
      print("[Create]: branch: " .. branch)

      local Path = require("plenary.path")

      local original_path = ''
      if not Path:new(path):is_absolute() then
        original_path = Path:new():absolute()
        if original_path:sub(- #"/") == "/" then
          original_path = string.sub(original_path, 1, string.len(original_path) - 1)
        end
      end


      print("[Create]: original path: " .. original_path)
      local prev_node_modules_path = original_path .. "/node_modules"

      print("[Create]: prev_node_modules_path: " .. prev_node_modules_path)

      local worktree_path = original_path .. "/" .. relative_path

      print("[Create]: worktree path: " .. worktree_path)
      local destination_path = worktree_path .. "/node_modules"
      print("[Create]: destination path: " .. destination_path)

      local prev_node_modules_exists = vim.fn.isdirectory(prev_node_modules_path)
      if prev_node_modules_exists then
        os.rename(prev_node_modules_path, destination_path)
        api_nvimtree.tree.reload()
      end



      -- local prev_node_modules_path = prev_path .. "/node_modules"
      -- local prev_node_modules_exists = vim.fn.isdirectory(prev_node_modules_path)
      --
      -- if prev_node_modules_exists then
      --   os.rename(prev_node_modules_path, path .. "/node_modules")
      -- end
    end)

  end,
}
