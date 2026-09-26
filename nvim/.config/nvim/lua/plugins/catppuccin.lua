return {
    "catppuccin/nvim",
    name = "catppuccin-mocha",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            -- auto-detect calls vim.pack.get(), which creates site/pack/core and trips :checkhealth lazy
            auto_integrations = false,
            integrations = {
                cmp = true,
                fidget = true,
                gitsigns = true,
                mason = true,
                mini = { enabled = true },
                neotree = true,
                telescope = true,
                which_key = true,
            },
        })
        -- Set colorscheme
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}
