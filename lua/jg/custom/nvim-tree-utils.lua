local utils = require("nvim-tree.utils")
local current_popup = nil
local api = require("nvim-tree.api")


local M = {}

M.change_root_to_global_cwd = function(api)
  local global_cwd = vim.fn.getcwd(-1, -1)
  api.tree.change_root(global_cwd)
end

M.custom_info_popup = function()
  local node = api.tree.get_node_under_cursor()
  custom_toggle_file_info(node)
end



return M
