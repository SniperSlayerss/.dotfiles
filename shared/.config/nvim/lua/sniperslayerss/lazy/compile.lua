return {
  "ej-shafran/compile-mode.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.g.compile_mode = {
    }

    vim.keymap.set("n", "<leader>cc", "<cmd>below Compile<CR>")
  end
}
