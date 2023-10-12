return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
  filetypes = {
    cs = true,
    csharp = true,
    ts = true,
  }
}
