-- -- Lua
-- local cb = require("diffview.config").diffview_callback
--
-- require("diffview").setup({
-- 	diff_binaries = false, -- Show diffs for binaries
-- 	enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
-- 	use_icons = true, -- Requires nvim-web-devicons
-- 	icons = { -- Only applies when use_icons is true.
-- 		folder_closed = "",
-- 		folder_open = "",
-- 	},
-- 	signs = {
-- 		folder_closed = "",
-- 		folder_open = "",
-- 	},
-- 	view = {
-- 		-- Configure the layout and behavior of different types of views.
-- 		-- Available layouts:
-- 		--  'diff1_plain'
-- 		--    |'diff2_horizontal'
-- 		--    |'diff2_vertical'
-- 		--    |'diff3_horizontal'
-- 		--    |'diff3_vertical'
-- 		--    |'diff3_mixed'
-- 		--    |'diff4_mixed'
-- 		-- For more info, see ':h diffview-config-view.x.layout'.
-- 		default = {
-- 			-- Config for changed files, and staged files in diff views.
-- 			layout = "diff2_horizontal",
-- 		},
-- 		merge_tool = {
-- 			-- Config for conflicted files in diff views during a merge or rebase.
-- 			layout = "diff1_plain",
-- 			disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
-- 		},
-- 		file_history = {
-- 			-- Config for changed files in file history views.
-- 			layout = "diff2_horizontal",
-- 		},
-- 	},
-- 	file_panel = {
-- 		win_config = {
-- 			position = "left", -- One of 'left', 'right', 'top', 'bottom'
-- 			width = 35, -- Only applies when position is 'left' or 'right'
-- 			height = 10, -- Only applies when position is 'top' or 'bottom'
-- 		},
-- 		listing_style = "tree", -- One of 'list' or 'tree'
-- 		tree_options = { -- Only applies when listing_style is 'tree'
-- 			flatten_dirs = true, -- Flatten dirs that only contain one single dir
-- 			folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
-- 		},
-- 	},
-- 	file_history_panel = {
-- 		win_config = {
-- 			position = "bottom",
-- 			width = 35,
-- 			height = 16,
-- 		},
-- 		log_options = {
-- 			single_file = {
-- 				max_count = 256, -- Limit the number of commits
-- 				follow = false, -- Follow renames (only for single file)
-- 				all = false, -- Include all refs under 'refs/' including HEAD
-- 				merges = false, -- List only merge commits
-- 				no_merges = false, -- List no merge commits
-- 				reverse = false, -- List commits in reverse order
-- 			},
-- 			multi_file = {
-- 				single_file = {
-- 					max_count = 256, -- Limit the number of commits
-- 					follow = false, -- Follow renames (only for single file)
-- 					all = false, -- Include all refs under 'refs/' including HEAD
-- 					merges = false, -- List only merge commits
-- 					no_merges = false, -- List no merge commits
-- 					reverse = false, -- List commits in reverse order
-- 				},
-- 			},
-- 		},
-- 	},
-- 	default_args = { -- Default args prepended to the arg-list for the listed commands
-- 		DiffviewOpen = {},
-- 		DiffviewFileHistory = {},
-- 	},
-- 	hooks = {}, -- See ':h diffview-config-hooks'
-- 	key_bindings = {
-- 		disable_defaults = true, -- Disable the default key bindings
-- 		-- The `view` bindings are active in the diff buffers, only when the current
-- 		-- tabpage is a Diffview.
-- 		view = {
-- 			["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
-- 			["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
-- 			["gf"] = cb("goto_file"), -- Open the file in a new split in previous tabpage
-- 			["<C-w><C-f>"] = cb("goto_file_split"), -- Open the file in a new split
-- 			["<C-w>gf"] = cb("goto_file_tab"), -- Open the file in a new tabpage
-- 			["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
-- 			["<leader>f"] = cb("toggle_files"), -- Toggle the files panel.
-- 		},
-- 		file_panel = {
-- 			["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
-- 			["<down>"] = cb("next_entry"),
-- 			["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
-- 			["<up>"] = cb("prev_entry"),
-- 			["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
-- 			["o"] = cb("select_entry"),
-- 			["<2-LeftMouse>"] = cb("select_entry"),
-- 			["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
-- 			["S"] = cb("stage_all"), -- Stage all entries.
-- 			["U"] = cb("unstage_all"), -- Unstage all entries.
-- 			["X"] = cb("restore_entry"), -- Restore entry to the state on the left side.
-- 			["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
-- 			["<tab>"] = cb("select_next_entry"),
-- 			["<s-tab>"] = cb("select_prev_entry"),
-- 			["gf"] = cb("goto_file"),
-- 			["<C-w><C-f>"] = cb("goto_file_split"),
-- 			["<C-w>gf"] = cb("goto_file_tab"),
-- 			["i"] = cb("listing_style"), -- Toggle between 'list' and 'tree' views
-- 			["f"] = cb("toggle_flatten_dirs"), -- Flatten empty subdirectories in tree listing style.
-- 			["<leader>e"] = cb("focus_files"),
-- 			["<leader>f"] = cb("toggle_files"),
-- 		},
-- 		file_history_panel = {
-- 			["g!"] = cb("options"), -- Open the option panel
-- 			["<C-A-d>"] = cb("open_in_diffview"), -- Open the entry under the cursor in a diffview
-- 			["y"] = cb("copy_hash"), -- Copy the commit hash of the entry under the cursor
-- 			["zR"] = cb("open_all_folds"),
-- 			["zM"] = cb("close_all_folds"),
-- 			["j"] = cb("next_entry"),
-- 			["<down>"] = cb("next_entry"),
-- 			["k"] = cb("prev_entry"),
-- 			["<up>"] = cb("prev_entry"),
-- 			["<cr>"] = cb("select_entry"),
-- 			["o"] = cb("select_entry"),
-- 			["<2-LeftMouse>"] = cb("select_entry"),
-- 			["<tab>"] = cb("select_next_entry"),
-- 			["<s-tab>"] = cb("select_prev_entry"),
-- 			["gf"] = cb("goto_file"),
-- 			["<C-w><C-f>"] = cb("goto_file_split"),
-- 			["<C-w>gf"] = cb("goto_file_tab"),
-- 			["<leader>e"] = cb("focus_files"),
-- 			["<leader>f"] = cb("toggle_files"),
-- 		},
-- 		option_panel = {
-- 			["<tab>"] = cb("select"),
-- 			["q"] = cb("close"),
-- 		},
-- 	},
-- })





-- Lua
local actions = require("diffview.actions")

require("diffview").setup({
  diff_binaries = false,    -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  git_cmd = { "git" },      -- The git executable followed by default args.
  use_icons = true,         -- Requires nvim-web-devicons
  watch_index = true,       -- Update views and index buffers when the git index changes.
  icons = {                 -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    -- fold_closed = "",
    -- fold_open = "",
    done = "✓",
    folder_closed = "",
    folder_open = "",
  },
  view = {
    -- Configure the layout and behavior of different types of views.
    -- Available layouts: 
    --  'diff1_plain'
    --    |'diff2_horizontal'
    --    |'diff2_vertical'
    --    |'diff3_horizontal'
    --    |'diff3_vertical'
    --    |'diff3_mixed'
    --    |'diff4_mixed'
    -- For more info, see ':h diffview-config-view.x.layout'.
    default = {
      -- Config for changed files, and staged files in diff views.
      layout = "diff2_horizontal",
    },
    merge_tool = {
      -- Config for conflicted files in diff views during a merge or rebase.
      -- layout = "diff3_horizontal",
      layout = "diff1_plain",
      disable_diagnostics = true,   -- Temporarily disable diagnostics for conflict buffers while in the view.
    },
    file_history = {
      -- Config for changed files in file history views.
      layout = "diff2_horizontal",
    },
  },
  file_panel = {
    listing_style = "tree",             -- One of 'list' or 'tree'
    tree_options = {                    -- Only applies when listing_style is 'tree'
      flatten_dirs = true,              -- Flatten dirs that only contain one single dir
      folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
    },
    win_config = {                      -- See ':h diffview-config-win_config'
      position = "left",
      width = 35,
      win_opts = {}
    },
  },
  file_history_panel = {
    log_options = {   -- See ':h diffview-config-log_options'
      single_file = {
        diff_merges = "combined",
      },
      multi_file = {
        diff_merges = "first-parent",
      },
    },
    win_config = {    -- See ':h diffview-config-win_config'
      position = "bottom",
      height = 16,
      win_opts = {}
    },
  },
  commit_log_panel = {
    win_config = {   -- See ':h diffview-config-win_config'
      win_opts = {},
    }
  },
  default_args = {    -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},         -- See ':h diffview-config-hooks'
  keymaps = {
    disable_defaults = true, -- Disable the default keymaps
    view = {
      -- The `view` bindings are active in the diff buffers, only when the current
      -- tabpage is a Diffview.
      ["<tab>"]      = actions.select_next_entry,         -- Open the diff for the next file
      ["<s-tab>"]    = actions.select_prev_entry,         -- Open the diff for the previous file
      ["gf"]         = actions.goto_file,                 -- Open the file in a new split in the previous tabpage
      ["<C-w><C-f>"] = actions.goto_file_split,           -- Open the file in a new split
      ["<C-w>gf"]    = actions.goto_file_tab,             -- Open the file in a new tabpage
      ["<leader>e"]  = actions.focus_files,               -- Bring focus to the file panel
      ["<leader>b"]  = actions.toggle_files,              -- Toggle the file panel.
      ["g<C-x>"]     = actions.cycle_layout,              -- Cycle through available layouts.
      ["[x"]         = actions.prev_conflict,             -- In the merge_tool: jump to the previous conflict
      ["]x"]         = actions.next_conflict,             -- In the merge_tool: jump to the next conflict
      ["<leader>co"] = actions.conflict_choose("ours"),   -- Choose the OURS version of a conflict
      ["<leader>ct"] = actions.conflict_choose("theirs"), -- Choose the THEIRS version of a conflict
      ["<leader>cb"] = actions.conflict_choose("base"),   -- Choose the BASE version of a conflict
      ["<leader>ca"] = actions.conflict_choose("all"),    -- Choose all the versions of a conflict
      ["dx"]         = actions.conflict_choose("none"),   -- Delete the conflict region
    },
    diff1 = { --[[ Mappings in single window diff layouts ]] },
    diff2 = { --[[ Mappings in 2-way diff layouts ]] },
    diff3 = {
      -- Mappings in 3-way diff layouts
      { { "n", "x" }, "2do", actions.diffget("ours") },   -- Obtain the diff hunk from the OURS version of the file
      { { "n", "x" }, "3do", actions.diffget("theirs") }, -- Obtain the diff hunk from the THEIRS version of the file
    },
    diff4 = {
      -- Mappings in 4-way diff layouts
      { { "n", "x" }, "1do", actions.diffget("base") },   -- Obtain the diff hunk from the BASE version of the file
      { { "n", "x" }, "2do", actions.diffget("ours") },   -- Obtain the diff hunk from the OURS version of the file
      { { "n", "x" }, "3do", actions.diffget("theirs") }, -- Obtain the diff hunk from the THEIRS version of the file
    },
    file_panel = {
      ["j"]             = actions.next_entry,         -- Bring the cursor to the next file entry
      ["<down>"]        = actions.next_entry,
      ["k"]             = actions.prev_entry,         -- Bring the cursor to the previous file entry.
      ["<up>"]          = actions.prev_entry,
      ["<cr>"]          = actions.select_entry,       -- Open the diff for the selected entry.
      ["o"]             = actions.select_entry,
      ["<2-LeftMouse>"] = actions.select_entry,
      ["-"]             = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
      ["S"]             = actions.stage_all,          -- Stage all entries.
      ["U"]             = actions.unstage_all,        -- Unstage all entries.
      ["X"]             = actions.restore_entry,      -- Restore entry to the state on the left side.
      ["L"]             = actions.open_commit_log,    -- Open the commit log panel.
      ["<c-b>"]         = actions.scroll_view(-0.25), -- Scroll the view up
      ["<c-f>"]         = actions.scroll_view(0.25),  -- Scroll the view down
      ["<tab>"]         = actions.select_next_entry,
      ["<s-tab>"]       = actions.select_prev_entry,
      ["gf"]            = actions.goto_file,
      ["<C-w><C-f>"]    = actions.goto_file_split,
      ["<C-w>gf"]       = actions.goto_file_tab,
      ["i"]             = actions.listing_style,        -- Toggle between 'list' and 'tree' views
      ["f"]             = actions.toggle_flatten_dirs,  -- Flatten empty subdirectories in tree listing style.
      ["R"]             = actions.refresh_files,        -- Update stats and entries in the file list.
      ["<leader>e"]     = actions.focus_files,
      ["<leader>b"]     = actions.toggle_files,
      ["g<C-x>"]        = actions.cycle_layout,
      ["[x"]            = actions.prev_conflict,
      ["]x"]            = actions.next_conflict,
    },
    file_history_panel = {
      ["g!"]            = actions.options,          -- Open the option panel
      ["<C-A-d>"]       = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
      ["y"]             = actions.copy_hash,        -- Copy the commit hash of the entry under the cursor
      ["L"]             = actions.open_commit_log,
      ["zR"]            = actions.open_all_folds,
      ["zM"]            = actions.close_all_folds,
      ["j"]             = actions.next_entry,
      ["<down>"]        = actions.next_entry,
      ["k"]             = actions.prev_entry,
      ["<up>"]          = actions.prev_entry,
      ["<cr>"]          = actions.select_entry,
      ["o"]             = actions.select_entry,
      ["<2-LeftMouse>"] = actions.select_entry,
      ["<c-b>"]         = actions.scroll_view(-0.25),
      ["<c-f>"]         = actions.scroll_view(0.25),
      ["<tab>"]         = actions.select_next_entry,
      ["<s-tab>"]       = actions.select_prev_entry,
      ["gf"]            = actions.goto_file,
      ["<C-w><C-f>"]    = actions.goto_file_split,
      ["<C-w>gf"]       = actions.goto_file_tab,
      ["<leader>e"]     = actions.focus_files,
      ["<leader>b"]     = actions.toggle_files,
      ["g<C-x>"]        = actions.cycle_layout,
    },
    option_panel = {
      ["<tab>"] = actions.select_entry,
      ["q"]     = actions.close,
    },
  },
})
