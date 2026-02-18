-- Vimscr Lua (for Neovim with init.lua)

--vim.cmd [[
--  highlight Normal guibg=none
--  highlight NonText guibg=none
--  highlight Normal ctermbg=none
--  highlight NonText ctermbg=none
--]]

vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.o.scrolloff = 0

-- da umesto 'default' theme bude uvek ukljucena 'quiet' tema
-- negde na liniji 1002 je iskljucena tema tokyonight
-- default quiet tema za nvim
-- /usr/share/nvim/runtime/colors/quiet.vim
-- ali na quiet se ne vidi lepo ni potpis func sa shift+k, ni aktivna func za koju sam dole podesio F2 a na default se vidi lepo, tako da mora da se vidi da se ili finije podesi shift+K F2 na quiet i to sam uradio tako sto sam napravio svoju novu temu quietv po uputstvu na https://neovim.io/doc/user/usr_06.html i dodao:
--  hi NormalFloat guifg=#dadada guibg=NONE gui=NONE cterm=NONE i sada radi lepo a videcu sta jos mogu da podesim ako mi zatreba
vim.cmd 'colorscheme quietv'
--vim.cmd 'colorscheme default'
-- izmene default ne idu a menjanje quiet takodje ne idu da se ovo desava (jer zuta za highlight uvek preboji highlight i tekst se tesko cita):
-- what woud be the setting for this:
-- text for keywords and variables are already automatically highlighted with some colors, when cursor is placed on some highlighted word:
--- the backgruoud for that word and all other words turns grey
--- cursor background gets the color of that word and characher on cursor becomes gray i.e. gets inversed colouring compared to higlighted wordkkk

-- ruzne izmene za default temu ali nepotrebno jer moja quietv radi isto tako
--vim.api.nvim_set_hl(0, 'Comment', {
--  fg = '#8c886c',
--  bg = 'NONE',
--})
--
----vim.api.nvim_set_hl(0, 'Function', {
----  fg = '#029be0',
----  bg = 'NONE',
----  force = true,
----})
--
--vim.api.nvim_set_hl(0, 'Title', {
--  fg = '#36b23f',
--  bg = 'NONE',
--})
--vim.api.nvim_set_hl(0, '@markup', {
--  fg = '#ffaf00',
--  bg = 'NONE',
--})
--
--vim.api.nvim_set_hl(0, 'TabLine', {
--  fg = '#8c886c',
--  bg = '#000000',
--  reverse = true,
--})
--vim.api.nvim_set_hl(0, 'TabLineFill', {
--  fg = '#dadada',
--  bg = 'NONE',
--})
--vim.api.nvim_set_hl(0, 'TabLineSel', {
--  fg = '#42c3fc',
--  bg = '#111110',
--})
--
--vim.api.nvim_set_hl(0, 'Constant', {
--  fg = '#dadada',
--  bg = 'NONE',
--  force = true,
--})
--vim.api.nvim_set_hl(0, 'String', {
--  fg = '#dadada',
--  bg = 'NONE',
--  force = true,
--})
--vim.api.nvim_set_hl(0, 'Identifier', {
--  fg = '#dadada',
--  bg = 'NONE',
--  force = true,
--})
--vim.api.nvim_set_hl(0, 'Special', {
--  fg = '#dadada',
--  bg = 'NONE',
--  force = true,
--})
--vim.api.nvim_set_hl(0, 'MatchParen', {
--  fg = '#ff00af',
--  bg = 'NONE',
--  force = true,
--  bold = true,
--})
--
--vim.api.nvim_set_hl(0, 'Keyword', {
--  bold = false,
--})
--
--vim.api.nvim_set_hl(0, 'DiagnosticError', {
--  fg = '#ff005f',
--  bg = 'NONE',
--  force = true,
--})
--vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', {
--  fg = '#ff005f',
--  bg = 'NONE',
--  underline = true,
--  force = true,
--})
--
--vim.api.nvim_set_hl(0, 'Visual', {
--  fg = '#ffaf00',
--  bg = 'NONE',
--  force = true,
--})

-- treba i da se ne vide tabovi, da se ne vidi oznacena linija na kojoj je kursor
-- Disable showing special characters (tabs/spaces)
vim.opt.list = false
-- Disable cursor line highlighting
vim.opt.cursorline = false

-- da osvezavaju bufferi kada se primeti promena stanja na disku, kao recimo git checkout branch, ili se fajl promeni u nekon drugom editoru ili programu ali ovo dole ne radi
vim.cmd 'set autoread'
vim.cmd 'au CursorHold * checktime'

vim.lsp.config('ruff', {
  init_options = {
    settings = {
      -- Ruff language server settings go here
    },
  },
})

vim.lsp.enable 'ruff'
