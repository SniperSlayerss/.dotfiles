return
{
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        local set = vim.keymap.set

        -- Add / skip cursor above/below (unchanged)
        set({ "n", "x" }, "<up>", function() mc.lineAddCursor(-1) end)
        set({ "n", "x" }, "<down>", function() mc.lineAddCursor(1) end)
        set({ "n", "x" }, "<M-up>", function() mc.lineSkipCursor(-1) end)
        set({ "n", "x" }, "<M-down>", function() mc.lineSkipCursor(1) end)

        -- Match word/selection: Ctrl = add, Alt = skip, n/p = direction
        set({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end)
        set({ "n", "x" }, "<C-p>", function() mc.matchAddCursor(-1) end)
        set({ "n", "x" }, "<M-n>", function() mc.matchSkipCursor(1) end)
        set({ "n", "x" }, "<M-p>", function() mc.matchSkipCursor(-1) end)

        -- Drop/remove a cursor at the current position, then keep moving with j/k
        set({ "n", "x" }, "<C-q>", mc.toggleCursor)

        -- Rarer stuff stays on leader
        set({ "n", "x" }, "<leader>A", mc.matchAllAddCursors)
        set("n", "<leader>=", mc.alignCursors)
        set("n", "<leader>n", function() mc.searchAddCursor(1) end)
        set("n", "<leader>N", function() mc.searchAddCursor(-1) end)

        set("x", "<leader>t", function() mc.transposeCursors(1) end)
        set("x", "<leader>T", function() mc.transposeCursors(-1) end)

        mc.addKeymapLayer(function(layerSet)
            layerSet({ "n", "x" }, "<left>", mc.prevCursor)
            layerSet({ "n", "x" }, "<right>", mc.nextCursor)
            layerSet({ "n", "x" }, "<M-x>", mc.deleteCursor)


            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then mc.enableCursors() else mc.clearCursors() end
            end)
            layerSet("n", "<C-c>", mc.clearCursors)
        end)

        -- Customize how cursors look
        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { reverse = true })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn" })
        hl(0, "MultiCursorMatchPreview", { link = "Search" })
        hl(0, "MultiCursorDisabledCursor", { reverse = true })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end
}
