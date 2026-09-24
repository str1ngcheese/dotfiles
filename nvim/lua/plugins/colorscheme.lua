return {
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local ok, matugen = pcall(require, "matugen")
        if ok and matugen.setup then
          matugen.setup()

          local transparent_groups = {
            "Normal",
            "NormalNC",
            "Comment",
            "Constant",
            "Special",
            "Identifier",
            "Statement",
            "PreProc",
            "Type",
            "Underlined",
            "Todo",
            "String",
            "Function",
            "Conditional",
            "Repeat",
            "Operator",
            "Structure",
            "LineNr",
            "NonText",
            "SignColumn",
            "EndOfBuffer",
            "NormalFloat",
            "FloatBorder",
            "FloatTitle",
            "NeoTreeNormal",
            "NeoTreeNormalNC",
            "NeoTreeWinSeperator",
            "NeoTreeStatusLine",
            "NeoTreeStatusLineNC",
            "NeoTreeEndOfBuffer",
            "StatusLine",
            "StatusLineNC",
            "MsgArea",
          }
          for _, group in ipairs(transparent_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "NONE" })
          end
        else
          vim.cmd.colorscheme("tokyonight")
        end
      end,
    },
  },
}
