local map = function(key)
  -- get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  -- basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

vim.g.mapleader = " "

map {"", "<Up>", ""}
map {"", "<Down>", ""}
map {"", "<Left>", ""}
map {"", "<Right>", ""}
map {"i", "<Up>", ""}
map {"i", "<Down>", ""}
map {"i", "<Left>", ""}
map {"i", "<Right>", ""}

map {"", "<C-j>", "<C-W>j"}
map {"", '<C-k>', '<C-W>k'}
map {"", '<C-h>', '<C-W>h'}
map {"", '<C-l>', '<C-W>l'}

--After searching, pressing escape stops the highlight
map {'n', '<esc>', ':noh<cr><esc>', {silient = true}}
-- Nvim-Tree
map {'n', '<Leader>T', ':NvimTreeToggle<cr>'}
-- Telescope
map {'n', '<Leader>f', '<cmd>lua require("telescope.builtin").find_files()<cr>'}
map {'n', '<Leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>'}
map {'n', '<Leader>s', '<cmd>lua require("telescope.builtin").live_grep()<cr>'}
