local opts = {
    settings = {
        gopls = {
            analyses = { unusedparams = true, nonewvars = true },
            staticcheck = true,
            usePlaceholders = false,
            completeUnimported = true,
        },
    },
}

return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
