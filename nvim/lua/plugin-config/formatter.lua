require('formatter').setup({
    filetype = {
        lua = {
            function()
                return {
                    exe = 'stylua',
                    args = {
                        -- "--config-path "
                        --   .. os.getenv("XDG_CONFIG_HOME")
                        --   .. "/stylua/stylua.toml",
                        '-',
                    },
                    stdin = true,
                }
            end,
        },
        javascript = {
            -- prettier
            function()
                return {
                    exe = 'perettier',

                    args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote' },
                    stdin = true,
                }
            end,
        },
        -- Configuration for goimports
        go = {
            function()
                return {
                    exe = 'goimports',
                    args = { '-w', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
                    stdin = false,
                }
            end,
        },
        python = {
            function()
                return {
                    exe = 'python3 -m autopep8',
                    args = {
                        '--in-place --aggressive --aggressive',
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                    },
                    stdin = false,
                }
            end,
        },
    },
})

-- format on save
vim.api.nvim_exec(
    [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.go,*.py,*.lua FormatWrite
    augroup END
]],
    true
)
