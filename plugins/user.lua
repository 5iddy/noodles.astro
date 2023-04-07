return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    config = function(_, _)
      require("lsp_lines").setup()
      vim.keymap.set(
        "n",
        "<Leader>ln",
        function() require("lsp_lines").toggle() end,
        { desc = "Toggle Lsp Lines", remap = false, silent = true }
      )
    end,
  },
  {
    "rafcamlet/nvim-luapad",
    cmd = "Luapad",
    opts = {},
    config = function(_, opts) require("luapad").setup(opts) end,
  },
}
