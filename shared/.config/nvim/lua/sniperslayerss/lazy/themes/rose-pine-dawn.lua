return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        variant = "dawn",
        disable_background = false,
        dim_inactive_windows = false,
        styles = {
          italic = false,
        },
        groups = {
          background = '#F7F7F7'
        },
      })

      vim.cmd.colorscheme("rose-pine-dawn")
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
  },
}
