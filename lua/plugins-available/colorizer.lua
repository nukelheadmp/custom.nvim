return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
      vim.keymap.set("n", "<leader>c", ":ColorizerToggle<CR>", { desc = "[C]olorizer Toggle" })
    end,
  },
}
