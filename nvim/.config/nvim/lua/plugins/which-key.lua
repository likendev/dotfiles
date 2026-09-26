return {
    "folke/which-key.nvim",
    opts = {},
    dependencies = { 'echasnovski/mini.nvim', version = '*' },
    config = function()
        -- document existing key chains
        require("which-key").add({
            { "<leader>c", group = "[C]ode" },
            { "<leader>g", group = "[G]it" },
            { "<leader>h", group = "Git [H]unk" },
            { "<leader>t", group = "[T]oggle" },
        })
        -- register which-key VISUAL mode
        -- required for visual <leader>hs (hunk stage) to work
        require("which-key").add({
            { "<leader>",  group = "VISUAL <leader>", mode = "v" },
            { "<leader>h", desc = "Git [H]unk",       mode = "v" },
        }, { mode = "v" })
    end,
}
