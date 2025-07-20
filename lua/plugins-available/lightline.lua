return {
  {
    "itchyny/lightline.vim",
    config = function()
      -- powerlineish, nord, seoul256
      vim.g.lightline = { colorscheme = "seoul256" }
    end
  },
  { "edkolev/promptline.vim" },
  { "edkolev/tmuxline.vim" },
}
