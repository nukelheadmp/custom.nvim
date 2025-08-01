return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {"nvim-lua/plenary.nvim"},
      {"BurntSushi/ripgrep"},
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
    config = function()
      local builtin = require('telescope.builtin')
      
      -- Keymaps
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      --vim.keymap.set("n", "<leader>fg", function()
      --	builtin.grep_string({ search = vim.fn.input("Grep > ") })
      --end)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
      
      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })
    end,
  },
}
