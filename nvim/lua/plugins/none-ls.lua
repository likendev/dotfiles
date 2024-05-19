return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua.with({
                    condition = function(utils)
                        return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
                    end,
                }),
                null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.formatting.prettier,
            },
        })
        vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, {})
    end,
}
