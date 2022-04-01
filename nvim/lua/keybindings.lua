vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

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

-- save file
map('n', '<C-s>', ':w<CR>', opt)

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

-- lsp 快捷键设置
map('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opt)
map('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)
map('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opt)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
map('n', 'gp', '<cmd>Lspsaga preview_definition<CR>', opt)
map('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opt)
-- diagnostic
map('n', 'ga', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
map('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', opt)
map('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opt)

map('n', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)

-- 插件快捷键
local pluginKeys = {}

-- 列表快捷键
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
    -- 分屏打开文件
    { key = 'v', action = 'vsplit' },
    { key = 'h', action = 'split' },
    -- 显示隐藏文件
    { key = 'i', action = 'toggle_ignored' }, -- Ignore (node_modules)
    { key = '.', action = 'toggle_dotfiles' }, -- Hide (dotfiles)
    -- 文件操作
    { key = '<F5>', action = 'refresh' },
    { key = 'a', action = 'create' },
    { key = 'd', action = 'remove' },
    { key = 'r', action = 'rename' },
    { key = 'x', action = 'cut' },
    { key = 'c', action = 'copy' },
    { key = 'p', action = 'paste' },
}

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
    end

    return {
        -- 上一个
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        -- 如果窗口内容太多，可以滚动
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        -- super Tab
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn['vsnip#available'](1) == 1 then
                feedkey('<Plug>(vsnip-expand-or-jump)', '')
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn['vsnip#jumpable'](-1) == 1 then
                feedkey('<Plug>(vsnip-jump-prev)', '')
            end
        end, { 'i', 's' }),
        -- end of super Tab
    }
end

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
    toggler = {
        line = 'gcc',
        block = 'gbc',
    },
    opleader = {
        line = 'gc',
        bock = 'gb',
    },
}
-- ctrl + /
map('n', '<C-/>', 'gcc', {
    noremap = false,
})
map('v', '<C-/>', 'gcc', {
    noremap = false,
})

return pluginKeys
