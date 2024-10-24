return {
  "catppuccin/nvim",
  name = "catppuccin",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          Folded = { bg = colors.none },
          UfoFoldedEllipsis = { fg = colors.blue, bg = colors.none },
        }
      end,
      integrations = {
        notify = true,
      }
    })

    vim.cmd.colorscheme("catppuccin")
  end
}
