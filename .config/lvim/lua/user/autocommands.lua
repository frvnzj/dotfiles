lvim.autocommands = {
  {
    "VimLeave",
    {
      pattern = { "*.tex" },
      command = "!texclear %",
    }
  },
}

lvim.autocommands = {
  {
    "BufEnter",
    {
      pattern = { "*.tex", "*.md" },
      command = "set textwidth=55",
    }
  },
}
