return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "ahmedkhalf/project.nvim",
  },

  config = function()
    local actions = require("telescope.actions")
    local telescope = require("telescope")

    -- Load project.nvim before setting up telescope
    require("project_nvim").setup({
      detection_methods = { "pattern", "lsp" },
      patterns = { ".git", "Makefile", "package.json", "pyproject.toml", ".projectile" },
      manual_mode = false,
      silent_chdir = false,
      scope_chdir = "global",
    })

    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ["<C-c>"] = actions.close,
          },
        },

        layout_strategy = 'bottom_pane',
        layout_config = {
          height = 0.25,
          preview_cutoff = 20,
          prompt_position = "bottom"
        },
        previewer = false,
      },
      pickers = {
        find_files = {
          previewer = false,
        },
        git_files = {
          previewer = false,
        },
      },
      extensions = {
        projects = {},
      },
    })

    -- Load the project extension
    telescope.load_extension("projects")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
    vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
    vim.keymap.set("n", "<leader>pws", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

    -- Add a keybinding for listing projects
    vim.keymap.set("n", "<leader>pp", function()
      require("telescope").extensions.projects.projects({
        attach_mappings = function(_, map)
          map("i", "<CR>", function(prompt_bufnr)
            local action_state = require("telescope.actions.state")
            local actions = require("telescope.actions")
            local selected_entry = action_state.get_selected_entry()
            local project_path = selected_entry.value

            actions.close(prompt_bufnr)
            vim.cmd("cd " .. project_path)

            -- Open find_files including hidden & ignored files
            require("telescope.builtin").find_files({
              cwd = project_path,
              hidden = true,
              no_ignore = true,
              file_ignore_patterns = { ".git/" },
            })
          end)
          return true
        end,
      })
    end, { desc = "Find and Search Projects" })
  end
}
