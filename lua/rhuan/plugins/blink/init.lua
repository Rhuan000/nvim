return {
    {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        preset = "default",

        ["<Tab>"] = {
          "select_next",
          "fallback",
        },

        ["<S-Tab>"] = {
          "select_prev",
          "fallback",
        },

        ["<CR>"] = {
          "accept",
          "fallback",
        },

        -- deixa o Ctrl+y livre para o Copilot
        ["<C-y>"] = {
          "fallback",
        },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
        },

        ghost_text = {
          enabled = false,
        },

        menu = {
          auto_show = true,
        },
      },

      sources = {
        default = {
          "lsp",
          "snippets",
          "buffer",
          "path",
        },
      },
    },
  }
}
