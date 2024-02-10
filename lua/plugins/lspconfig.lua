-- return {}
return {
  event = "VeryLazy",
  "neovim/nvim-lspconfig",
  config = function()
    -- import lspconfig plugin safely
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
    local typescript_setup, typescript = pcall(require, "typescript")
    if not typescript_setup then
      return
    end

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
          -- print('hasAngularCore:', hasAngularCore);
          -- print(hasAngularCore);

          if hasAngularCore then
            return root_pattern("angular.json", "nx.json", "project.json")
          else
            return root_pattern("inventado")
          end
        else
          return root_pattern("inventado")
        end
      else
        return root_pattern('inventado')
      end
    end

    local keymap = vim.keymap -- for conciseness

    -- local navic = require("nvim-navic")
    -- enable keybinds only for when lsp server available
    local on_attach = function(client, bufnr)
      -- if client.server_capabilities.documentSymbolProvider then
      --   navic.attach(client, bufnr)
      -- end
      -- keybind options
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- set keybinds
      keymap.set("n", "gI", "<cmd>Lspsaga finder<CR>", opts)                     -- show definition, references
      -- keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
      keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
      keymap.set("n", "<leader>gD", "<cmd>Lspsaga peek_definition<CR>", opts)            -- see definition and make edits in window
      keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)       -- see definition and make edits in window
      keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
      keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)        -- see available code actions
      keymap.set("n", "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

      keymap.set(
        "n",
        "gR",
        "<cmd>lua require('telescope.builtin').lsp_references({ include_declaration = false })<CR>",
        opts
      )
      -- keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
      keymap.set("n", "<leader>fo", "<cmd>lua vim.lsp.buf.format({ async = true})<cr>", opts)
      keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      -- keymap.set("n", "<Leader>re", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      -- keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      -- keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
      keymap.set("n", "<Leader>re", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
      keymap.set("n", "<leader>ot", "<cmd>Lspsaga outline<CR>", opts)

      -- keymap.set("n", "gL", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
      keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- show  diagnostics for line
      keymap.set("n", "gL", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
      -- keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
      keymap.set("n", "<leader>gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
      keymap.set("n", "<leader>gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
      -- keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts)                    -- show documentation for what is under cursor
      keymap.set({ "n" }, "gh", function()
        require("lsp_signature").toggle_float_win()
      end, opts)
      keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
      -- keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)      -- show documentation for what is under cursor
      -- keymap.set("n", "gH", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)              -- show documentation for what is under cursor
      keymap.set("n", "<leader>oo", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

      -- version 10 of nvim
      -- if client.server_capabilities.inlayHintProvider then
      --   -- vim.lsp.buf.inlay_hint(bufnr, true)
      --   vim.lsp.inlay_hint.enable(bufnr, true)
      -- end

      -- typescript specific keymaps (e.g. rename file and update imports)
      if client.name == "tsserver" then
        -- local ih = require("inlay-hints")
        -- ih.on_attach(client, bufnr)
        keymap.set("n", "<Leader>rf", ":TypescriptRenameFile<cr>", opts)
        keymap.set("n", "<Leader>ia", ":TypescriptAddMissingImports<cr>", opts)
        keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")         -- rename file and update imports
        keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>")    -- organize imports (not in youtube nvim video)
        keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")       -- remove unused variables (not in youtube nvim video)
        keymap.set("n", "gd", "<cmd>TypescriptGoToSourceDefinition<CR>", opts) -- see definition and make edits in window
        -- require("lsp-inlayhints").on_attach(client, bufnr)
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
    })

    -- configure typescript server with plugin
    typescript.setup({
      server = {
        capabilities = capabilities,
        on_attach = on_attach,
        -- root_dir = root_pattern("tsconfig.base.json", "package.json", "jsconfig.json", ".git", "tsconfig.json"),
        -- root_dir = root_pattern("tsconfig.base.json", "package.json", ".git"),
        -- root_dir = root_pattern("tsconfig.base.json", ".git"),
        root_dir = root_pattern( "tsconfig.json","tsconfig.base.json"),
        settings = {
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = false,
              includeInlayVariableTypeHints = false,
            },
          },
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = false,
              includeInlayFunctionLikeReturnTypeHints = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = false,
              includeInlayVariableTypeHints = false,
            },
          },
        },
      },
    })

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

    lspconfig["angularls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
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
      },
    })

    lspconfig["bashls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    local capabilities_json_ls = vim.lsp.protocol.make_client_capabilities()
    capabilities_json_ls.textDocument.completion.completionItem.snippetSupport = true

    lspconfig["eslint"].setup({
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

    lspconfig["jsonls"].setup({
      filetypes = { "json", "jsonc" },
      on_attach = on_attach,
      -- capabilities = capabilities_json_ls,
      capabilities = capabilities,
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

    -- lspconfig["marksman"].setup {
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    -- }

    require("lspconfig").nxls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- require("lspconfig").emmet_language_server.setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })

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

    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
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
}
