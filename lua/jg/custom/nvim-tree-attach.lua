local api = require("nvim-tree.api")
-- local utils = require("nvim-tree.utils")
local current_popup = nil

local M = {}

local function get_formatted_lines(node)
  local stats = node.fs_stat
  if stats == nil then
    return {
      "",
      "  Can't retrieve file information",
      "",
    }
  end

  local file_name = vim.fn.expand(node.absolute_path)
  local file_permissions = vim.fn.getfperm(file_name)

  local fpath = " fullpath: " .. node.absolute_path
  local created_at = " created:  " .. os.date("%x %X", stats.birthtime.sec)
  local modified_at = " modified: " .. os.date("%x %X", stats.mtime.sec)
  local accessed_at = " accessed: " .. os.date("%x %X", stats.atime.sec)
  -- local size = " size:     " .. utils.format_bytes(stats.size)
  local permissions = " permis:   " .. file_permissions

  return {
    fpath,
    permissions,
    -- size,
    accessed_at,
    modified_at,
    created_at
  }
end

local function setup_window(node)
  local lines = get_formatted_lines(node)

  local max_width = vim.fn.max(vim.tbl_map(function(n)
    return #n
  end, lines))
  local open_win_config = vim.tbl_extend(
    "force",
    { col = 1, row = 1, relative = "cursor", border = "rounded", style = "minimal" },
    {
      width = max_width + 1,
      height = #lines,
      noautocmd = true,
      zindex = 60,
    }
  )
  local winnr = vim.api.nvim_open_win(0, false, open_win_config)
  current_popup = {
    winnr = winnr,
    file_path = node.absolute_path,
  }
  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  vim.api.nvim_win_set_buf(winnr, bufnr)
end


local function close_popup()
  if current_popup ~= nil then
    vim.api.nvim_win_close(current_popup.winnr, true)
    vim.cmd "augroup NvimTreeRemoveFilePopup | au! CursorMoved | augroup END"

    current_popup = nil
  end
end

local function custom_toggle_file_info(node)
  if node.name == ".." then
    return
  end
  if current_popup ~= nil then
    local is_same_node = current_popup.file_path == node.absolute_path

    close_popup()

    if is_same_node then
      return
    end
  end

  setup_window(node)

  vim.api.nvim_create_autocmd("CursorMoved", {
    group = vim.api.nvim_create_augroup("NvimTreeRemoveFilePopup", {}),
    callback = close_popup,
  })
end

M.change_root_to_global_cwd = function()
  local global_cwd = vim.fn.getcwd(-1, -1)
  api.tree.change_root(global_cwd)
end

M.custom_info_popup = function()
  local node = api.tree.get_node_under_cursor()
  custom_toggle_file_info(node)
end

