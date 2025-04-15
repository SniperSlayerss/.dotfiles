return {
  "ej-shafran/compile-mode.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- vim.keymap.set("n", "<leader>cc", "<cmd>below Compile<CR>")
    vim.g.compile_mode = {
      default_command = ""
    }

    vim.keymap.set("n", "<leader>cc", function()
      local cwd = vim.fn.expand("%:p:h") -- Get the directory of the current file

      -- Remove 'oil://' prefix if present
      if cwd:match("^oil://") then
        cwd = cwd:gsub("^oil://", "")
      end

      -- Temporarily change directory, run Compile, then restore the original directory
      vim.cmd("lcd " .. vim.fn.fnameescape(cwd)) -- Change directory locally
      vim.cmd("belowright Compile")          -- Run Compile in the correct directory
    end, {})

    vim.keymap.set("n", "<leader>pc", "<cmd>below Compile<CR>")
  end
}





-- vim.keymap.set("n", "<leader>ff", function()
--   local cwd = vim.fn.expand("%:p:h") -- Get the directory of the current file
--
--   -- Remove 'oil:///' prefix if present
--   if cwd:match("^oil://") then
--     cwd = cwd:gsub("^oil://", "")
--   end
--
--   local opts = {
--     cwd = cwd,
--     hidden = true,
--     no_ignore = true,
--     file_ignore_patterns = { ".git/" },
--   }
--   builtin.find_files(opts)
-- end, {})
--
