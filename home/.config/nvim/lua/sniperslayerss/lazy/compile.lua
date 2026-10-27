-- TODO: change regexp for project? either git or presence of make file??
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

        local last_command = ""

        -- Prompt on the real command line, then run :Compile with the result
        local function prompt_and_compile(split)
            local cancel = "\0__cancel__"
            local cmd = vim.fn.input({
                prompt = "Compile command: ",
                default = last_command,
                completion = "shellcmd",
                cancelreturn = cancel,
            })
            if cmd == cancel or cmd == "" then
                return
            end
            last_command = cmd
            vim.cmd(split .. " Compile " .. cmd)
        end

        vim.keymap.set("n", "<leader>cc", function()
            -- Directory of the current file, minus any oil:// prefix
            local cwd = (vim.fn.expand("%:p:h"):gsub("^oil://", ""))
            vim.cmd("lcd " .. vim.fn.fnameescape(cwd))
            prompt_and_compile("belowright")
        end, { desc = "Compile (in file's directory)" })

        vim.keymap.set("n", "<leader>pc", function()
            prompt_and_compile("below")
        end, { desc = "Compile (current directory)" })
    end,
}
