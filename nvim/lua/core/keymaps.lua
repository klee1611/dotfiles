local function map(mode, lhs, rhs, opts)
    local options = { noremap=true, silent=true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", " ", "<Nop>")

-- Change leader to a comma
vim.g.mapleader = ','

-- NvimTree
map('n', '<F2>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-- Editor tabs
map('n', 'tc', ':tabnew<CR>')               -- new tab
map('n', 'tn', ':tabnext<CR>')              -- next tab
map('n', 'tp', ':tabprevious<CR>')          -- previous tab
map('n', 'tk', ':tabclose<CR>')             -- close tab
map('n', 't1', ':tabn 1<CR>')             -- first tab
map('n', 't2', ':tabn 2<CR>')              -- second tab
map('n', 't3', ':tabn 3<CR>')              -- third tab
map('n', 't4', ':tabn 4<CR>')              -- fourth tab
map('n', 't5', ':tabn 5<CR>')              -- fifth tab
map('n', 't6', ':tabn 6<CR>')              -- sixth tab
map('n', 't7', ':tabn 7<CR>')              -- seventh tab
map('n', 't8', ':tabn 8<CR>')              -- eighth tab
map('n', 't9', ':tabn 9<CR>')              -- ninth tab
map('n', 't0', ':tabn 10<CR>')             -- tenth tab
