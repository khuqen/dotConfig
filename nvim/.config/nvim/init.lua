-- 基础设置
require('basic')
-- 快捷键
require('keybindings')
-- 插件管理
require('plugins')
-- 主题设置
require('colorscheme')
-- 插件配置
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.dashboard')
require('plugin-config.nvim-treesitter')
require('plugin-config.nvim-autopairs')
require('plugin-config.comment')
require('plugin-config.gitsigns')
require('plugin-config.diffview')
require('plugin-config.indent-blankline')

require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')

require('lsp.null-ls')
