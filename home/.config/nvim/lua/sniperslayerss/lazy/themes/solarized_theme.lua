return {
    {
        "maxmx03/solarized.nvim",
        -- priority = 1000,
        config = function()
            require("solarized").setup({
                palette = "solarized",
                variant = "winter",
            })

            vim.opt.termguicolors = true
            vim.opt.background = "light"
            vim.cmd.colorscheme("solarized")
        end,
    },
}
