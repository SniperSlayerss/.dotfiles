return {
  {
    "X3eRo0/dired.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      local dired = require("dired")
      dired.setup {
        path_separator = "/",
        show_banner = false,
        show_icons = false,
        show_hidden = true,
        show_dot_dirs = true,
        show_colors = true,
      }

      vim.api.nvim_create_user_command("DiredHere", function()
        local dir = vim.fn.expand("%:p:h")
        dired.open(dir)
      end, {})
    end
  }
}
