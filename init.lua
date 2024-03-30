-- 基本設定
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.textwidth = 0
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.clipboard = 'unnamed'
vim.opt.syntax = 'on'
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.wrapscan = true

-- プラグイン管理
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ntk148v/vim-horizon'
  use 'preservim/nerdtree'
  use 'junegunn/fzf'
end)

-- NERDTreeの設定
vim.api.nvim_create_autocmd('StdinReadPre', {
  pattern = '*',
  callback = function()
    local s = require('vim.loop').new_fs_stdin():read_lines()
    vim.cmd('let s:std_in=1')
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  callback = function()
    if #vim.v.argv == 0 and not vim.g.std_in then
      vim.cmd('NERDTree')
    end
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match('NERD_tree') ~= nil then
      vim.cmd('quit')
    end
  end,
})

vim.keymap.set('n', '<leader>n', ':NERDTreeFocus<CR>')
vim.keymap.set('n', '<C-n>', ':NERDTree<CR>')
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', ':NERDTreeFind<CR>')

vim.g.NERDTreeShowHidden = 1
