return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-github.nvim",
    "crispgm/telescope-heading.nvim",
    "tsakirist/telescope-lazy.nvim",
    "jvgrootveld/telescope-zoxide",
  },
  opts = {
    extensions = {
      case_mode = "smart_case",
      heading = {
        treesitter = true,
      },
    },
  },
  config = function(plugin, opts)
    require "plugins.configs.telescope"(plugin, opts)
    local telescope = require "telescope"

    telescope.load_extension "gh"
    telescope.load_extension "heading"
    telescope.load_extension "lazy"
    telescope.load_extension "zoxide"
  end,
}
