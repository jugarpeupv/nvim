return {
  "amitds1997/remote-nvim.nvim",
  version = "*", -- Pin to GitHub releases
  -- keys = { { "n" } }
  keys = { { "<leader>Rs", mode = { "n" }, "<cmd>RemoteStart<cr>" } },
  cmd = { "RemoteStart", "RemoteStop", "RemoteInfo", "RemoteCleanup", "RemoteConfigDel", "RemoteLog" },
  dependencies = {
    "nvim-lua/plenary.nvim",       -- For standard functions
    "MunifTanjim/nui.nvim",        -- To build the plugin UI
    "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
  },
  config = true,
  -- opts = {
  --   devpod = {
  --     binary = "devpod", -- Binary to use for devpod
  --     docker_binary = "docker", -- Binary to use for docker-related commands
  --     ---@diagnostic disable-next-line:param-type-mismatch
  --     -- ssh_config_path = utils.path_join(utils.is_windows, vim.fn.stdpath("data"), constants.PLUGIN_NAME, "ssh_config"), -- Path where devpod SSH configurations should be stored
  --     search_style = "current_dir_only", -- How should devcontainers be searched
  --     -- For dotfiles, see https://devpod.sh/docs/developing-in-workspaces/dotfiles-in-a-workspace for more information
  --     dotfiles = {
  --       path = nil, -- Path to your dotfiles which should be copied into devcontainers
  --       install_script = nil -- Install script that should be called to install your dotfiles
  --     },
  --     gpg_agent_forwarding = false, -- Should GPG agent be forwarded over the network
  --     container_list = "all", -- How should docker list containers ("running_only" or "all")
  --   },
  -- }

  opts = {
    progress_view = {
      type = "split",
    },
    offline_mode = {
      enabled = true,
      no_github = false,
    },
    remote = {
      app_name = "nvim", -- This directly maps to the value NVIM_APPNAME. If you use any other paths for configuration, also make sure to set this.
      -- List of directories that should be copied over
      copy_dirs = {
        -- What to copy to remote's Neovim config directory
        config = {
          base = vim.fn.stdpath("config"), -- Path from where data has to be copied
          dirs = "*",                 -- Directories that should be copied over. "*" means all directories. To specify a subset, use a list like {"lazy", "mason"} where "lazy", "mason" are subdirectories
          -- under path specified in `base`.
          compression = {
            enabled = true, -- Should compression be enabled or not
            additional_opts = {}, -- Any additional options that should be used for compression. Any argument that is passed to `tar` (for compression) can be passed here as separate elements.
          },
        },
        -- What to copy to remote's Neovim data directory
        -- data = {
        --   base = vim.fn.stdpath("data"),
        --   dirs = "*",
        --   compression = {
        --     enabled = true,
        --   },
        -- },
        -- -- What to copy to remote's Neovim cache directory
        -- cache = {
        --   base = vim.fn.stdpath("cache"),
        --   dirs = "*",
        --   compression = {
        --     enabled = true,
        --   },
        -- },
        -- -- What to copy to remote's Neovim state directory
        -- state = {
        --   base = vim.fn.stdpath("state"),
        --   dirs = "*",
        --   compression = {
        --     enabled = true,
        --   },
        -- },
      },
    },

    -- You can supply your own callback that should be called to create the local client. This is the default implementation.
    -- Two arguments are passed to the callback:
    -- port: Local port at which the remote server is available
    -- workspace_config: Workspace configuration for the host. For all the properties available, see https://github.com/amitds1997/remote-nvim.nvim/blob/main/lua/remote-nvim/providers/provider.lua#L4
    -- A sample implementation using WezTerm tab is at: https://github.com/amitds1997/remote-nvim.nvim/wiki/Configuration-recipes
    client_callback = function(port, workspace_config)
      -- local cmd = ("wezterm cli set-tab-title --pane-id $(wezterm cli spawn nvim --server localhost:%s --remote-ui) %s")
      -- :format(
      --   port,
      --   ("'Remote: %s'"):format(workspace_config.host)
      -- )
      local cmd = ""
      if vim.env.TERM == "xterm-kitty" then
        cmd = ("kitty -e nvim --server localhost:%s --remote-ui"):format(port)
      end
      vim.fn.jobstart(cmd, {
        detach = true,
        on_exit = function(job_id, exit_code, event_type)
          -- This function will be called when the job exits
          print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
        end,
      })
    end,
  },
}
