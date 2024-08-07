return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("nightfox").setup{ transparent = vim.g.transparent_enabled }
    end,
  }
}
