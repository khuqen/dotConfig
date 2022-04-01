vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

-- 取消 s 默认功能
map('n', 's', '', opt)
-- windows 分屏快捷键
map('n', 'sv', ':vsp<CR>', opt)
map('n', 'sh', ':sp<CR>', opt)
-- 关闭当前
map('n', 'sc', '<C-w>c', opt)
-- 关闭其他
map('n', 'so', '<C-w>o', opt)
-- 左右比例控制
map('n', 's,', ':vertical resize -10<CR>', opt)
map('n', 's.', ':vertical resize +10<CR>', opt)
-- 上下比例
map('n', 'sj', ':resize +10<CR>', opt)
map('n', 'sk', ':resize -10<CR>', opt)
-- 等比例
map('n', 's=', '<C-w>=', opt)
-- 上下滚动浏览
map('n', '<C-j>', '4j', opt)
map('n', '<C-k>', '4k', opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map('n', '<C-u>', '9k', opt)
map('n', '<C-d>', '9j', opt)

-- 取消高亮
map('n', '<Esc>', ':nohl<CR>', opt)
-- save
map('n', '<C-s>', ':w<CR>', opt)
-- close
map('n', 'qq', ':q<CR>', opt)
map('n', 'Q', ':qa<CR>', opt)

-- bufferline
-- 左右Tab切换
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', opt)
-- 关闭
--"moll/vim-bbye"
map('n', '<leader>x', ':Bdelete!<CR>', opt)
map('n', '<leader>bl', ':BufferLineCloseRight<CR>', opt)
map('n', '<leader>bh', ':BufferLineCloseLeft<CR>', opt)
map('n', '<leader>bc', ':BufferLinePickClose<CR>', opt)

-- Telescope
-- 查找文件
map('n', '<leader>ff', ':Telescope find_files<CR>', opt)
-- 全局搜索
map('n', '<leader>fw', ':Telescope live_grep<CR>', opt)

-- v模式下缩进代码
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)
-- 上下移动选中文本
map('v', 'J', ":move '>+1<CR>gv-gv", opt)
map('v', 'K', ":move '<-2<CR>gv-gv", opt)

-- i模式移动光标
map('i', '<C-h>', '<Left>', opt)
map('i', '<C-j>', '<Down>', opt)
map('i', '<C-k>', '<Up>', opt)
map('i', '<C-l>', '<Right>', opt)
--- 移动到行首，行尾
map('i', '<C-a>', '<Esc>I', opt)
map('i', '<C-e>', '<Esc>A', opt)
-- jk退出i模式
map('i', 'jk', '<Esc>', opt)

-- nvim-tree
-- 打开关闭tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opt)

-- diffview
map('n', '<leader>do', ':DiffviewOpen<CR>', opt)
map('n', '<leader>dc', ':DiffviewClose<CR>', opt)
-- fugitive
map('n', '<leader>gs', ':G<CR>', opt)
map('n', '<leader>g3', ':Gvdiffsplit!<CR>', opt)
map('n', '<leader>dh', ':diffget //2<CR>', opt)
map('n', '<leader>dl', ':diffget //3<CR>', opt)

-- lsp 快捷键设置
map('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opt)
map('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opt)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
map('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opt)
-- diagnostic
map('n', 'ga', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
map('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', opt)
map('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opt)

map('v', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', opt)
