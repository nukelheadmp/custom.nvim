return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Existing servers (e.g., lua_ls) can stay here
        bashls = {}, -- Add bashls for Bash LSP support
      },
    },
    config = function()
      require("lspconfig").bashls.setup({})
    end,
  },
}
