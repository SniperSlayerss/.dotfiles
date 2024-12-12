return {
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>tt",
                "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
                desc = "Toggle Trouble",
            },
            {
                "<leader>tf",
                "<cmd>Trouble diagnostics toggle focus=false filter.buf=0<cr>",
                desc = "Toggle Trouble Focus",
            },
            {
                "<C-]>",
                "<cmd>Trouble next<cr>",
                desc = "Next Item (Trouble)",
            },
            {
                "<C-[>",
                "<cmd>Trouble prev<cr>",
                desc = "Previous Item (Trouble)",
            },
        },
    }
}
