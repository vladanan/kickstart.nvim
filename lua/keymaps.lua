--vim.keymap.set('n', '<leader>k', function()
--  print 'radi bre!'
--end, { desc = 'proba za modularne opcije i keymaps' })

vim.keymap.set('n', 'Q', '<nop>')

-- Diagnostic keymaps
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror message' })
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- (Primagean precice za Quickfix List: ctrl+j = cnext, ctrl+k cprev)
-- kada se sa telescope uradi grr i dobije lista svi mesta gde se neka func ili type pojavljuje onda se sa Ctrl+q ceo spisak ubaci u Quickfix list, iz koje moze da se odabere neko od tih mesta (bez da se opet ide na grr), a cak i kad se iz quick fix liste izadje sa :q ili sa :cclose (vraca se naza kao i na svaki splitovani prozor sa ctrl+p ili strl+hjkl) i dalje ostaje aktivna tako da moze da se ide na sledece i prethodne pojave iz spiska sa :cnext i :cprev s tim sto ta dva mogu da se mapiraju sa precicama (Primagean: ctrl+j = cnext, ctrl+k cprev) tako da se lakse ide kroz kod tj. spisak pojava func/type/var
vim.keymap.set('n', '<C-j>', ':cnext<CR>', { desc = 'Down/next [j] in Quickfix list' })
vim.keymap.set('n', '<C-k>', ':cprev<CR>', { desc = 'Up/prev [k] in Quickfix list' })

-- da se ceo red ili blok pomera gore dole
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- da pokaze u komandoj liniji ime func u kojoj se nalazi kursor
-- pokazuje isto sto i nvim-treesitter/nvim-treesitter-context plugin koji je instaliran u ../lua/custom/plugins/init.lua
--vim.keymap.set('n', '<F2>', function()
--  local line = vim.fn.search([[^\s*func\s\+]], 'bWn')
--  if line > 0 then
--    print(vim.fn.getline(line))
--  end
--end)
-- isto samo u floating prozorcicu
vim.keymap.set('n', '<F2>', function()
  local line = vim.fn.search([[^\s*func\s\+]], 'bWn')
  if line == 0 then
    return
  end

  local text = vim.fn.getline(line)

  vim.lsp.util.open_floating_preview(
    { text }, -- contents (array of lines)
    'go', -- filetype
    {
      border = 'rounded',
      focusable = false,
    }
  )
end)

-- gj = ^ (first character on line jer g0 ide na pocetak linije isto kao i 0)
-- ovo se kosi sa gj pokretanjem unutar linije koja je na vise linija u ekranu, druga komanda za o je gk
-- tako da ostaje ^
--vim.keymap.set({ 'n', 'v' }, 'g0', '^', { desc = 'Go to first character on line' })

-- da se prebacuje na novi tab ne sa gt nego sa komfornijim i vec naucenim ctrl+tab a sa namerom da se shift+tab koristi za tab switch u konsole i alt+tab za programe (i mozda nesto trece za switch desktop)
--vim.keymap.set('n', '<C-Tab>', 'gt', { desc = 'Go to next tab' })
-- ovo dole ne radi iako je tmux podesen kako treba pa sam prebacio na leader varijante
--vim.keymap.set('n', '<C-S-Tab>', 'gT', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>h', 'gT', { desc = '[G]o to previous [T]ab' })
vim.keymap.set('n', '<leader>l', 'gt', { desc = '[G]o to previous [T]ab' })

-- precica za init.lua ali ne treba jer se spisak conf fajlova za nvim dobijaju sa <leader>sn
--vim.api.nvim_set_keymap('n', '<leader>si', ':tabnew /home/vladan/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
-- precica za fajl sa beleskama koji je obicno u dir ispod root dir za projekat
vim.api.nvim_set_keymap('n', '<leader>sb', ':tabnew ../beleske-esim.md<CR>', { noremap = true, silent = true })

-- da se svi fajlovi cuvaju sa leader w umesto :wa ali ovo usporava kucanje?
--vim.keymap.set({ 'i', 'x', 'n', 's', 'v' }, '<leader>w', '<cmd>wa<cr><esc>', { desc = 'Save file' })
vim.keymap.set({ 'n', 'v' }, '<leader>w', '<cmd>wa<cr><esc>', { desc = 'Save all files' })

-- ovo je kao ctrl+f5 na kate i na notepad
-- :map <F2> a<C-R>=strftime("%c")<CR><Esc>
-- iz nekog komplikovanog razloga nvim vidi F5 kao F5 ali Ctrl+F5 vidi kao F29:init
-- https://github.com/neovim/neovim/issues/7384
-- %c daje lokalni datum tj. sa cirilicom pa sam nasao da za c/c++ funkciju strftime bolji izgled daju (%F %T)
vim.keymap.set('n', '<F29>', 'a<C-R>=strftime("%F %T")<CR><Esc>', { desc = 'This appends the current date and time after the cursor' })

-- niz komandi za yank, search and replace
vim.keymap.set('v', '<leader>y', 'y:%s/<C-r>"/', { desc = '[Y]ank, search and replace on selected text in visual mode' })

-- -- da se kursor popne na def func uz pomoc nvim-treesitter/nvim-treesitter-context plugin koji je instaliran u ../lua/custom/plugins/init.lua
-- -- smeta za git diff ]c - jump to start of next change, [c - jump to start of previous change
-- vim.keymap.set('n', '[c', function()
--   require('treesitter-context').go_to_context(vim.v.count1)
-- end, { silent = true })

-- niz komandi za comment i uncomment paragraph, za selection, func i {} blok je lakse sa: ctrl+v + $% ili 23kj
-- stara verzija koja pravi komentare samo za Go: vim.keymap.set('n', '<leader>cp', '{j^<C-v>}kI//<esc>', { desc = '[C]omment: [p]aragraph for Go' })
vim.keymap.set('n', '<leader>cp', '{j^<C-v>}kI<C-r>=luaeval("GetComment()")<CR><esc>', { desc = '[C]omment: [p]aragraph' })
vim.keymap.set('n', '<leader>cd', '{j^<C-v>}k^lx', { desc = '[C]omment: [d]elete for whole paragraph (// or -- etc.)' })

-- -- komande za pocetak i nastavak selekcije funkcije ili bloka i stavljanja komentara na ono sto je selektovano
vim.keymap.set('n', '<leader>cs', '^<C-v>$%', { desc = '[C]omment: [S]elect function or select and keep selecting {} block for [c]omment [c]ommand' })
vim.keymap.set('v', '<leader>cs', '^$%', { desc = '[C]omment: continue [S]electing {} block for [c]omment [c]ommand' })
-- stara verzija koja pravi komentare samo za Go: vim.keymap.set({ 'n', 'v' }, '<leader>cc', 'I//<esc>', { desc = '[C]omment: [c]ommand for funcion or {} block or selecion for Go' })
vim.keymap.set({ 'n', 'v' }, '<leader>cc', 'I<C-r>=luaeval("GetComment()")<CR><esc>', { desc = '[C]omment: [c]ommand for funcion or {} block or selecion' })
