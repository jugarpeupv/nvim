local M = {}
local cfg = {
  save_dir = vim.fn.stdpath("data") .. "/jg_worktrees",
}

M.create_path = function(path)
  vim.fn.mkdir(path, "p")
end

M.get_path_sep = function()
  if jit then
    if jit.os == "Windows" then
      return "\\"
    else
      return "/"
    end
  else
    return package.config:sub(1, 1)
  end
end

M.get_bps_path = function(path)
  local path_sep = M.get_path_sep()
  local base_filename = path or vim.fn.getcwd()

  if jit and jit.os == "Windows" then
    base_filename = base_filename:gsub(":", "_")
  end

  local cp_filename = base_filename:gsub(path_sep, "_") .. ".json"
  return cfg.save_dir .. path_sep .. cp_filename
end

M.load_bps = function(path)
  local fp = io.open(path, "r")
  local bps = {}
  if fp ~= nil then
    local load_bps_raw = fp:read("*a")
    bps = vim.fn.json_decode(load_bps_raw)
    fp:close()
  end
  return bps
end

M.write_bps = function(path, bps)
  bps = bps or {}
  assert(
    type(bps) == "table",
    "Last worktree data should be stored in a table. Usually it is not the user's problem if you did not call the write_bps function explicitly."
  )

  local fp = io.open(path, "w+")
  if fp == nil then
    vim.notify("Failed to save last worktree. File: " .. vim.fn.expand("%"), "WARN")
    return false
  else
    fp:write(vim.fn.json_encode(bps))
    fp:close()
    return true
  end
end

M.is_bare = function(path)
  local is_bare_result = vim.system({ "git", "rev-parse", "--is-bare-repository" }, { cwd = path }):wait()
  local is_bare = false
  if is_bare_result.stdout ~= nil and string.len(is_bare_result.stdout) > 1 and string.find(is_bare_result.stdout, "true") then
    is_bare = true
  end
  return is_bare
end

return M
