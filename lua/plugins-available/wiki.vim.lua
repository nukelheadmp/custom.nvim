-- Forked from https://github.com/lervag/wiki.vim
return {
  {
    "nukelheadmp/wiki.vim",
    -- tag = "v0.10", -- uncomment to pin to a specific release
    init = function()
      vim.g.wiki_root = '~/SynologyDrive/Personal/Notes'
    end
  }
}
