-- vim.cmd([[
--     hi BqfPreviewBorder guifg=#50a14f ctermfg=71
--     hi link BqfPreviewRange Search
-- ]])

local status_ok, bqf = pcall(require, "bqf")
if not status_ok then
  return
end

bqf.setup({
  auto_enable = true,
  auto_resize_height = true, -- highly recommended enable
  preview = {
    auto_preview = false,
  },
})
