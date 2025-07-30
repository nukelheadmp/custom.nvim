return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      {
        "nvim-treesitter/nvim-treesitter",
        config = function()
          require("nvim-treesitter.configs").setup({
            ensure_installed = { "markdown", "markdown_inline" },
            highlight = {
              enable = true,
            },
          })
        end,
      },

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "personal",
            path = "~/SynologyDrive/Personal/Notes",
          },
        },
        completion = {
          nvim_cmp = true,
          min_chars = 2,
        },
      })

      -- see below for full list of options 👇
    end,
  }
}
