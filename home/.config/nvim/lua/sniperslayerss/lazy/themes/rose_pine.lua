return {
  {
    "SniperSlayerss/rose-pine-nvim",
    -- dir = "~/personal/rose-pine-nvim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        variant = "moon",
        disable_background = true,
        dim_inactive_windows = false,
        styles = {
          italic = false,
          bold = false,
        },
      })

      vim.cmd.colorscheme("rose-pine-moon")
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
  },
}
