-- Install package manager
--    https://github.com/wbthomason/packer.nvim
local packerpath = vim.fn.stdpath 'data' .. '/pack/packer/start/packer.nvim'
if not vim.loop.fs_stat(packerpath) then
  vim.fn.system {
    'git',
    'clone',
    '--depth 1',
    'https://github.com/wbthomason/packer.nvim',
    packerpath,
  }
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'rebelot/kanagawa.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
end)

vim.wo.number = true
vim.wo.relativenumber = true

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "[F]ile [E]xplorer" })
vim.keymap.set('n', '<leader>w', '<C-w>', { desc = '[W]indow operation' })
vim.keymap.set('n', '<leader>bd', ':bd<cr>', { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>bn', ':bn<cr>', { desc = '[B]uffer [N]ext' })

vim.keymap.set("i", "jk", "<esc>")
--vim.keymap.set('n', '<leader>ft', ':Neotree toggle<cr>', { desc = 'File [T]ree' })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>ps', function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ") })
--end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader> ', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
