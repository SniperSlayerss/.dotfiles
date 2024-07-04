vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")


-- Set keymap options
local opts = { noremap = true, silent = true }
-- BarBar
local map = vim.api.nvim_set_keymap

-- Move to previous/next
map('n', '<D-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<D-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<D-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<D->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<D-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<D-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<D-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<D-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<D-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<D-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<D-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<D-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<D-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<D-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<D-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<D-c>', '<Cmd>BufferClose<CR>', opts)
-- Magic buffer-picking mode
map('n', '<D-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
