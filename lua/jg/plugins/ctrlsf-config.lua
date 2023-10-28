vim.g.ctrlsf_context = '-C 0'
vim.g.ctrlsf_populate_qflist = 1
vim.g.ctrlsf_auto_preview = 1
vim.g.ctrlsf_auto_close = {
  normal = 0,
  compact = 0
}
vim.g.ctrlsf_mapping = {
  open    = { "<CR>", "o" },
  openb   = "O",
  split   = "<C-O>",
  vsplit  = "<C-V>",
  tab     = "t",
  tabb    = "T",
  popen   = "p",
  popenf  = "P",
  quit    = "q",
  next    = "<C-J>",
  prev    = "<C-K>",
  -- nfile   = "<C-N>",
  -- pfile   = "<C-P>",
  pquit   = "q",
  loclist = "",
  chgmode = "M",
  stop    = "<C-C>",
}
