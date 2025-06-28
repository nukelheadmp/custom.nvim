return {
  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/SynologyDrive/Personal/Notes/",
          syntax = "markdown",
          ext = ".md",
        },
      }
      --vim.g.vimwiki_global_ext = 0
      --vim.g.vimwiki_ext2syntax = {}
    end,
  },
}
