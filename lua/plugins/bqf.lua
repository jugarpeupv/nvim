-- return {}
return {
  "kevinhwang91/nvim-bqf",
  event = "VeryLazy",
  config = function()
    require("bqf").setup({
      magic_window = false,
      func_map = {},
      filter = {
        fzf = {
          action_for = {},
          extra_opts = {},
        },
      },
      auto_enable = true,
      auto_resize_height = true, -- highly recommended enable
      preview = {
        border = "single",
        buf_label = true,
        delay_syntax = 10,
        should_preview_cb = function()
          return true
        end,
        show_title = true,
        win_height = 0,
        win_vheight = 0,
        winblend = 0,
        wrap = true,
        show_scroll_bar = true,
        auto_preview = false,
      },
    })
  end,
}
