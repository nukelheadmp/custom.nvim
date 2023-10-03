local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  --{
  --  'rebelot/kanagawa.nvim',
  --  lazy = false,
  --  priority = 1000,
  --  config = function()
  --    vim.cmd.colorscheme('kanagawa')
  --    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  --  end,
  --},
  {
    'AlphaTechnolog/pywal.nvim',
    as = 'pywal',
    config = function()
      require("pywal").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  'christoomey/vim-tmux-navigator',
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = {
              icon_preset = "diamond",
            }
          }, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              personal = "~/Nextcloud/Personal/Notes",
              documentation = "~/Nextcloud/Priefert/Documentation",
            },
            default_workspace = "personal",
          },
        },
      },
    }
  end,
},
{
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require("lualine").setup()
  end,
},
})

-- Settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_perl_provider = 0
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
vim.o.completeopt = 'menuone,noselect'

-- Keymaps
-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vim-tmux-navigator compatibility
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move one pane left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move one pane down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move one pane up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move one pane right" })
-- Custom keymaps
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "[F]ile [E]xplorer" })
--vim.keymap.set("n", "<leader>ft", ":Neotree toggle<cr>", { desc = "File [T]ree" })
--vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "[W]indow operation" })
vim.keymap.set("n", "<leader>bd", ":bd<cr>", { desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<leader>bn", ":bn<cr>", { desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<leader>bp", ":bp<cr>", { desc = "[B]uffer [P]revious" })

-- Stolen from ThePrimeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "[P]aste w/o picking up" })
--vim.keymap.set("n", "<leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })
--vim.keymap.set("v", "<leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })
--vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "[Y]ank to system clipboard" })
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "[D]elete to void register" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "[D]elete to void register" })
vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "[S]earch and replace" })
