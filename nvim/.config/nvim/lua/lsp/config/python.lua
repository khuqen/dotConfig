local opts = {
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                useLibraryCodeForTypes = true,
            },
            reportMissingTypeStubs = true,
        },
    },
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end,
}

return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
