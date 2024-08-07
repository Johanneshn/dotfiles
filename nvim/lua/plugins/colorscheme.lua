-- return {
--   {
--     "folke/tokyonight.nvim",
--     opts = {
--       transparent = true,
--       styles = {
--         sidebars = "transparent",
--         floats = "transparent",
--       },
--     },
--   },
-- }
--
--return {
--  { "rebelot/kanagawa.nvim" },
--  {
--    "LazyVim/LazyVim",
--    opts = {
--      colorscheme = "kanagawa",
--    },
--  },
--}
return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    require("onedark").setup({ style = "darker" })
    require("onedark").load()
  end,
}
