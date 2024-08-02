return {
  {
    "numToStr/FTerm.nvim",
    keys = {
      { "<leader>tt", "<cmd>lua require('FTerm').toggle()<cr>", desc = "Toggle FTerm" },
      {
        "<leader>tr",
        "<cmd>lua require('utils').runBufferAsNode()<CR>",
        desc = "Run current buffer as a node process",
      },
    },
  },
}
