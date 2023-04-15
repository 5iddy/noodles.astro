return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "nordfox",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = {
      severity = vim.diagnostic.severity.ERROR,
    },
    underline = true,
    virtual_lines = {
      only_current_line = true,
    },
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypeos nly
          -- "go"
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    if vim.g.neovide then
      vim.cmd "set guifont=Mononoki_Nerd_Font:h12"
      vim.g.neovide_refresh_rate = 60
      vim.g.neovide_scale_factor = 1
      vim.g.neovide_hide_mouse_when_typing = true
      vim.g.neovide_cursor_trail_size = 0.5
      vim.g.neovide_cursor_vfx_mode = "pixiedust"
      vim.g.neovide_cursor_vfx_particle_lifetime = 1
      vim.g.neovide_cursor_vfx_particle_density = 100
    end

    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWrite", {
      group = nil,
      pattern = "Cargo.toml",
      callback = function() vim.cmd "RustReloadWorkspace" end,
    })
    autocmd("BufReadPost", {
      group = nil,
      pattern = "Cargo.toml",
      callback = function(ctx)
        local buffer = ctx.buf
        local crates = require "crates"
        local unpack = unpack
        local opts = { silent = true, buffer = buffer }

        vim.keymap.set(
          "n",
          "<leader>Rt",
          crates.toggle,
          { desc = "Crates show/hide versions virtualtext/diagnostics", unpack(opts) }
        )
        vim.keymap.set("n", "<leader>Rr", crates.reload, { desc = "Reload/Clear cache", unpack(opts) })

        vim.keymap.set("n", "<leader>Rv", crates.show_versions_popup, { desc = "Show versions popup", unpack(opts) })
        vim.keymap.set("n", "<leader>Rf", crates.show_features_popup, { unpack(opts), desc = "show features popup" })
        vim.keymap.set(
          "n",
          "<leader>Rd",
          crates.show_dependencies_popup,
          { unpack(opts), desc = "show dependencies popup" }
        )

        vim.keymap.set("n", "<leader>Ru", crates.update_crate, { unpack(opts), desc = "update crate" })
        vim.keymap.set("v", "<leader>Ru", crates.update_crates, { unpack(opts), desc = "update crates" })
        vim.keymap.set("n", "<leader>Ra", crates.update_all_crates, { unpack(opts), desc = "update all crates" })
        vim.keymap.set("n", "<leader>RU", crates.upgrade_crate, { unpack(opts), desc = "upgrade crate" })
        vim.keymap.set("v", "<leader>RU", crates.upgrade_crates, { unpack(opts), desc = "upgrade crates" })
        vim.keymap.set("n", "<leader>RA", crates.upgrade_all_crates, { unpack(opts), desc = "upgrade all crates" })

        vim.keymap.set("n", "<leader>RH", crates.open_homepage, { unpack(opts), desc = "open homepage of the crate" })
        vim.keymap.set("n", "<leader>RR", crates.open_repository, { unpack(opts), desc = "open crate repo" })
        vim.keymap.set(
          "n",
          "<leader>RD",
          crates.open_documentation,
          { unpack(opts), desc = "open documentation of crate" }
        )
        vim.keymap.set("n", "<leader>RC", crates.open_crates_io, { unpack(opts), desc = "open crates io" })
      end,
    })
  end,
}
