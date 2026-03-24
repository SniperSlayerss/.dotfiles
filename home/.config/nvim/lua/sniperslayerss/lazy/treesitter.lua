return {
  "nvim-treesitter/nvim-treesitter",
  priority = 1000,
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "vimdoc", "javascript", "typescript", "c", "lua", "rust",
        "jsdoc", "bash",
      },
      sync_install = false,
      auto_install = true,
      indent = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
        },
      },
    })

    vim.filetype.add({ extension = { templ = "templ" } })
    vim.treesitter.language.register("templ", "templ")

    vim.keymap.set({ "n", "v" }, "<C-Down>", function()
      vim.opt.lazyredraw = true
      require("nvim-treesitter.textobjects.move").goto_next_start({
        "@function.outer",
        "@class.outer",
      })
      vim.cmd("normal! zz")
      vim.opt.lazyredraw = false
      vim.cmd("redraw")
    end, { desc = "Jump to next function or class via Treesitter" })

    vim.keymap.set({ "n", "v" }, "<C-Right>", function()
      vim.opt.lazyredraw = true
      require("nvim-treesitter.textobjects.move").goto_next_end({
        "@function.outer",
        "@class.outer",
      })
      vim.cmd("normal! zz")
      vim.opt.lazyredraw = false
      vim.cmd("redraw")
    end, { desc = "Jump to next function end or class end via Treesitter" })

    vim.keymap.set({ "n", "v" }, "<C-Up>", function()
      vim.opt.lazyredraw = true
      require("nvim-treesitter.textobjects.move").goto_previous_start({
        "@function.outer",
        "@class.outer",
      })
      vim.cmd("normal! zz")
      vim.opt.lazyredraw = false
      vim.cmd("redraw")
    end, { desc = "Jump to previous function or class via Treesitter" })

    vim.keymap.set({ "n", "v" }, "<C-Left>", function()
      vim.opt.lazyredraw = true
      require("nvim-treesitter.textobjects.move").goto_previous_end({
        "@function.outer",
        "@class.outer",
      })
      vim.cmd("normal! zz")
      vim.opt.lazyredraw = false
      vim.cmd("redraw")
    end, { desc = "Jump to previous function end or class end via Treesitter" })

    vim.keymap.set("n", "]c", function()
      require("nvim-treesitter.textobjects.move").goto_next_start({
        "@class.outer",
      })
    end, { desc = "Jump to next class via Treesitter" })

    vim.keymap.set("n", "[c", function()
      require("nvim-treesitter.textobjects.move").goto_previous_start({
        "@class.outer",
      })
    end, { desc = "Jump to previous class via Treesitter" })
  end
}
