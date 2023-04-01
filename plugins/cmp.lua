local utils = require "astronvim.utils"

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "octaltree/cmp-look",
    "hrsh7th/cmp-calc",
    "f3fora/cmp-spell",
    {
      "uga-rosa/cmp-dictionary",
      opts = {
        dic = { ["*"] = "/home/noodles/dictionaries/en_us.dict" },
      },
    },
    "chrisgrieser/cmp-nerdfont",
    "hrsh7th/cmp-emoji",
    "L3MON4D3/LuaSnip",
    { "onsails/lspkind.nvim" },
    {
      "tamago324/cmp-zsh",
      opts = { zshrc = true, filetypes = { "zsh" } },
    },
  },
  opts = function(_, opts)
    local cmp = require "cmp"
    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
      { name = "nvim_lua", priority = 600 },
      { name = "buffer", priority = 250 },
      { name = "calc" },
      {
        name = "look",
        option = { convert_case = true, loud = true },
      },
      {
        name = "spell",
        option = { keep_all_entries = false },
      },
      { name = "dictionary", priority = 200 },
      { name = "nerdfont" },
      { name = "emoji" },
      { name = "zsh" },
    }
    return opts
  end,
}
