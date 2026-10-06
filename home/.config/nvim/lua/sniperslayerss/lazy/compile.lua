-- TODO: change regexp for project? either git or presence of make file??
return {
    "ej-shafran/compile-mode.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        vim.g.compile_mode = {
            default_command = "",
            focus_compilation_buffer = true,
            use_circular_error_navigation = true,
            error_threshold = require("compile-mode").level.ERROR,
        }

        -- Plain command-line replacement for vim.ui.input
        -- (bypasses dressing/snacks/noice floating inputs)
        local function cmdline_input(opts, on_confirm)
            opts = opts or {}
            local cancel = "\0__cancel__"
            local result = vim.fn.input({
                prompt = opts.prompt or "",
                default = opts.default or "",
                completion = opts.completion,
                cancelreturn = cancel,
            })
            on_confirm(result ~= cancel and result or nil)
        end

        -- Run a command with vim.ui.input temporarily swapped out
        local function with_cmdline_input(cmd)
            local orig = vim.ui.input
            vim.ui.input = cmdline_input
            local ok, err = pcall(vim.cmd, cmd)
            vim.ui.input = orig
            if not ok then
                vim.notify(tostring(err), vim.log.levels.ERROR)
            end
        end

        vim.keymap.set("n", "<leader>cc", function()
            -- Directory of the current file, minus any oil:// prefix
            local cwd = (vim.fn.expand("%:p:h"):gsub("^oil://", ""))
            vim.cmd("lcd " .. vim.fn.fnameescape(cwd))
            with_cmdline_input("belowright Compile")
        end, { desc = "Compile (in file's directory)" })

        vim.keymap.set("n", "<leader>pc", function()
            with_cmdline_input("below Compile")
        end, { desc = "Compile (current directory)" })
    end,
}
