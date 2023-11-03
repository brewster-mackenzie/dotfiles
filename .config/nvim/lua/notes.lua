local home = vim.fn.expand("~/repos/grimoire")
local telekasten = require('telekasten')
telekasten.setup({

  -- dirnames
  home = home,
  dailies = home .. '/' .. 'journal',
  templates = home .. '/' .. 'templates',

  -- templates
  template_handling = "prefer_new_note",
  template_new_note = "note.md",
  template_new_daily = "daily.md",
  template_new_weekly = "weekly.md",
})
