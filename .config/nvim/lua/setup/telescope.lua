local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-s>"] = actions.select_horizontal,
      },
      n = {
        ["<C-s>"] = actions.select_horizontal,
      },
    },
  }
})
