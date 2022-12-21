require'nvim-treesitter.configs'.setup {
  auto_install = true,

  autotag = {
    enable = true,
  },
  highlight = {
    link = {
      TSError = Normal
    },
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  }
}

require "nvim-treesitter.highlight"
vim.treesitter.highlighter.hl_map.error = nil
