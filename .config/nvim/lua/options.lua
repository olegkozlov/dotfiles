local opt = vim.opt

opt.termguicolors = true
opt.guifont = "Iosevka:h12"

-- Numbers
opt.number = true
opt.numberwidth = 4
opt.ruler = true
opt.relativenumber = true
opt.rnu = true
opt.cursorline = true

-- Indentation
opt.autoindent = true
opt.cindent = true
opt.smartindent = true

-- Tab Options
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
vim.cmd('filetype plugin indent on')


opt.backspace = { "indent", "eol", "start" }
opt.encoding = "utf-8"
opt.hlsearch = true
vim.o.lazyredraw = true

vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.cmd [[autocmd BufWritePre *.ex,*.exs lua vim.lsp.buf.format()]]
vim.cmd [[autocmd Colorscheme * highlight NvimTreeNormal guibg=#1E1E1E guifg=#9da5b3]]
vim.cmd [[autocmd Colorscheme * highlight NvimTreeFolderName guibg=#1E1E1E guifg=#c1fdfa]]
vim.cmd [[autocmd Colorscheme * highlight NvimTreeOpenedFolderName guibg=#1E1E1E guifg=#90fdf8]]
vim.cmd [[autocmd Colorscheme * highlight NvimTreeOpenedFile guibg=#1E1E1E guifg=#9da5b3]]
