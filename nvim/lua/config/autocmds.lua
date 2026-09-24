-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGURSR1",
  callback = function()
    package.loaded["matugen"] = nil

    local ok, matugen = pcall(require, "matugen")
    if ok and matugen.setup then
      matugen.setup()
      local transparent_groups = {
        "Normal",
        "NormalNC",
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
        "NeoTreeEndOfBuffer",
      }
      for _, group in ipairs(transparent_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "NONE" })
      end
      vim.cmd("redraw!")
    end
  end,
})

-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
