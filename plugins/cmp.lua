return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "FelipeLema/cmp-async-path",
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
    {
      "tzachar/cmp-fuzzy-buffer",
      dependencies = {
        "hrsh7th/nvim-cmp",
        "tzachar/fuzzy.nvim",
      },
    },
    "lukas-reineke/cmp-rg",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    {
      "garyhurtz/cmp_bulma.nvim",
      config = function() require("cmp_bulma"):setup() end,
    },
    { "Saecki/crates.nvim" },
  },
  opts = function(_, opts)
    local cmp = require "cmp"
    local kind_icons = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }

    opts.formatting = {
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
        -- Source
        vim_item.menu = ({
          buffer = "﬘ ",
          nvim_lsp = " ",
          luasnip = " ",
          nvim_lua = " ",
          latex_symbols = "🔣",
          fuzzy_buffer = "🔎 ",
          async_path = "ﱮ /",
          look = "👀",
          spell = "🔤",
          dictionary = "📖",
          nerdfont = " ",
          emoji = "😄",
          calc = " ",
          rg = "",
        })[entry.source.name]
        return vim_item
      end,
    }

    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      {
        name = "fuzzy_buffer",
        priority = 50,
        keyword_length = 3,
      },
      {
        name = "async_path",
        priority = 90,
        keyword_length = 3,
      },
      { name = "nvim_lua", priority = 1000 },
      {
        name = "buffer",
        priority = 40,
        keyword_length = 3,
      },
      { name = "calc", priority = 1 },
      {
        name = "look",
        option = { convert_case = true, loud = true },
        priority = 2,
        keyword_length = 3,
      },
      {
        name = "spell",
        option = { keep_all_entries = false },
        keyword_length = 3,
        priority = 3,
      },
      {
        name = "dictionary",
        priority = 4,
        keyword_length = 3,
      },
      {
        name = "nerdfont",
        priority = 10,
      },
      { name = "emoji", priority = 10 },
      { name = "zsh", priority = 500 },
      { name = "rg", keyword_length = 3, priority = 80 },
      {
        name = "bulma",
        keyword_length = 3,
        priority = 200,
      },
      {
        name = "crates",
      },
    }
    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }
    -- `/` cmdline setup.
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
        { name = "rg" },
        { name = "fuzzy_buffer" },
        { name = "nvim_lsp_document_symbol" },
      },
    })
    -- `:` cmdline setup.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })
    return opts
  end,
}