local function on_attach(bufnr)
  local opts = function(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  -- mark operation
  local mark_move_j = function()
    api.marks.toggle()
    vim.cmd("norm j")
  end
  local mark_move_k = function()
    api.marks.toggle()
    vim.cmd("norm k")
  end

  -- marked files operation
  local mark_trash = function()
    local marks = api.marks.list()
    if #marks == 0 then
      table.insert(marks, api.tree.get_node_under_cursor())
    end
    -- vim.ui.input({ prompt = string.format("Trash %s files? [y/n] ", #marks) }, function(input)
    --   if input == "y" then
    --     for _, node in ipairs(marks) do
    --       api.fs.trash(node)
    --     end
    --     api.marks.clear()
    --     api.tree.reload()
    --   end
    -- end)

    for _, node in ipairs(marks) do
      api.fs.trash(node)
    end
    api.marks.clear()
    api.tree.reload()
  end
  local mark_remove = function()
    local marks = api.marks.list()
    if #marks == 0 then
      table.insert(marks, api.tree.get_node_under_cursor())
    end
    -- vim.ui.input({ prompt = string.format("Remove/Delete %s files? [y/n] ", #marks) }, function(input)
    --   if input == "y" then
    --     for _, node in ipairs(marks) do
    --       api.fs.remove(node)
    --     end
    --     api.marks.clear()
    --     api.tree.reload()
    --   end
    -- end)

    for _, node in ipairs(marks) do
      api.fs.remove(node)
    end
    api.marks.clear()
    api.tree.reload()
  end

  local mark_copy = function()
    local marks = api.marks.list()
    if #marks == 0 then
      table.insert(marks, api.tree.get_node_under_cursor())
    end
    for _, node in pairs(marks) do
      api.fs.copy.node(node)
    end
    api.marks.clear()
    api.tree.reload()
  end
  local mark_cut = function()
    local marks = api.marks.list()
    if #marks == 0 then
      table.insert(marks, api.tree.get_node_under_cursor())
    end
    for _, node in pairs(marks) do
      api.fs.cut(node)
    end
    api.marks.clear()
    api.tree.reload()
  end

  vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
  vim.keymap.set("n", "<down>", mark_move_j, opts("Toggle Bookmark Down"))
  vim.keymap.set("n", "<up>", mark_move_k, opts("Toggle Bookmark Up"))

  vim.keymap.set("n", "bx", mark_cut, opts("Cut File(s)"))
  vim.keymap.set("n", "bD", mark_trash, opts("Trash File(s)"))
  vim.keymap.set("n", "bd", mark_remove, opts("Remove File(s)"))
  vim.keymap.set("n", "by", mark_copy, opts("Copy File(s)"))

  vim.keymap.set("n", "bm", api.marks.bulk.move, opts("Move Bookmarked"))

  -- vim.keymap.set("n", "K", api_nvimtree.node.show_info_popup, opts("Info"))
  vim.keymap.set("n", "K", M.custom_info_popup, opts("Info"))

  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set("n", "<C-c>", api.tree.change_root_to_node, opts("CD"))
  -- vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
  vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
  vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
  vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
  vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
  -- vim.keymap.set('n', '<CR>', toggle_replace, opts('Open: In Place'))
  -- vim.keymap.set('n', '<CR>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
  -- vim.keymap.set("n", "<Tab>", api_nvimtree.node.open.preview, opts("Open Preview"))
  vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
  vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
  vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
  vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
  vim.keymap.set("n", "a", api.fs.create, opts("Create"))
  -- vim.keymap.set('n', '<leader>cr', change_root_to_global_cwd, opts('Change Root To Global CWD'))
  -- vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
  vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
  vim.keymap.set("n", "yy", api.fs.copy.node, opts("Copy"))
  vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
  vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
  vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
  vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
  vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
  -- vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
  vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
  vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
  vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
  vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
  vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
  vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
  vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
  vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
  vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
  -- vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
  -- vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
  vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
  vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
  vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
  vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
  vim.keymap.set("n", "q", api.tree.close, opts("Close"))
  vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
  vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
  vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
  vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
  vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
  vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
  vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
  vim.keymap.set("n", "c", api.fs.copy.filename, opts("Copy Name"))
  vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
  vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
  -- -- END_DEFAULT_ON_ATTACH

  -- Mappings removed via:
  --   remove_keymaps
  --   OR
  --   view.mappings.list..action = ""
  --
  -- The dummy set before del is done for safety, in case a default mapping does not exist.
  --
  -- You might tidy things by removing these along with their default mapping.
  vim.keymap.set("n", "<C-e>", "", { buffer = bufnr })
  vim.keymap.del("n", "<C-e>", { buffer = bufnr })

  -- vim.keymap.set('n', '<C-k>', '', { buffer = bufnr })
  -- vim.keymap.del('n', '<C-k>', { buffer = bufnr })

  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set("n", "<C-Enter>", api.node.open.vertical, opts("Open: Vertical Split"))
  -- vim.keymap.set('n', '<C-p>', api.node.show_info_popup, opts('Info'))
end

M.on_attach = on_attach


return M
