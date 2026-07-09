return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          dap = true,
          gitsigns = true,
          treesitter = true,
          telescope = true,
          nvimtree = true,
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({})
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        git = { enable = true },
        actions = {
          change_dir = {
            enable = false,
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "yaml",
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "html",
        "css",
        "java",
        "rust",
        "c",
        "cpp",
      },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    },
  },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
    end,
  },
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
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
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
          auto_select = false,
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
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-y>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-n>",
          },
        },
        panel = {
          enabled = false,
        },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    cmd = { "CopilotChat", "CopilotChatToggle", "CopilotChatOpen", "CopilotChatClose" },
    config = function()
      require("CopilotChat").setup({
        model = "gpt-5.4-mini",
        auto_insert_mode = true,
        show_help = false,
        window = {
          layout = "float",
          width = 0.75,
          height = 0.8,
          border = "rounded",
          title = "AI Assistant",
        },
        mappings = {
          close = { normal = "q", insert = "<C-c>" },
          reset = { normal = "<C-l>", insert = "<C-l>" },
          submit_prompt = { normal = "<CR>", insert = "<C-s>" },
        },
        prompts = {
          QuarkusReview = {
            prompt = "Review this Quarkus/Java code for correctness, readability, and maintainability.",
            system_prompt = "You are reviewing a Java Quarkus project. Focus on practical fixes, not broad theory.",
            mapping = "<leader>cq",
            description = "Review Quarkus code",
          },
        },
      })
      vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>CopilotChatToggle<CR>", { desc = "Open AI chat" })
      vim.keymap.set({ "n", "v" }, "<leader>cr", "<cmd>CopilotChatReview<CR>", { desc = "Review selection" })
      vim.keymap.set({ "n", "v" }, "<leader>cq", "<cmd>CopilotChatQuarkusReview<CR>", { desc = "Review Quarkus code" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "ts_ls",
          "clangd",
          "jdtls",
          "solidity_ls",
          "yamlls",
        },
        automatic_enable = false,
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
            diagnostics = {
              enable = true,
              experimental = {
                enable = true,
              },
            },
          },
        },
      })

      vim.lsp.config("ts_ls", {})
      vim.lsp.config("clangd", {})
      vim.lsp.config("yamlls", {})

      vim.lsp.config("solidity_ls", {
        cmd = { "solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = function(bufnr)
          return vim.fs.root(bufnr, {
            "truffle-config.js",
            "hardhat.config.js",
            ".git",
          })
        end,
      })

      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("clangd")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("solidity_ls")
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        floating = {
          border = "rounded",
        },
      })

      require("nvim-dap-virtual-text").setup({})

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")
      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })
    end,
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = true,
          enter_on_send = false,
          mark_branch = true,
        },
      })
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({
        sign_priority = 6,
        current_line_blame = false,
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 10,
        open_mapping = [[<c-\>]],
        direction = "horizontal",
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
}