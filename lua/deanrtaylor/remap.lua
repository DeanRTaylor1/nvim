vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fp", vim.cmd.LspZeroFormat)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ff", vim.cmd.Neoformat)
--vim.keymap.set("n", "<leader>ft", vim.cmd.NvimTreeToggle)


 --vim.keymap.set("n", "<leader>ss", vim.cmd.w)
 --vim.keymap.set("n", "<leader>tt", vim.cmd.terminal)

 vim.api.nvim_set_keymap('n', '<leader>ss', '<cmd>w<cr>', {noremap = true})
 vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>terminal<cr>', {noremap = true})
 vim.api.nvim_set_keymap('n', '<leader>ll', ':set list<cr>', {noremap = true})

vim.g.copilot_assume_mapped = true


vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

