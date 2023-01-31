return {

  { 'yuttie/comfortable-motion.vim', event = 'VeryLazy' },

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    'ggandor/leap.nvim',
    event = 'VeryLazy',
    dependencies = { { 'ggandor/flit.nvim', opts = { labeled_modes = 'nv' } } }
  }

}
