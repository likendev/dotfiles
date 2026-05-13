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
                    "emmet_language_server",
                    "rust_analyzer",
                    "ts_ls",
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

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

            -- Toggle lsp diagnostic
            local diagnostics_active = true
            vim.keymap.set('n', '<leader>d', function()
                diagnostics_active = not diagnostics_active
                if diagnostics_active then
                    vim.diagnostic.show()
                else
                    vim.diagnostic.hide()
                end
            end)
        end,
    },
}
