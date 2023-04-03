return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-github.nvim",
            "crispgm/telescope-heading.nvim",
            "jvgrootveld/telescope-zoxide",
            "barrett-ruth/telescope-http.nvim",
            "LinArcX/telescope-env.nvim",
            "ghassan0/telescope-glyph.nvim",
            "xiyaowong/telescope-emoji.nvim",
        },
        opts = {
            extensions = {
                case_mode = "smart_case",
                heading = {
                    treesitter = true,
                },
                glyph = {
                    action = function(glyph) vim.api.nvim_put({ glyph.value }, "c", false, true) end,
                },
                emoji = {
                    action = function(emoji) vim.api.nvim_put({ emoji.value }, "c", false, true) end,
                },
            },
        },
        keys = {
            { "<leader>fz", "<CMD>Telescope zoxide list<CR>", desc = "List Zoxide directories" },
            { "<leader>fH", "<CMD>Telescope headings<CR>",    desc = "Find headings in a markdown file" },
            { "<leader>fg", "<CMD>Telescope git_files<CR>",   desc = "Find git files in the repo" },
            { "<leader>fG", "<CMD>Telescope glyph<CR>",       desc = "Find Glyphs" },
            { "<leader>fe", "<CMD>Telescope emoji<CR>",       desc = "Find Emoji" },
        },
        config = function(plugin, opts)
          require "plugins.configs.telescope"(plugin, opts)
          local telescope = require "telescope"

          telescope.load_extension "gh"
          telescope.load_extension "heading"
          telescope.load_extension "zoxide"
          telescope.load_extension "http"
          telescope.load_extension "env"
          telescope.load_extension "glyph"
          telescope.load_extension "emoji"
        end,
    },
}
