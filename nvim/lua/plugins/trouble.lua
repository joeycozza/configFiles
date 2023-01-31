return {
  'folke/trouble.nvim',
  keys = {
    { '<Up>', ':Trouble document_diagnostics<CR>', desc = 'Up to open Trouble' },
    { '<Down>', ':TroubleClose<CR>', desc = 'Down to close Trouble' }, {
      '<Left>',
      '<cmd>lua require(\'trouble\').previous({skip_groups = true, jump = true})<CR>',
      desc = 'Left to go to previous Trouble item'
    }, {
      '<Right>',
      '<cmd>lua require(\'trouble\').next({skip_groups = true, jump = true})<CR>',
      desc = 'Right to go to next Trouble item'
    }
  }
}
