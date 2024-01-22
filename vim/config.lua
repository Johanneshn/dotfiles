-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/

-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
        let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
        let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
        set shellquote= shellxquote=
  ]]

-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}


lvim.builtin.autopairs.active = true
-- plugins
lvim.plugins = {
  { 'tpope/vim-surround' },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      transparent = false,
      theme = "wave",
      background = {
        -- dark = "dragon"
      },
      colors = {
        theme = {
          -- wave = {
          --   ui = {
          --     bg = '#181616'
          --   }
          -- },
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      }
    }
  },
  {
    "mg979/vim-visual-multi"
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   event = "InsertEnter",
  --   dependencies = { "zbirenbaum/copilot.lua" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
  --       require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
  --     end, 100)
  --   end,
  -- },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
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
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}

-- lvim.colorscheme = "catppuccin-macchiato"
lvim.colorscheme = 'kanagawa-wave'
-- Remove the CTRL-\ for terminal and restore c-t
lvim.builtin.terminal.open_mapping = "<c-t>"
-- Enable use of C-l to clear the terminal
lvim.keys.term_mode = { ["<C-l>"] = false }


-- Trouble
vim.keymap.set("n", "<leader>xw", function() require("trouble").open() end)
vim.keymap.set('i', 'jk', '<Esc>')

vim.opt.relativenumber = true -- relative line numbers
lvim.transparent_window = false


vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'J', '}')
vim.keymap.set('n', 'K', '{')
vim.keymap.set('n', 'L', '$')
