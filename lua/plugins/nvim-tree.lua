-- return {}
return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
    -- priority = 500,
    dependencies = {
      {
        "nvim-tree/nvim-web-devicons",
        cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
        -- lazy = true,
        -- priority = 800,
        opts = require("jg.custom.dev-icons").options,
      },
    },
    opts = {
      ui = {
        confirm = {
          trash = false,
          remove = true,
        },
      },
      -- BEGIN_DEFAULT_OPTS
      auto_reload_on_write = true,
      disable_netrw = true,
      -- disable_netrw = false,
      hijack_cursor = true,
      hijack_netrw = true,
      -- hijack_netrw = false,
      hijack_unnamed_buffer_when_opening = true,
      sort_by = "name",
      sync_root_with_cwd = true,
      -- prefer_startup_root = true,
      -- *nvim-tree.prefer_startup_root*
      -- Prefer startup root directory when updating root directory of the tree.
      -- Only relevant when `update_focused_file.update_root` is `true`
      -- Type: `boolean`, Default: `false`
      respect_buf_cwd = false,
      on_attach = require("jg.custom.nvim-tree-attach").on_attach,
      live_filter = {
        always_show_folders = false,
      },
      modified = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = false,
      },
      view = {
        -- width = 45,
        width = 50,
        -- height = 30,
        -- hide_root_folder = false,
        side = "left",
        preserve_window_proportions = true,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
      },
      renderer = {
        indent_markers = {
          enable = true,
          icons = {
            -- corner = "└ ",
            corner = "│ ",
            edge = "│ ",
            none = "  ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "after",
          modified_placement = "after",
          diagnostics_placement = "after",
          bookmarks_placement = "signcolumn",
          padding = " ",
          -- symlink_arrow = " ➛ ",
          symlink_arrow = "  ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = true,
            diagnostics = true,
            bookmarks = true,
          },
          glyphs = {
            default = "",
            modified = "[!]",
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "󱞞",
              empty_open = "󱞞",
              symlink = "",
              symlink_open = "",
            },
            git = {
              staged = "+",
              unstaged = "!",
              renamed = "󰕛 ",
              unmerged = " ",
              untracked = "?",
              deleted = "󰧧",
              ignored = " ",
            },
          },
        },
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      update_focused_file = {
        enable = false,
        update_root = { enable = false },
      },
      system_open = {
        cmd = "",
        args = {},
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = false,
        debounce_delay = 30,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = "󰠠 ",
          info = " ",
          warning = " ",
          error = " ",
        },
      },
      filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
      },
      git = {
        ignore = false,
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        disable_for_dirs = {},
        timeout = 4000,
        cygwin_support = false,
      },
      filesystem_watchers = {
        enable = false,
        debounce_delay = 30,
        ignore_dirs = { "node_modules" },
      },
      actions = {
        use_system_clipboard = true,
        file_popup = {
          open_win_config = {
            col = 1,
            row = 1,
            relative = "cursor",
            border = "rounded",
            style = "minimal",
          },
        },
        change_dir = {
          enable = true,
          global = true,
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = false,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          git = false,
          profile = false,
        },
      },
    },
  },
}
