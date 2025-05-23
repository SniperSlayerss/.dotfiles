vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- replaced by ] and [ with treesitter function jumping
vim.keymap.set("n", "]]", "<nop>")
vim.keymap.set("n", "[[", "<nop>")

local function c_d()
  vim.opt.lazyredraw = true
  local cd_key = vim.api.nvim_replace_termcodes("<C-d>", true, false, true)
  vim.api.nvim_feedkeys(cd_key, "n", true)
  vim.cmd("normal! zz")
  vim.opt.lazyredraw = false
  vim.cmd("redraw")
end
vim.keymap.set("n", "<C-d>", c_d)


local function c_u()
  vim.opt.lazyredraw = true
  local cu_key = vim.api.nvim_replace_termcodes("<C-u>", true, false, true)
  vim.api.nvim_feedkeys(cu_key, "n", true)
  vim.cmd("normal! zz")
  vim.opt.lazyredraw = false
  vim.cmd("redraw")
end
vim.keymap.set("n", "<C-u>", c_u)

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

---- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>fj", "<cmd>DiredHere<CR>")
