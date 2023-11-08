local home = vim.fn.expand("~/repos/grimoire")
local telekasten = require('telekasten')
telekasten.setup({

  -- dirnames
  home = home,
  dailies = home .. '/' .. 'journal',
  templates = home .. '/' .. 'templates',

  -- templates
  template_handling = "prefer_new_note",
  template_new_note = nil,
  template_new_daily = home .. '/' .. 'templates' .. '/' .. 'daily.md',
  template_new_weekly = "weekly.md",
})

function ZkNewNote(note_type)
  telekasten.setup {
    home = home .. '/' .. note_type,
    template_new_note = home .. '/' .. 'templates' .. '/' .. note_type .. '.md',
  }

  telekasten.new_note()

  telekasten.setup {
    home = home,
    template_new_note = nil,
  }
end
