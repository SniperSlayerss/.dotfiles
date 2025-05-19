return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      local harpoon_extensions = require("harpoon.extensions")
      harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

      harpoon:setup({ settings = { save_on_toggle = true, save_on_ui_close = true } })

      vim.keymap.set("n", "<M-a>", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
      vim.keymap.set("n", "<C-c>", function() harpoon.ui:close_menu(harpoon:list()) end)

      vim.keymap.set("n", "<A-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<A-j>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<A-k>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<A-l>", function() harpoon:list():select(4) end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
    end
  }
}
