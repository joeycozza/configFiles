return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        sections = {
          { section = "header" },
          { section = "keys", title = "Keymaps", indent = 1, padding = 1 },
          { section = "startup" },
          {
            section = "terminal",
            cmd = "~/Documents/pokemon-colorscripts/pokemon-colorscripts.py -r 1 --no-title; sleep .1",
            ttl = 0,
            pane = 2,
            indent = 4,
            height = 30,
          },
        },
        enabled = true,
      },
    },
  },
}
