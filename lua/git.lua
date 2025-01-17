local M = {}

function M.setup(cfg)
  require("git.config").setup(cfg)
  cfg = require("git.config").config

  local options = {
    noremap = true,
    silent = true,
    expr = false,
  }
  vim.api.nvim_set_keymap("n", cfg.keymaps.blame, "<CMD>lua require('git.blame').blame()<CR>", options)
  vim.api.nvim_set_keymap("n", cfg.keymaps.diff, "<CMD>lua require('git.diff').open()<CR>", options)
  vim.api.nvim_set_keymap("n", cfg.keymaps.diff_close, "<CMD>lua require('git.diff').close()<CR>", options)
  vim.api.nvim_set_keymap("n", cfg.keymaps.revert, "<CMD>lua require('git.revert').open(false)<CR>", options)
  vim.api.nvim_set_keymap("n", cfg.keymaps.revert_file, "<CMD>lua require('git.revert').open(true)<CR>", options)

  vim.cmd [[command! -nargs=* GitDiff lua require("git.diff").open(<f-args>)]]
  vim.cmd [[command! GitDiffClose lua require("git.diff").close()]]
  vim.cmd [[command! -nargs=* Git lua require("git.cmd").cmd(<f-args>)]]

  vim.cmd [[command! GitRevert lua require("git.revert").open(false)]]
  vim.cmd [[command! GitRevertFile lua require("git.revert").open(true)]]
end

return M
