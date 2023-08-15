-- Install package manager
--    https://github.com/wbthomason/packer.nvim
--local packerpath = vim.fn.stdpath('data') .. '/pack/packer/start/packer.nvim'
--if not vim.loop.fs_stat(packerpath) then
--  vim.fn.system {
--    'git',
--    'clone',
--    '--depth 1',
--    'https://github.com/wbthomason/packer.nvim',
--    packerpath,
--  }
--end
--vim.opt.rtp:prepend(packerpath)

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'rebelot/kanagawa.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'BurntSushi/ripgrep'}
		}
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'tpope/vim-fugitive'
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
end)

-- Settings
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- Keymaps
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "[F]ile [E]xplorer" })
--vim.keymap.set("n", "<leader>ft", ":Neotree toggle<cr>", { desc = "File [T]ree" })
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "[W]indow operation" })
vim.keymap.set("n", "<leader>bd", ":bd<cr>", { desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<leader>bn", ":bn<cr>", { desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<leader>bp", ":bp<cr>", { desc = "[B]uffer [P]revious" })

local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
--vim.keymap.set("n", "<leader>fg", function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ") })
--end)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader> ", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Stolen from ThePrimeagen
vim.keymap.set("v", "J", ":m \">+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m \"<-2<cr>gv=gv")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("n", "Q", "<nop>")

-- Color Scheme
vim.cmd.colorscheme('kanagawa')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
