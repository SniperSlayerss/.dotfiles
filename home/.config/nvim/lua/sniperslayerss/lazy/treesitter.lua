return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
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

    local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    treesitter_parser_config.templ = {
      install_info = {
        url = "https://github.com/vrischmann/tree-sitter-templ.git",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "master",
      },
    }

    vim.treesitter.language.register("templ", "templ")

    vim.keymap.set("n", "<C-]>", function()
      require("nvim-treesitter.textobjects.move").goto_next_start({
        "@function.outer",
        "@class.outer",
      })
    end, { desc = "Jump to next function or class via Treesitter" })

    vim.keymap.set("n", "<C-[>", function()
      require("nvim-treesitter.textobjects.move").goto_previous_start({
        "@function.outer",
        "@class.outer",
      })
    end, { desc = "Jump to previous function or class via Treesitter" })


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
