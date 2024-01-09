-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

lvim.builtin.autopairs.active = false
-- plugins
lvim.plugins = {
  {
    "mg979/vim-visual-multi"
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent =true })
    end,
  },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   opts = {}
  -- },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
        require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
      end, 100)
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "1.*",
    config = function()
      require("window-picker").setup({
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal" },
          },
        },
        other_win_hl_color = "#e35e4f",
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }, 
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}

lvim.colorscheme = "catppuccin-macchiato"

-- Remove the CTRL-\ for terminal and restore c-t
lvim.builtin.terminal.open_mapping = "<c-t>"
-- Enable use of C-l to clear the terminal
lvim.keys.term_mode = { ["<C-l>"] = false }


-- example mappings you can place in some other place
-- An awesome method to jump to windows
local picker = require('window-picker')

-- Swap two windows using the awesome window picker
local function swap_windows()
  local window = picker.pick_window({
    include_current_win = false
  })
  local target_buffer = vim.fn.winbufnr(window)
  -- Set the target window to contain current buffer
  vim.api.nvim_win_set_buf(window, 0)
  -- Set current window to contain target buffer
  vim.api.nvim_win_set_buf(0, target_buffer)
end


-- Trouble 
vim.keymap.set("n", "<leader>xw", function() require("trouble").open() end)

vim.keymap.set('n', ',W', swap_windows, { desc = 'Swap windows' })
vim.keymap.set('i', 'jk', '<Esc>')
vim.opt.relativenumber = true -- relative line numbers
vim.keymap.set("n", ",w", function()
  local picked_window_id = picker.pick_window({
    include_current_win = true,
    hint = 'floating-big-letter'
  }) or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })

vim.opt.relativenumber = true -- relative line numbers
lvim.transparent_window = true
