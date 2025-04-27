vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>pv", vim.cmd.Ex)

keymap('n', '<C-s>', ':w<CR>', { silent = true })

keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
keymap("n", "<tab>", ":bnext<cr>", opts) -- Next Tab 
keymap("n", "<s-tab>", ":bprevious<cr>", opts) -- Previous tab
keymap("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close Buffer" })


keymap("x", "<leader>p", [["_dP]])

keymap({"n", "v"}, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "J", "mzJ`z")

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


vim.keymap.set("n", "<leader>oo", ":cd /home/hush/Documents/Obsidian<cr>")
vim.keymap.set("n", "<leader>os", ":Telescope find_files search_dirs={\"/home/hush/Documents/Obsidian\"}<cr>")
vim.keymap.set("n", "<leader>oz", ":Telescope live_grep search_dirs={\"/home/hush/Documents/Obsidian\"}<cr>")


vim.api.nvim_create_augroup("custom_buffer", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
desc = "Auto enter insert mode when opening a terminal",
group = "custom_buffer",
pattern = "*",
  callback = function()
    -- Wait briefly just in case we immediately switch out of the buffer (e.g. Neotest)
    vim.defer_fn(function()
      if vim.api.nvim_buf_get_option(0, 'buftype') == 'terminal' then
        vim.cmd([[startinsert]])
      end
    end, 100)
  end,
})



