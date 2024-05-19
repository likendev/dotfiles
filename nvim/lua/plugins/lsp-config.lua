return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "elixirls",
                    "rust_analyzer",
                    "tsserver",
                    "tailwindcss",
                    "svelte",
                    "zls",
                },
            })
        end,
    },
    {
        {
            "j-hui/fidget.nvim",
            opts = {},
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/neodev.nvim",
                opts = {},
            },
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
                capabilities = capabilities,
            })
            lspconfig.elixirls.setup({
                capabilities = capabilities,
                cmd = { "/home/likendev/.config/elixir_ls/language_server.sh" },
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("package.json"),
                single_file_support = false,
            })
            lspconfig.denols.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
            })
            lspconfig.svelte.setup({
                capabilities = capabilities,
            })
            lspconfig.zls.setup({
                capabilities = capabilities,
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })
        end,
    },
}
