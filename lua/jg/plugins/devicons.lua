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
      color = "#C24C38"
    },
    dockerfile = {
      icon = "",
      color = "#9CDCFE",
      name = "Dockerfile"
    },
    --[[ json = {
      icon = "",
      name = "json",
      color = "#DAE732"
    }, ]]
    -- js = {
    --   icon = "",
    --   name = "js",
    --   -- color = "#DAE732"
    --   color = "#B3BD36"
    -- },
    -- js = {
    --   icon = "󰌞",
    --   name = "js",
    --   -- color = "#DAE732"
    --   color = "#B3BD36"
    -- },
    -- ts = {
    --    icon = "󰛦",
    --    name = "ts",
    --    color = "#18a2fe"
    -- },
    -- default_icon = {
    --  -- icon = "🀪",
    --   -- icon = "🀀",
    --   icon = "🀅",
    --  color = "grey",
    --  name = "Default",
    -- }
    -- default_icon = {
    --   icon = "🀀",
    --   color = "white",
    --   name = "Default",
    -- },
    -- default = {
    --   -- icon = "󰙄",
    --   -- icon = "󰈤",
    --   -- icon = "🀄️",
    --   -- icon = "",
    --   icon = "📄",
    --   -- color = "#73daca",
    --   -- color = "grey",
    --   name = "Default",
    -- },
    default_icon = {
      -- icon = "󰙄",
      -- icon = "󰈤",
      -- icon = "🀄️",
      -- icon = "",
      icon = "🀀",
      -- icon = "",
      -- icon = "📄",
      -- color = "#73daca",
      -- color = "grey",
      name = "DefaultIcon",
    }
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
    [".gitignore"] = {
      icon = "",
      color = "#f1502f",
      name = "Gitignore"
    },
    [".dockerignore"] = { icon = "", color = "#9CDCFE", name = "DockerfileIgnore" },
    ["app.routes.ts"] = { icon = "󰑪", color = '#73daca', name = 'AngularRoutes' },
    ["webpack.config.js"] = { icon = "󰜫", color = "#9CDCFE", name = "WebpackConfig" },
    ["webpack.prod.config.js"] = { icon = "󰜫", color = "#9CDCFE", name = "WebpackConfigProd" },
    ["package.json"] = { icon = "", color = "#73daca", name = "PackageJson" },
    [".package.json"] = { icon = "", color = "#73daca", name = "PackageJson1" },
    ["*.package.json"] = { icon = "", color = "#73daca", name = "PackageJson2" },
    ["*package.json"] = { icon = "", color = "#73daca", name = "PackageJson3" },
    ["package-lock.json"] = { icon = "", color = "#73daca", name = "PackageLockJson" },
    -- ["*Jenkins*"] = { icon = "", color = 'black', name = "jenkinsfile" },
    -- ["jenkinsfileci"] = { icon = "", name = "Jenkins3"},
    -- ["jenkinsfilecd"] = { icon = "", name = "Jenkins4"},
    ["jenkinsfileci"] = { icon = "", name = "Jenkins3"},
    ["jenkinsfilecd"] = { icon = "", name = "Jenkins4"},

    -- [".nxignore"] = { icon = "🐋", color = "blue", name = "nxignore"},
    -- ["nx.json"] = { icon = "🐋", name = "nxjson"},

    -- [".nxignore"] = { icon = "󱢺 ", color = "#9CDCFE", name = "nxignore"},
    -- ["nx.json"] = { icon = "󱢺 ", color = "#9CDCFE", name = "nxjson"},

    [".nxignore"] = { icon = "󰝆", color = "#9CDCFE", name = "nxignore"},
    ["nx.json"] = { icon = "󰝆", color = "#9CDCFE", name = "nxjson"},

    [".eslintignore"] = { icon = "󰱺", color = "#7C7F93", name = "eslintignore"},
    [".eslintrc.json"] = { icon = "󰱺", color = "#9CDCFE", name = "eslintrcjson"},
    [".eslint-report.json"] = { icon = "󰱺", color = "#9CDCFE", name = "eslintreportjson"},

    --[[ [".prettierignore"] = { icon = "󰫽", color = "#7C7F93", name = "prettierignore"}, ]]
    [".prettierignore"] = { icon = "󰰚", color = "#7C7F93", name = "prettierignore"},


    --[[ [".prettierrc"] = { icon = "󰫽", color = "#0D8874", name = "prettierrc"}, ]]
    [".prettierrc"] = { icon = "󰰚", color = "#73daca", name = "prettierrc"},


    --[[ ["project.json"] = { icon = "", color = '#9CDCFE', name = 'ProjectJson' }, ]]
    ["project.json"] = { icon = "", color = '#9CDCFE', name = 'ProjectJson' },


  },
  -- same as `override` but specifically for overrides by extension
  -- takes effect when `strict` is true
  override_by_extension = {
    ["log"] = {
      icon = "",
      -- color = "#81e043",
      color = "#73daca",
      name = "Log"
    },
    ["md"] = {
      icon = "",
      color = "#9CDCFE",
      name = "Markdown"
    },
    ["module.ts"] = { icon = "", color = "#C24C38", name = "AngularModule1" },
    ["*.module.ts"] = { icon = "", color = "#C24C38", name = "AngularModule2" },
    [".module.ts"] = { icon = "", color = "#C24C38", name = "AngularModule" },
    ["service.ts"] = { icon = "", color = "#d6d25a", name = "AngularService1" },
    [".service.ts"] = { icon = "", color = "#d6d25a", name = "AngularService2" },

    ["routes.ts"] = { icon = "󰑪", color = '#73daca', name = 'AngularRoutesFile' },
    [".routes.ts"] = { icon = "󰑪", color = '#73daca', name = 'AngularRoutesFile' },
    ["*.routes.ts"] = { icon = "󰑪", color = '#73daca', name = 'AngularRoutesFile' },

    ["angular.json"] = { icon = "󰚿", color = '#f38ba8', name = 'AngularJson' },
    ["*angular.json"] = { icon = "󰚿", color = '#f38ba8', name = 'AngularJson' },
    ["*.angular.json"] = { icon = "󰚿", color = '#f38ba8', name = 'AngularJson' },
    [".angular.json"] = { icon = "󰚿", color = '#f38ba8', name = 'AngularJson' },
    -- ["*.d.ts"] = { icon = "󰛦", color = '#18a2fe', name = 'TSDeclarationfile' },
    -- [".d.ts"] = { icon = "󰛦", color = '#18a2fe', name = 'TSDeclarationfile' },
    -- ["d.ts"] = { icon = "󰛦", color = '#8CAAEE', name = 'TSDeclarationfile' },



    ["directive.ts"] = { icon = "", color = "#6f32a8", name = "AngularDirective" },
    ["*.directive.ts"] = { icon = "", color = "#6f32a8", name = "AngularDirective" },
    [".directive.ts"] = { icon = "", color = "#6f32a8", name = "AngularDirective" },
    [".stories.ts"] = { icon = "s", color = 'red', name = "Storie1" },


    -- [".editorconfig"] = { icon = "", color = '#89b4fa', name = "Editorconfig"},
  },
}

devicons.setup(options)
