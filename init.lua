require("settings")
require("keymaps")

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
  --'chrisbra/Colorizer',
  'norcalli/nvim-colorizer.lua',
  --{
  --  'norcalli/nvim-colorizer.lua',
  --  config = function()
  --    require("colorizer").setup()
  --  end,
  --},
  --{
  --  "EdenEast/nightfox.nvim",
  --  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --  priority = 1000, -- make sure to load this before all the other start plugins
  --  config = function()
  --    -- load the colorscheme here
  --    vim.cmd("colorscheme nightfox")
  --  end,
  --},
  --{
  --  "folke/tokyonight.nvim",
  --  lazy = false,
  --  priority = 1000,
  --  config = function()
  --    vim.cmd([[colorscheme tokyonight]])
  --  end,
  --},
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
  { "dhruvasagar/vim-table-mode" },
  'Vonr/align.nvim',
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },
  'christoomey/vim-tmux-navigator',
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  --'itchyny/lightline.vim',
  --'edkolev/promptline.vim',
  'edkolev/tmuxline.vim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require("lualine").setup()
    end,
    opts = {
      theme = "pywal-nvim",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup()
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      {'BurntSushi/ripgrep'},
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    }
  },
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
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig'},             -- Required
      { 'williamboman/mason.nvim', config = true },           -- Optional
      { 'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-nvim-lua' },     -- Required
      { 'L3MON4D3/LuaSnip' },         -- Required

      -- Stolen from nvim.kickstart
      --{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      { 'j-hui/fidget.nvim' },
      { 'folke/neodev.nvim' },
    },
  },
  { "folke/neoconf.nvim", cmd = "Neoconf" },
})
