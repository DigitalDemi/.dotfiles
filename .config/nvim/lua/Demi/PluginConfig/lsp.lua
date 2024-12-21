for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end

-- LSP Keybindings
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = {buffer = event.buf, remap = false}
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>dl", function() vim.diagnostic.setloclist() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
})

-- LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.workspace = {
    configuration = true,
    workspaceFolders = true,
    didChangeWatchedFiles = {
        dynamicRegistration = true
    }
}

-- Mason setup
require('mason').setup({})

-- Define handlers
local handlers = {
    -- Default handler (will be called for each installed server that doesn't have a dedicated handler)
    function(server_name)
        require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            root_dir = function(fname)
                local util = require('lspconfig.util')
                return util.root_pattern('.git', 'package.json', 'Cargo.toml')(fname) or
                       util.find_git_ancestor(fname) or
                       util.path.dirname(fname)
            end,
            on_init = function(client)
                local path = client.workspace_folders and client.workspace_folders[1] and
                            client.workspace_folders[1].name
                if path then
                    client.config.root_dir = path
                end
                return true
            end
        })
    end,

    -- Lua LSP specific configuration
    ["lua_ls"] = function()
        require('lspconfig').lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = {'vim'},
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })
    end,

    -- TypeScript specific configuration
    ["ts_ls"] = function()
        require('lspconfig').ts_ls.setup({
            capabilities = capabilities,
            root_dir = require('lspconfig.util').root_pattern('package.json', 'tsconfig.json', '.git'),
        })
    end,

    -- Rust specific configuration with fix for server cancellation
    ["rust_analyzer"] = function()
        require('lspconfig').rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
                ['rust-analyzer'] = {
                    diagnostics = {
                        refreshSupport = false
                    },
                    cargo = {
                        allFeatures = true,
                    },
                    checkOnSave = {
                        command = "clippy",
                    },
                }
            }
        })
    end,
}

-- Setup mason-lspconfig with handlers
require('mason-lspconfig').setup({
    ensure_installed = {'lua_ls', 'ts_ls', 'rust_analyzer'},
    handlers = handlers,
})

-- Completion setup
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-f>'] = cmp.mapping(function()
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            end
        end),
        ['<C-b>'] = cmp.mapping(function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = 4 },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    })
})

-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
