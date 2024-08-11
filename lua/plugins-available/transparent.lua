return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })
      --require("nightfox").setup{ transparent = vim.g.transparent_enabled }
      require("transparent").clear_prefix("NeoTree")
    end,
  }
}
