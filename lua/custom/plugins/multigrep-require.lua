-- jedan nacin da se uveze multigrep onako kako ga je teej dao:
-- return {
--   name = "multigrep",
--   dir = vim.fn.stdpath("config"), -- fake plugin location
--   config = function()
--     require('custom.telescope.multigrep').setup()
--   end,
-- }
-- drugi nacim sa malo izmenjenim multigrep ali boljom integracijom sa telescope u ovim custom dir
return {
  'nvim-telescope/telescope.nvim',
  keys = {
    {
      '<leader>sm',
      function() require('custom.telescope.multigrep').live_multigrep() end,
      desc = 'Multi Grep',
    },
  },
}
