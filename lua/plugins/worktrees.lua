-- return {}
return {
  -- "ThePrimeagen/git-worktree.nvim",
  -- 'polarmutex/git-worktree.nvim',
  "nooproblem/git-worktree.nvim",
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
      ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
      { noremap = true, silent = true, expr = false }
    )
    vim.keymap.set(
      { "n" },
      "<leader>wc",
      ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
      { noremap = true, silent = true, expr = false }
    )

    -- local Worktree = require("git-worktree")

    -- -- op = Operations.Switch, Operations.Create, Operations.Delete
    -- -- metadata = table of useful values (structure dependent on op)
    -- --      Switch
    -- --          path = path you switched to
    -- --          prev_path = previous worktree path
    -- --      Create
    -- --          path = path where worktree created
    -- --          branch = branch name
    -- --          upstream = upstream remote name
    -- --      Delete
    -- --          path = path where worktree deleted

    -- Worktree.on_tree_change(function(op, metadata)
    --   if op == Worktree.Operations.Switch then
    --     print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
    --   end
    -- end)

    -- local Worktree = require("git-worktree")

    -- Then I have the files that are ignored by git in a folder in my bare repo root (makes more sense to me, I will have different environment variables for different repos).
    -- And then the /{,.} makes the copy all + copy all hidden just one command.

    -- Worktree.on_tree_change(function(op, metadata)
    --   local Path = require("plenary.path")
    --   if op == Worktree.Operations.Create then
    --     -- If we're dealing with create, the path is relative to the worktree and not absolute
    --     -- so we need to convert it to an absolute path.
    --     local path = metadata.path
    --     if not Path:new(path):is_absolute() then
    --       path = Path:new():absolute()
    --       if path:sub(- #"/") == "/" then
    --         path = string.sub(path, 1, string.len(path) - 1)
    --       end
    --     end
        
    --     -- local branch = branchname(metadata.path)
    --     local worktree_path = path .. "/" .. metadata.path .. "/"
    --     print("worktree path: " .. worktree_path)
    --     local gitignored_path = path .. "/node_modules"
    --     print("git ignored path: " .. gitignored_path)

    --     -- worktree path: /Users/jgarcia/tmp/poc/mar2-front-pruebas/main/pruebas/
    --     --   git ignored path: /Users/jgarcia/tmp/poc/mar2-front-pruebas/main/node_modules
    --     --   link gitignored: ln -s /Users/jgarcia/tmp/poc/mar2-front-pruebas/main/node_modules/{*,.*} /Users/jgarcia/tmp/poc/mar2-front-pruebas/main/pruebas/

    --     local link_gitignored = "ln -s " .. gitignored_path .. "/{*,.*} " .. worktree_path
    --     print("link gitignored: " .. link_gitignored)
    --     os.execute(link_gitignored)
    --   end
    -- end)
  end,
}
