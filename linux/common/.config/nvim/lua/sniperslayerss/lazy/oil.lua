return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                ["<C-t>"] = { "actions.select", opts = { tab = true } },
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = { "actions.close", mode = "n" },
                ["<C-l>"] = "actions.select",
                ["<C-h>"] = { "actions.parent", mode = "n" },
                ["_"] = { "actions.open_cwd", mode = "n" },
            },
            float = {
                preview_split = "right",
            },
        })
        vim.keymap.set("n", "<leader>fj", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        vim.opt.splitright = true
    end
}
