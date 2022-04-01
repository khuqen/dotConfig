vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_footer = { "coding" }

vim.g.dashboard_custom_section = {
    a = { description = { '  Recently files        ' }, command = 'Telescope oldfiles' },
    b = { description = { '  Find file             ' }, command = 'Telescope find_files' },
    c = { description = { '  Find text             ' }, command = 'Telescope live_grep' },
    d = { description = { '  Edit .zshrc           ' }, command = "edit ~/.zshrc" },
}

vim.g.dashboard_custom_header = {
    [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
    [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
    [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
    [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
    [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    [[                                                   ]],
    [[                [ version : 1.0.0 ]                ]],
}
