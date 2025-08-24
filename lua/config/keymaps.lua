-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Remap <Cmd-s> to save the file
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })


vim.keymap.set("n", "<C-w>o", function()
  vim.fn.VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
  vim.fn.VSCodeNotify('workbench.action.closeOtherEditors')
end, { noremap = true, silent = true })
