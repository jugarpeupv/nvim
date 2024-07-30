return {
  {
    "nvim-tree/nvim-web-devicons",
    -- event = "VeryLazy",
    -- event = { "BufReadPost", "BufNewFile" },
    priority = 800,
    config = function()
      local present, devicons = pcall(require, "nvim-web-devicons")

      if not present then
        return
      end

      -- devicons.set_icon {
      --   ["service.ts"] = { icon = "", color = "#d6d25a", name = "AngularService"},
      --   ["%service.ts"] = { icon = "", color = "#d6d25a", name = "AngularService"},
      --   [".service.ts"] = { icon = "", color = "#d6d25a", name = "AngularService"},
      --   ["directive.ts"] = { icon = "", color = "#6f32a8", name = "AngularDirective"},
      --   ["module.ts"] = { icon = "", color = "#C24C38", name = "AngularModule"},
      --   ["stories.ts"] = { icon = "s", color = 'red', name = "Storie"},
      --   -- [".editorconfig"] = { icon = "🚦", name = "Editorconfig"},
      --   -- [".eslintignore"] = { icon = "🉐", name = "Eslintignore"},
      --   -- -- [".eslintignore"] = { icon = "🧿", name = "Eslintignore"},
      --   -- [".eslintrc"] = { icon = "🈳", name = "Eslintrc"},
      --   -- [".prettierrc"] = { icon = "🈶", name = "PrettierRc"},
      --   -- [".prettierignore"] = { icon = "🉑", name = "PrettierIgnore"},
      --   -- ["Jenkinsfile"] = { icon = "", name = "PrettierIgnore"},
      -- }

      local options = {
        override = {
          html = {
            icon = "",
            name = "html",
            -- color = "#C24C38",
            color = "#F38BA8",
          },
          dockerfile = {
            icon = "",
            color = "#9CDCFE",
            name = "Dockerfile4",
          },
          groovy = {
            icon = "",
            name = "groovyfile",
          },
          [".npmrc"] = {
            icon = "",
            color = "#F38BA8",
            name = "npmrc1",
          },
          ["out"] = {
            icon = "",
            color = "#F38BA8",
            cterm_color = "124",
            name = "Out",
          },
          zsh = {
            icon = "",
            color = "#9CDCFE",
            cterm_color = "65",
            name = "Zsh",
          },
          ["scss"] = {
            icon = "󰟬",
            color = "#F38BA8",
            name = "scss1",
          },

          ["xlsx"] = {
            icon = "󰈛",
            color = "#73daca",
            name = "xlsx1",
          },
          ["csv"] = {
            icon = "",
            color = "#9CDCFE",
            name = "Csv",
          },
          ["md"] = {
            icon = "",
            color = "#9CDCFE",
            name = "Markdown2",
          },
          json = {
            -- icon = "",
            icon = "󰘦",
            name = "json",
            color = "#9CDCFE",
          },
          js = {
            icon = "",
            name = "javascript",
            color = "#F9E2AF",
          },
          ["cjs"] = {
            icon = "",
            color = "#F9E2AF",
            name = "Cjs",
          },
          ["mjs"] = {
            icon = "",
            color = "#F9E2AF",
            name = "mjs1",
          },
          txt = {
            icon = "󰈚",
            name = "txtname",
            -- color = "#F9E2AF"
            color = "#8ee2cf",
          },
          toml = {
            icon = "",
            name = "toml",
            -- color = "#F9E2AF"
            color = "#737aa2",
          },
          zip = {
            icon = "",
            name = "zipp",
            -- color = "#F9E2AF"
            color = "#F9E2AF",
          },

          ["CODEOWNERS"] = { icon = "󱖨", color = "#73daca", name = "codeownersfile1" },

          ["d.ts"] = {
            -- icon = "",
            icon = "󰛦",
            -- color = "#F38BA8",
            -- color = "#CBA6F7",
            color = "#89B4FA",
            -- cterm_color = "172",
            name = "TypeScriptDeclaration",
          },
          default_icon = {
            -- icon = "󰙄",
            -- icon = "󰈤",
            -- icon = "🀄️",
            -- icon = "",
            -- icon = "🀀",
            -- icon = "",
            icon = "",
            -- icon = "",
            -- icon = "",
            -- icon = "📄",
            -- color = "#73daca",
            -- color = "grey",
            name = "DefaultIcon",
          },
        },
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true,
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = false,
        -- globally enable "strict" selection of icons - icon will be looked up in
        -- different tables, first by filename, and if not found by extension; this
        -- prevents cases when file doesn't have any extension but still gets some icon
        -- because its name happened to match some extension (default to false)
        strict = false,
        -- same as `override` but specifically for overrides by filename
        -- takes effect when `strict` is true
        override_by_filename = {
          [".zshrc"] = {
            icon = "",
            color = "#7C7F93",
            name = "zshrc",
          },
          [".dockerignore"] = { icon = "", color = "#9CDCFE", name = "DockerfileIgnore" },
          ["Dockerfile"] = { icon = "", color = "#9CDCFE", name = "Dockerfile2" },
          ["dockerfile"] = { icon = "", color = "#9CDCFE", name = "Dockerfile5" },
          ["app.routes.ts"] = { icon = "󰑪", color = "#73daca", name = "AngularRoutes" },
          ["webpack.config.js"] = { icon = "󰜫", color = "#9CDCFE", name = "WebpackConfig" },
          ["README.md"] = { icon = "", color = "#9CDCFE", name = "readmemd" },
          [".gitignore"] = { icon = "󰊢", color = "#CA9EE6", name = "gitignore" },
          ["readme.md"] = { icon = "", color = "#9CDCFE", name = "readmemd1" },
          ["webpack.prod.config.js"] = { icon = "󰜫", color = "#9CDCFE", name = "WebpackConfigProd" },

          ["webpack.config.ts"] = { icon = "󰜫", color = "#9CDCFE", name = "WebpackConfigTS" },
          ["webpack.prod.config.ts"] = { icon = "󰜫", color = "#9CDCFE", name = "WebpackConfigProdTS" },
          ["package.json"] = { icon = "", color = "#73daca", name = "PackageJson" },
          [".package.json"] = { icon = "", color = "#73daca", name = "PackageJson1" },
          ["*.package.json"] = { icon = "", color = "#73daca", name = "PackageJson2" },
          ["*package.json"] = { icon = "", color = "#73daca", name = "PackageJson3" },
          ["package-lock.json"] = { icon = "", color = "#73daca", name = "PackageLockJson" },
          ["pnpm-lock.yaml"] = { icon = "", color = "#F9E2AF", name = "pnpmLockYaml" },

          ["favicon.ico"] = { icon = "", color = "#F9E2AF", name = "faviconico" },
          -- ["CODEOWNERS"] = { icon = "", color = "#F38BA8", name = "codeownersfile" },
          ["codeowners"] = { icon = "󱖨", color = "#73daca", name = "codeownersfile2" },
          -- ["*Jenkins*"] = { icon = "", color = 'black', name = "jenkinsfile" },
          -- ["jenkinsfileci"] = { icon = "", name = "Jenkins3"},
          -- ["jenkinsfilecd"] = { icon = "", name = "Jenkins4"},
          ["jenkinsfile"] = { icon = "", name = "Jenkins8", color = "#c0caf5" },
          ["jenkinsfileci"] = { icon = "", name = "Jenkins3", color = "#c0caf5" },
          ["jenkinsfilecd"] = { icon = "", name = "Jenkins4", color = "#c0caf5" },
          ["JenkinsfileCD"] = { icon = "", name = "Jenkins5", color = "#c0caf5" },
          ["JenkinsfileCI"] = { icon = "", name = "Jenkins7", color = "#c0caf5" },

          ["jest.config.ts"] = { icon = "󰙨", name = "jenkinsconfig1", color = "#f38bad" },
          ["jest.config.app.ts"] = { icon = "󰙨", name = "jenkinsconfigapp1", color = "#f38bad" },
          ["jest.config.js"] = { icon = "󰙨", name = "jenkinsconfig2", color = "#f38bad" },

          -- ["jest.config.ts"] = { icon = "󰤑", name = "jenkinsconfig1", color = "#f38bad" },
          -- ["jest.config.app.ts"] = { icon = "󰤑", name = "jenkinsconfigapp1", color = "#f38bad" },
          -- ["jest.config.js"] = { icon = "󰤑", name = "jenkinsconfig2", color = "#f38bad" },

          -- ["jest.config.ts"] = { icon = "󰇉", name = "jenkinsconfig1", color = "#f38bad" },
          -- ["jest.config.app.ts"] = { icon = "󰇉", name = "jenkinsconfigapp1", color = "#f38bad" },
          -- ["jest.config.js"] = { icon = "󰇉", name = "jenkinsconfig2", color = "#f38bad" },
          

          -- [".nxignore"] = { icon = "🐋", color = "blue", name = "nxignore"},
          -- ["nx.json"] = { icon = "🐋", name = "nxjson"},

          -- [".nxignore"] = { icon = "󱢺 ", color = "#9CDCFE", name = "nxignore"},
          -- ["nx.json"] = { icon = "󱢺 ", color = "#9CDCFE", name = "nxjson"},

          -- ["sonar-project.properties"] = { icon = "󰐷", color = "#5E2C84", name = "sonarproperties"},
          ["sonar-project.properties"] = { icon = "󰐷", color = "#CBA6F7", name = "sonarproperties" },
          -- [".nxignore"] = { icon = "󰝆", color = "#7C7F93", name = "nxignore"},
          -- ["nx.json"] = { icon = "󰝆", color = "#9CDCFE", name = "nxjson"},
          ["nx.json"] = { icon = "󰰔", color = "#9CDCFE", name = "nxjson" },
          [".nxignore"] = { icon = "󰰔", color = "#7C7F93", name = "nxignore" },

          [".eslintignore"] = { icon = "󰱺", color = "#7C7F93", name = "eslintignore" },
          [".eslintrc.json"] = { icon = "󰱺", color = "#9CDCFE", name = "eslintrcjson" },
          [".eslintrc.base.json"] = { icon = "󰱺", color = "#9CDCFE", name = "eslintrcjson" },
          [".eslint-report.json"] = { icon = "󰱺", color = "#9CDCFE", name = "eslintreportjson" },

          ["commitlint.config.ts"] = { icon = "󰜘", color = "#CBA6F7", name = "commitlintconfig12" },

          --[[ [".prettierignore"] = { icon = "󰫽", color = "#7C7F93", name = "prettierignore"}, ]]
          [".prettierignore"] = { icon = "", color = "#7C7F93", name = "prettierignore" },

          --[[ [".prettierrc"] = { icon = "󰫽", color = "#0D8874", name = "prettierrc"}, ]]
          [".prettierrc"] = { icon = "", color = "#73daca", name = "prettierrc" },
          -- [".prettierrc"] = { icon = "", color = "#73daca", name = "prettierrc" },

          --[[ ["project.json"] = { icon = "", color = '#9CDCFE', name = 'ProjectJson' }, ]]
          ["project.json"] = { icon = "", color = "#9CDCFE", name = "ProjectJson" },
          -- ["tsconfig.json"] = { icon = "", color = "#F9E2AF", name = "TsConfigJson" },

          -- ["tsconfig.json"] = { icon = "󱃖", color = "#9CDCFE", name = "TSDeclarationfile2" },

          ["tsconfig.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile2" },
          
          ["tsconfig.editor.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile2" },
          ["tsconfig.base.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile2" },
          ["tsconfig.app.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile1" },
          ["tsconfig.lib.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile1" },
          ["tsconfig.spec.json"] = { icon = "󰛦", color = "#9CDCFE", name = "TSDeclarationfile1" },

          -- ["tsconfig.editor.json"] = { icon = "󱃖", color = "#9CDCFE", name = "TSDeclarationfile2" },
          -- ["tsconfig.base.json"] = { icon = "󱃖", color = "#9CDCFE", name = "TSDeclarationfile2" },
          -- ["tsconfig.app.json"] = { icon = "󱃖", color = "#9CDCFE", name = "TSDeclarationfile1" },
          -- ["tsconfig.lib.json"] = { icon = "󱃖", color = "#9CDCFE", name = "TSDeclarationfile1" },
          -- ["tsconfig.spec.json"] = { icon = "󱃖", color = "#9CDCFE", name = "TSDeclarationfile1" },
        },
        -- same as `override` but specifically for overrides by extension
        -- takes effect when `strict` is true
        override_by_extension = {
          [".env"] = {
            icon = "",
            -- color = "#F9E2AF",
            color = "#F2CDCD",
            -- cterm_color = "227",
            name = "Env2",
          },
          ["log"] = {
            icon = "",
            -- color = "#81e043",
            color = "#73daca",
            name = "Log",
          },
          -- ["md"] = {
          --   icon = "",
          --   color = "#9CDCFE",
          --   name = "Markdown"
          -- },
          ["module.ts"] = { icon = "", color = "#CBA6F7", name = "AngularModule1" },
          ["*.module.ts"] = { icon = "", color = "#CBA6F7", name = "AngularModule2" },
          [".module.ts"] = { icon = "", color = "#CBA6F7", name = "AngularModule" },
          ["service.ts"] = { icon = "", color = "#F9E2AF", name = "AngularService1" },
          [".service.ts"] = { icon = "", color = "#F9E2AF", name = "AngularService2" },

          ["component.ts"] = { icon = "󰚿", color = "#89b4fa", name = "AngularComponent1" },

          ["routes.ts"] = { icon = "󰑪", color = "#73daca", name = "AngularRoutesFile" },
          [".routes.ts"] = { icon = "󰑪", color = "#73daca", name = "AngularRoutesFile" },
          ["*.routes.ts"] = { icon = "󰑪", color = "#73daca", name = "AngularRoutesFile" },

          ["angular.json"] = { icon = "󰚿", color = "#f38ba8", name = "AngularJson" },
          ["*angular.json"] = { icon = "󰚿", color = "#f38ba8", name = "AngularJson" },
          ["*.angular.json"] = { icon = "󰚿", color = "#f38ba8", name = "AngularJson" },
          [".angular.json"] = { icon = "󰚿", color = "#f38ba8", name = "AngularJson" },

          ["directive.ts"] = { icon = "", color = "#6f32a8", name = "AngularDirective" },
          ["*.directive.ts"] = { icon = "", color = "#6f32a8", name = "AngularDirective" },
          [".directive.ts"] = { icon = "", color = "#6f32a8", name = "AngularDirective" },
          -- [".stories.ts"] = { icon = "s", color = "#F38BA8", name = "Storie1" },

          -- ["stories.ts"] = { icon = "s", color = "#F38BA8", name = "Storie2" },

          [".stories.ts"] = { icon = "", color = "#f55385", name = "Storie1" },

          ["stories.ts"] = { icon = "", color = "#f55385", name = "Storie2" },

          ["bun.lockb"] = { icon = "", color = "#F5C2E7", name = "bunlock" },
          -- ["bun.lockb"] = { icon = "󰳯", color = "#F2CDCD", name = "bunlock" },

          -- ["*codeowners"] = { icon = "", color = "#F38BA8", name = "codeownersfile" },

          ["codeowners"] = { icon = "󱖨", color = "#73daca", name = "codeownersfile3" },

          -- ["d.ts"] = { icon = "󰛦", color = '#107DC7', name = "dtypescript" },
          -- ["d.ts"] = { icon = "󰛦", color = "#89b4fb", name = "dtypescript" },

          [".editorconfig"] = { icon = "", color = "#c0caf5", name = "Editorconfig" },
          ["drawio"] = { icon = "󰇟", color = "#F9E2AF", name = "drawio1" },

          ["spec.js"] = {
            icon = "",
            color = "#9CDCFE",
            name = "SpecJs",
          },
          ["spec.ts"] = {
            icon = "",
            color = "#9CDCFE",
            name = "SpecTs",
          },
          ["test.js"] = {
            icon = "",
            color = "#9CDCFE",
            name = "TestJs",
          },
          ["test.ts"] = {
            icon = "",
            color = "#9CDCFE",
            name = "SpecJs",
          },
        },
      }

      devicons.setup(options)
    end,
  },
}
