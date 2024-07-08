-- return {}
return {
  {
    "yioneko/nvim-vtsls",
    event = "VeryLazy",
    config = function()
      require("vtsls").config({
        refactor_auto_rename = true,
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      local cfg = {
        debug = false,                                          -- set to true to enable debug logging
        log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
        -- default is  ~/.cache/nvim/lsp_signature.log
        verbose = false,                                        -- show debug line number

        bind = true,                                            -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 10,                                         -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
        -- set to 0 if you DO NOT want any API comments be shown
        -- This setting only take effect in insert mode, it does not affect signature help in normal
        -- mode, 10 by default

        max_height = 12,                   -- max height of signature floating_window
        max_width = 80,                    -- max_width of signature floating_window, line will be wrapped if exceed max_width
        -- the value need >= 40
        wrap = true,                       -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
        floating_window = false,           -- show hint in a floating window, set to false for virtual text only mode

        floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
        -- will set to true when fully tested, set to false will use whichever side has more space
        -- this setting will be helpful if you do not want the PUM and floating win overlap

        floating_window_off_x = 1, -- adjust float windows x position.
        -- can be either a number or function
        floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
        -- can be either number or function, see examples

        close_timeout = 4000, -- close floating window after ms when laster parameter is entered
        fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
        hint_enable = false, -- virtual hint enable
        hint_prefix = "🐼 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
        hint_scheme = "String",
        hint_inline = function()
          return false
        end, -- should the hint be inline(nvim 0.10 only)?  default false
        -- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
        -- return 'right_align' to display hint right aligned in the current line
        hi_parameter = "SignatureActiveParameter", -- how your parameter will be highlight
        handler_opts = {
          border = "rounded",                  -- double, rounded, single, shadow, none, or a table of borders
        },

        always_trigger = false,               -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

        auto_close_after = nil,               -- autoclose signature float win after x sec, disabled if nil.
        extra_trigger_chars = {},             -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        zindex = 200,                         -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

        padding = "",                         -- character to pad on left and right of signature can be ' ', or '|'  etc

        transparency = nil,                   -- disabled by default, allow floating win transparent value 1~100
        shadow_blend = 36,                    -- if you using shadow as border use this set the opacity
        shadow_guibg = "Black",               -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
        timer_interval = 200,                 -- default timer check interval set to lower value if you want to reduce latency
        toggle_key = "<C-x>",                 -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
        toggle_key_flip_floatwin_setting = false, -- true: toggle float setting after toggle key pressed

        select_signature_key = "<C-w>",       -- cycle to next signature, e.g. '<M-n>' function overloading
        move_cursor_key = "<C-y>",            -- imap, use nvim_set_current_win to move cursor between current win and floating
      }

      -- recommended:
      require("lsp_signature").setup(cfg) -- no need to specify bufnr if you don't use toggle_key
    end,
  },
  {
    event = "VeryLazy",
    -- event = "User FilePost",
    "neovim/nvim-lspconfig",
    config = function()
      -- import lspconfig plugin safely
      local on_attach = require("jg.custom.lsp-utils").attach_lsp_config
      local lspconfig_status, lspconfig = pcall(require, "lspconfig")
      if not lspconfig_status then
        return
      end

      -- import cmp-nvim-lsp plugin safely
      local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if not cmp_nvim_lsp_status then
        return
      end

      -- import typescript plugin safely
      -- local typescript_setup, typescript = pcall(require, "typescript")
      -- if not typescript_setup then
      --   return
      -- end

      local root_pattern = require("lspconfig.util").root_pattern

      local calculate_angularls_root_dir = function()
        local function read_file(file_path)
          local file = io.open(file_path, "r")
          if not file then
            return nil
          end

          local content = file:read("*a")
          file:close()

          return content
        end

        -- Function to check if a specific dependency is present in the package.json file
        local function has_dependency(package_json_content, dependency_name)
          local package_data = vim.json.decode(package_json_content)
          local dependencies = package_data.dependencies

          return dependencies and dependencies[dependency_name] ~= nil
        end

        -- Example usage
        local package_json_path = "package.json"
        if pcall(read_file, package_json_path) then
          local package_json_content = read_file(package_json_path)

          if package_json_content then
            local dependency_name = "@angular/core"
            local hasAngularCore = has_dependency(package_json_content, dependency_name)

            if hasAngularCore then
              return root_pattern("angular.json", "nx.json", "project.json")
            else
              return root_pattern("inventado")
            end
          else
            return root_pattern("inventado")
          end
        else
          return root_pattern("inventado")
        end
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Change the Diagnostic symbols in the sign column (gutter)
      -- (not in youtube nvim video)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local signs_diag = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        -- { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignHint", text = "󰠠" },
        -- { name = "DiagnosticSignInfo", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
      }

      local config = {
        virtual_text = false,
        -- virtual_text = { spacing = 4, prefix = "●" },
        -- virtual_text = { spacing = 4, prefix = "" },
        -- virtual_text = { spacing = 4, prefix = " " },

        signs = {
          active = signs_diag,
        },
        update_in_insert = true,
        -- update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }

      vim.diagnostic.config(config)

      -- configure html server
      lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "myangular", "html", "templ" },
      })

      require("lspconfig").vtsls.setup({
        settings = {
          typescript = {
            preferences = {
              -- other preferences...
              importModuleSpecifier = "relative",
              importModuleSpecifierEnding = "minimal",
            },
            inlayHints = {

              --           includeInlayEnumMemberValueHints = false,
              --           includeInlayFunctionLikeReturnTypeHints = false,
              --           includeInlayFunctionParameterTypeHints = true,
              --           includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              --           includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              --           includeInlayPropertyDeclarationTypeHints = false,
              --           includeInlayVariableTypeHints = false,
              parameterNames = { enabled = "all" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = false },
              enumMemberValues = { enabled = true },
            },
          },
        },
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- require'lspconfig'.html.setup{
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- }

      -- configure typescript server with plugin
      -- typescript.setup({
      --   server = {
      --     capabilities = capabilities,
      --     on_attach = on_attach,
      --     -- root_dir = root_pattern("tsconfig.base.json", "package.json", "jsconfig.json", ".git", "tsconfig.json"),
      --     -- root_dir = root_pattern("tsconfig.base.json", "package.json", ".git"),
      --     -- root_dir = root_pattern("tsconfig.base.json", ".git"),
      --     -- root_dir = root_pattern("tsconfig.json","tsconfig.base.json", ".git"),
      --     root_dir = root_pattern("tsconfig.base.json", "package.json", "jsconfig.json", ".git"),
      --     settings = {
      --       javascript = {
      --         inlayHints = {
      --           includeInlayEnumMemberValueHints = true,
      --           includeInlayFunctionLikeReturnTypeHints = false,
      --           includeInlayFunctionParameterTypeHints = true,
      --           includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
      --           includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      --           includeInlayPropertyDeclarationTypeHints = false,
      --           includeInlayVariableTypeHints = false,
      --         },
      --       },
      --       typescript = {
      --         inlayHints = {
      --           includeInlayEnumMemberValueHints = false,
      --           includeInlayFunctionLikeReturnTypeHints = false,
      --           includeInlayFunctionParameterTypeHints = true,
      --           includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
      --           includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      --           includeInlayPropertyDeclarationTypeHints = false,
      --           includeInlayVariableTypeHints = false,
      --         },
      --       },
      --     },
      --   },
      -- })

      -- configure css server
      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- lspconfig["pyright"].setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      -- configure tailwindcss server
      lspconfig["tailwindcss"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        root_dir = root_pattern(
          "tailwind.config.js",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.ts"
        ),
      })

      local ok, mason_registry = pcall(require, "mason-registry")
      if not ok then
        vim.notify("mason-registry could not be loaded")
        return
      end

      local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()

      local angular_cmd = {
        "ngserver",
        "--stdio",
        "--tsProbeLocations",
        table.concat({
          angularls_path,
          vim.uv.cwd(),
        }, ","),
        "--ngProbeLocations",
        table.concat({
          angularls_path .. "/node_modules/@angular/language-server",
          vim.uv.cwd(),
        }, ","),
      }

      lspconfig["angularls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = angular_cmd,
        on_new_config = function(new_config, _)
          new_config.cmd = angular_cmd
        end,
        filetypes = { "typescript", "myangular", "html", "typescriptreact", "typescript.tsx" },
        -- root_dir = root_pattern("angular.json", "project.json"),
        -- root_dir = root_pattern("angular.json", "nx.json"),
        root_dir = calculate_angularls_root_dir(),
      })

      lspconfig["groovyls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = {
          ["textDocument/publishDiagnostics"] = function() end,
        },
        cmd = {
          "java",
          "-jar",
          "/Users/jgarcia/.config/groovy-language-server/build/libs/groovy-language-server-all.jar",
          -- "~/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar",
        },
      })

      lspconfig["bashls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      local capabilities_json_ls = vim.lsp.protocol.make_client_capabilities()
      capabilities_json_ls.textDocument.completion.completionItem.snippetSupport = true

      lspconfig["eslint"].setup({
        root_dir = function(filename)
          if string.find(filename, "node_modules/") then
            return nil
          end
          return require("lspconfig.server_configurations.eslint").default_config.root_dir(filename)
        end,
        settings = {
          codeAction = {
            disableRuleComment = {
              enable = true,
              location = "separateLine",
            },
            showDocumentation = {
              enable = true,
            },
          },
          codeActionOnSave = {
            enable = false,
            mode = "all",
          },
          experimental = {
            useFlatConfig = false,
          },
          format = true,
          -- nodePath = "",
          onIgnoredFiles = "off",
          problems = {
            shortenToSingleLine = false,
          },
          quiet = false,
          rulesCustomizations = {},
          run = "onType",
          useESLintClass = false,
          validate = "on",
          workingDirectory = {
            mode = "location",
          },
        },
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
          "javascript",
          "html",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue",
          "svelte",
          "astro",
        },
      })

      -- lspconfig["yamlls"].setup {
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   settings = {
      --     yaml = {
      --       schemaStore = {
      --         -- You must disable built-in schemaStore support if you want to use
      --         -- this plugin and its advanced options like `ignore`.
      --         enable = false,
      --         -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
      --         url = "",
      --       },
      --       schemas = require('schemastore').yaml.schemas(),
      --     },
      --   },
      -- }

      require("lspconfig").yamlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            },
            -- schemas = require('schemastore').yaml.schemas(),
          },
        },
      })

      lspconfig["jsonls"].setup({
        -- filetypes = { "json", "jsonc" },
        on_attach = on_attach,
        capabilities = capabilities_json_ls,
        -- capabilities = capabilities,
        filetypes = { "json", "jsonc", "json5" },
        settings = {
          json = {
            schemas = require("schemastore").json.schemas({
              -- extra = {
              --   {
              --     description = 'My custom JSON schema',
              --     fileMatch = 'project.json',
              --     name = 'project.json',
              --     url = 'https://github.com/nrwl/nx/blob/master/packages/nx/schemas/project-schema.json',
              --   }
              -- }
              -- ignore = {
              --   -- 'catalog-info.yaml',
              --   -- 'mkdocs.yml'
              -- }
            }),
            validate = { enable = true },
          },
        },
      })

      lspconfig["rust_analyzer"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = true,
            },
          },
        },
      })

      -- lspconfig["jdtls"].setup({
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      -- })

      lspconfig["dockerls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      require("lspconfig").docker_compose_language_service.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- require("lspconfig").cssmodules_ls.setup({
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      -- })

      -- require'lspconfig'.markdown_oxide.setup{
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      -- }

      lspconfig["marksman"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- require("lspconfig").nxls.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      -- require("lspconfig").emmet_language_server.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      -- require'lspconfig'.emmet_language_server.setup{}

      require("lspconfig").emmet_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure lua server (with special settings)
      -- lspconfig["lua_ls"].setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      --   settings = { -- custom settings for lua
      --     Lua = {
      --       -- make the language server recognize "vim" global
      --       diagnostics = {
      --         globals = { "vim", "jit", "bit", "Config" },
      --       },
      --       workspace = {
      --         -- make language server aware of runtime files
      --         library = {
      --           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
      --           [vim.fn.stdpath("config") .. "/lua"] = true,
      --         },
      --       },
      --     },
      --   },
      -- })

      require("lspconfig").clangd.setup({
        on_attach = on_attach,
        capabilities = cmp_nvim_lsp.default_capabilities(),
        cmd = {
          "clangd",
          "--offset-encoding=utf-16",
        },
      })

      require("lspconfig").clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if
              not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
          then
            client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
              Lua = {

                diagnostics = {
                  globals = { "vim", "jit", "bit", "Config" },
                },
                runtime = {
                  -- Tell the language server which version of Lua you're using
                  -- (most likely LuaJIT in the case of Neovim)
                  version = "LuaJIT",
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME,
                    -- [vim.fn.stdpath("config") .. "/lua"] = true,
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                  },
                  -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                  -- library = vim.api.nvim_get_runtime_file("", true)
                },
              },
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          end
          return true
        end,
      })
    end,
  },
}
