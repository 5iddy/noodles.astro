return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      local dashboard = require "alpha.themes.dashboard"
      opts.section.header.val = {
        [[███╗  ██╗ █████╗  █████╗ ██████╗ ██╗     ███████╗ ██████╗]],
        [[████╗ ██║██╔══██╗██╔══██╗██╔══██╗██║     ██╔════╝██╔════╝]],
        [[██╔██╗██║██║  ██║██║  ██║██║  ██║██║     █████╗  ╚█████╗ ]],
        [[██║╚████║██║  ██║██║  ██║██║  ██║██║     ██╔══╝   ╚═══██╗]],
        [[██║ ╚███║╚█████╔╝╚█████╔╝██████╔╝███████╗███████╗██████╔╝]],
        [[╚═╝  ╚══╝ ╚════╝  ╚════╝ ╚═════╝ ╚══════╝╚══════╝╚═════╝ ]],
      }
      opts.section.buttons.val = {
        dashboard.button("e", "  New file", "<CMD>ene<CR>"),
        dashboard.button("c", "  Open Nvim Config Dir", "<CMD>cd ~/.config/nvim | NeoTreeFloat<CR>"),
        dashboard.button("a", "  Open Awesome Config Dir", "<CMD>cd ~/.config/awesome | NeoTreeFloat<CR>"),
        dashboard.button("C", "  Open Vim Config Dir", "<CMD>cd ~/.vim | NeoTreeFloat<CR>"),
        dashboard.button("z", "  Open Zshrc Config", "<CMD>e ~/.zshrc<CR>"),
        dashboard.button("Z", "  Open Zshrc Config", "<CMD>cd ~/.config/zsh | NeoTreeFloat<CR>"),
        dashboard.button("A", "  Open Alacritty Config", "<CMD>e ~/.config/alacritty/alacritty.yml<CR>"),
        dashboard.button("<leader>ff", "  Find Files"),
        dashboard.button("<leader>fr", "  Find Recent Files"),
        dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
      }
      return opts
    end,
  },
  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },
  --
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
  -- {
  --   "folke/which-key.nvim",
  --   config = function(plugin, opts)
  --     require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- Add bindings which show up as group name
  --     local wk = require "which-key"
  --     wk.register({
  --       b = { name = "Buffer" },
  --     }, { mode = "n", prefix = "<leader>" })
  --   end,
  -- },
}
