return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua.with({
                    condition = function(utils)
                        return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
                    end,
                }),
                null_ls.builtins.formatting.prettierd.with {
                    filetypes = { "html", "json", "svelte", "markdown", "css", "javascript", "javascriptreact" }
                },
                require("none-ls.diagnostics.eslint_d"),
            },
        })
        vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
        end, {})
    end,
}
