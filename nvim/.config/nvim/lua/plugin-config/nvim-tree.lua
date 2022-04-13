local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then
    vim.notify('没有找到 nvim-tree')
    return
end

nvim_tree.setup({
    -- 不显示 git 状态图标
    git = {
        enable = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 30,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        hide_root_folder = false,
        -- 打开第一个文件自动resize
        auto_resize = true,
        -- 自定义列表中快捷键
        mappings = {
            custom_only = false,
            list = {
                -- 打开文件或文件夹
                { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
                -- 分屏打开文件
                { key = 'v', action = 'vsplit' },
                { key = 'h', action = 'split' },
                -- 显示隐藏文件
                { key = 'i', action = 'toggle_ignored' }, -- Ignore (node_modules)
                { key = '.', action = 'toggle_dotfiles' }, -- Hide (dotfiles)
                -- 文件操作
                { key = 'R', action = 'refresh' },
                { key = 'a', action = 'create' },
                { key = 'd', action = 'remove' },
                { key = 'r', action = 'rename' },
                { key = 'x', action = 'cut' },
                { key = 'c', action = 'copy' },
                { key = 'p', action = 'paste' },
            },
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
})
