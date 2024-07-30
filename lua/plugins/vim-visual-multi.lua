return {
  {
    "mg979/vim-visual-multi",
    keys = { { "<C-n>", "n" } },
    config = function()
      vim.cmd([[highlight! VM_Mono guibg=#004b72]])
      vim.cmd([[highlight! VM_Extend guibg=#004b72]])
      vim.g.VM_Mono_hl = "Visual"
      vim.g.VM_Mono = "Visual"
      vim.g.VM_Extend = "Visual"
      vim.g.VM_Extend_hl = "Visual"
      vim.g.VM_Insert_hl = "Visual"
      vim.cmd[[let g:VM_maps["Add Cursor Down"]             = '<C-Down>']]
      vim.cmd[[let g:VM_maps["Add Cursor Up"]               = '<C-Up>']]
    end,
  },
}
