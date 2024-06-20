return {
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig"},                              -- Required
      { "williamboman/mason.nvim", config = true },            -- Optional
      { "williamboman/mason-lspconfig.nvim"},                  -- Optional
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },                                  -- Required
      { "hrsh7th/cmp-buffer" },                                -- Optional
      { "hrsh7th/cmp-path" },                                  -- Optional
      { "hrsh7th/cmp-nvim-lsp" },                              -- Required
      { "hrsh7th/cmp-nvim-lua" },                              -- Required
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- Required
      -- Stolen from nvim.kickstart
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
      --{ "j-hui/fidget.nvim" },
      { "folke/neodev.nvim" },
      -- Stolen from TJ DeVries
      { "saadparwaiz1/cmp_luasnip" },
      { "onsails/lspkind.nvim" },
    },
    config = function()
      require("custom.completion")
    end,
  },
}
