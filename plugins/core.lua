local utils = require "astronvim.utils"

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
        dashboard.button(
          "c",
          "  Open Nvim Config Dir",
          "<CMD>cd ~/.config/nvim | e lua/user/init.lua | Neotree<CR>"
        ),
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
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      local function sort_by_type(a, b)
        if a.type == b.type then
          return a.path < b.path
        else
          return a.type < b.type
        end
      end

      opts.sort_function = sort_by_type

      opts.icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
      }
      if not opts.filesystem.filtered_items then opts.filesystem.filtered_items = {} end
      opts.filesystem.filtered_items.hide_by_name = {
        "target",
        ".git",
      }
      opts.window.mappings = utils.extend_tbl(opts.window.mappings, {
        ["a"] = {
          "add",
          config = {
            show_path = "absolute",
          },
        },
      })
    end,
  },
  {
    "booperlv/nvim-gomove",
    keys = { "<A-h>", "<A-j>", "<A-k>", "<A-l>" },
    config = true,
  },
  {
    "jghauser/follow-md-links.nvim",
    ft = "markdown",
    init = function() vim.keymap.set("n", "<bs>", ":edit #<cr>", { silent = true }) end,
  },
  {
    "toppair/peek.nvim",
    ft = "markdown",
    build = "deno task --quiet build:fast",
    cmd = { "PeekClose", "PeekOpen" },
    config = function()
      local peek = require "peek"
      local create_cmd = vim.api.nvim_create_user_command
      peek.setup {
        app = "firefox",
      }
      create_cmd("PeekOpen", peek.open, { desc = "Markdown preview open" })
      create_cmd("PeekClose", peek.close, { desc = "Markdown preview close" })
    end,
  },
  {
    "antonk52/markdowny.nvim",
    ft = "markdown",
    config = true,
  },
  {
    "ray-x/lsp_signature.nvim",
  },
}
