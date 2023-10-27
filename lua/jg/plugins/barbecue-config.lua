local status_ok, bb = pcall(require, "barbecue")
if not status_ok then
  return
end

bb.setup(
  {
    exclude_filetypes = {
      "netrw",
      "toggleterm",
      "NvimTree",
      "Diff",
      "diffview",
      'dirvish',
      'help',
      'dashboard',
      'fugitive',
      'diffview',
      'NvimTree',
      'startify',
      'dashboard',
      'packer',
      'neogitstatus',
      'Trouble',
      'alpha',
      'lir',
      'Outline',
      'spectre_panel',
      'toggleterm',
      'qf',
    },
    show_dirname = true,
    show_basename = true,
  }
)
