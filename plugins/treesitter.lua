return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
    keys = {
      { "<leader>Pt", "<CMD>TSPlaygroundToggle<CR>", desc = "UI toggle Tree Sitter playground" },
      { "<leader>Pc", "<CMD>TSHighlightCapturesUnderCursor<CR>", desc = "Tree Sitter Highlight Captures Under Cursor" },
      { "<leader>Pn", "<CMD>TSNodeUnderCursor<CR>", desc = "Tree Sitter Node Under Cursor" },
    },
  },
  opts = {
    ensure_installed = {
      "lua",
      "python",
      "rust",
      "bash",
      "c",
      "cpp",
      "cmake",
      "css",
      "dockerfile",
      "diff",
      "go",
      "hjson",
      "json",
      "json5",
      "javascript",
      "html",
      "julia",
      "make",
      "markdown_inline",
      "regex",
      "sql",
      "toml",
      "yaml",
      "vim",
      "vue",
      "typescript",
      "query",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = false,
    },
    ident = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
  },
}
