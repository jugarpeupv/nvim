return {
  "robitx/gp.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local conf = {
      -- openai_api_key = os.getenv("OPENAI_API_KEY"),
      -- openai_api_key = os.getenv("OPENAI_API_KEY"),
      -- For customization, refer to Install > Configuration in the Documentation/Readme
      -- providers = {
      --   openai = {
      --     endpoint = "https://api.openai.com/v1/chat/completions",
      --     secret = os.getenv("OPENAI_API_KEY_GPT"),
      --   },
      -- },
      providers = {
        copilot = {
          endpoint = "https://api.githubcopilot.com/chat/completions",
          secret = {
            "bash",
            "-c",
            "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        },
      },
      agents = {
        {
          provider = "copilot",
          name = "CopilotCommand",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          provider = "copilot",
          name = "ChatCopilot",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
      },
      hooks = {
        -- GpImplement rewrites the provided selection/range based on comments in it
        Implement = function(gp, params)
          local template = "Having following from {{filename}}:\n\n"
              .. "```{{filetype}}\n{{selection}}\n```\n\n"
              .. "Please rewrite this according to the contained instructions."
              .. "\n\nRespond exclusively with the snippet that should replace the selection above."

          local agent = gp.get_command_agent()
          gp.logger.info("Implementing selection with agent: " .. agent.name)

          gp.Prompt(
            params,
            gp.Target.rewrite,
            agent,
            template,
            nil, -- command will run directly without any prompting for user input
            nil -- no predefined instructions (e.g. speech-to-text from Whisper)
          )
        end,

        -- example of adding command which explains the selected code
        Explain = function(gp, params)
          local template = "I have the following code from {{filename}}:\n\n"
              .. "```{{filetype}}\n{{selection}}\n```\n\n"
              .. "Please respond by explaining the code above."
          local agent = gp.get_chat_agent()
          gp.Prompt(params, gp.Target.popup, agent, template)
        end,
      },
    }
    require("gp").setup(conf)

    local function keymapOptions(desc)
      return {
        noremap = true,
        silent = true,
        nowait = true,
        desc = "GPT prompt " .. desc,
      }
    end

    vim.keymap.set({ "n", "i" }, "<C-g>t", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Chat"))
    vim.keymap.set({ "n", "i" }, "<C-g>f", "<cmd>GpChatFinder<cr>", keymapOptions("Chat Finder"))

    vim.keymap.set("v", "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions("Visual Chat New vsplit"))
    vim.keymap.set({ "n", "i" }, "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", keymapOptions("New Chat vsplit"))

    vim.keymap.set({ "n", "i" }, "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", keymapOptions("New Chat tabnew"))
    vim.keymap.set("v", "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", keymapOptions("Visual Chat New tabnew"))

    vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>s", "<cmd>GpStop<cr>", keymapOptions("Stop"))
    vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>n", "<cmd>GpNextAgent<cr>", keymapOptions("Next Agent"))

    -- Chat commands
    -- vim.keymap.set({ "n", "i" }, "<C-g>c", "<cmd>GpChatNew<cr>", keymapOptions("New Chat"))
    -- vim.keymap.set({ "n", "i" }, "<C-g>t", "<cmd>GpChatToggle<cr>", keymapOptions("Toggle Chat"))
    -- vim.keymap.set({ "n", "i" }, "<C-g>f", "<cmd>GpChatFinder<cr>", keymapOptions("Chat Finder"))
    --
    -- vim.keymap.set("v", "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", keymapOptions("Visual Chat New"))
    -- vim.keymap.set("v", "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", keymapOptions("Visual Chat Paste"))
    -- vim.keymap.set("v", "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", keymapOptions("Visual Toggle Chat"))
    --
    -- vim.keymap.set({ "n", "i" }, "<C-g><C-x>", "<cmd>GpChatNew split<cr>", keymapOptions("New Chat split"))
    -- vim.keymap.set({ "n", "i" }, "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", keymapOptions("New Chat vsplit"))
    -- vim.keymap.set({ "n", "i" }, "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", keymapOptions("New Chat tabnew"))
    --
    -- vim.keymap.set("v", "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", keymapOptions("Visual Chat New split"))
    -- vim.keymap.set("v", "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", keymapOptions("Visual Chat New vsplit"))
    -- vim.keymap.set("v", "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", keymapOptions("Visual Chat New tabnew"))
    --
    -- -- Prompt commands
    -- vim.keymap.set({ "n", "i" }, "<C-g>r", "<cmd>GpRewrite<cr>", keymapOptions("Inline Rewrite"))
    -- vim.keymap.set({ "n", "i" }, "<C-g>a", "<cmd>GpAppend<cr>", keymapOptions("Append (after)"))
    -- vim.keymap.set({ "n", "i" }, "<C-g>b", "<cmd>GpPrepend<cr>", keymapOptions("Prepend (before)"))
    --
    -- vim.keymap.set("v", "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", keymapOptions("Visual Rewrite"))
    -- vim.keymap.set("v", "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", keymapOptions("Visual Append (after)"))
    -- vim.keymap.set("v", "<C-g>b", ":<C-u>'<,'>GpPrepend<cr>", keymapOptions("Visual Prepend (before)"))
    -- vim.keymap.set("v", "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", keymapOptions("Implement selection"))
    --
    -- vim.keymap.set({ "n", "i" }, "<C-g>gp", "<cmd>GpPopup<cr>", keymapOptions("Popup"))
    -- vim.keymap.set({ "n", "i" }, "<C-g>ge", "<cmd>GpEnew<cr>", keymapOptions("GpEnew"))
    -- vim.keymap.set({ "n", "i" }, "<C-g>gn", "<cmd>GpNew<cr>", keymapOptions("GpNew"))
    -- vim.keymap.set({ "n", "i" }, "<C-g>gv", "<cmd>GpVnew<cr>", keymapOptions("GpVnew"))
    -- vim.keymap.set({ "n", "i" }, "<C-g>gt", "<cmd>GpTabnew<cr>", keymapOptions("GpTabnew"))
    --
    -- vim.keymap.set("v", "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", keymapOptions("Visual Popup"))
    -- vim.keymap.set("v", "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", keymapOptions("Visual GpEnew"))
    -- vim.keymap.set("v", "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", keymapOptions("Visual GpNew"))
    -- vim.keymap.set("v", "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", keymapOptions("Visual GpVnew"))
    -- vim.keymap.set("v", "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", keymapOptions("Visual GpTabnew"))
    --
    -- vim.keymap.set({ "n", "i" }, "<C-g>x", "<cmd>GpContext<cr>", keymapOptions("Toggle Context"))
    -- vim.keymap.set("v", "<C-g>x", ":<C-u>'<,'>GpContext<cr>", keymapOptions("Visual Toggle Context"))
    --
    -- vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>s", "<cmd>GpStop<cr>", keymapOptions("Stop"))
    -- vim.keymap.set({ "n", "i", "v", "x" }, "<C-g>n", "<cmd>GpNextAgent<cr>", keymapOptions("Next Agent"))
    --
    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
}
