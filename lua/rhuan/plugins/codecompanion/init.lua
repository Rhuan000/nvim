return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionCLI",
      "CodeCompanionCodeReview",
    },
    opts = {
      adapters = {
        acp = {
          codex = function()
            local node = vim.fn.exepath("node")
            local npm_root = vim.fn.trim(vim.fn.system({ "npm", "root", "--global" }))
            local codex_acp = vim.fs.joinpath(
              npm_root,
              "@agentclientprotocol",
              "codex-acp",
              "dist",
              "index.js"
            )
            return require("codecompanion.adapters").extend("codex", {
              defaults = {
                auth_method = "chat-gpt",
              },
              commands = {
                default = { node, codex_acp },
              },
            })
          end,
        },
      },
      interactions = {
        chat = {
          adapter = {
            name = "codex",
            model = "gpt-5.4",
          },
          keymaps = {
            send = {
              modes = {
                n = "<C-s>",
                i = "<C-s>",
              },
            },
          },
        },
        code_review = {
          display = {
            diff = {
              enabled = true,
              layout = "horizontal",
              provider = "native",
            },
          },
        },
        cli = {
          agent = "codex",
          agents = {
            codex = {
              cmd = "codex",
              args = {},
              description = "OpenAI Codex CLI",
            },
          },
          opts = {
            auto_insert = true,
            reload = true,
          },
        },
      },
      display = {
        chat = {
          window = {
            layout = "vertical",
            position = "right",
          },
        },
        cli = {
          window = {
            layout = "horizontal",
            height = 0.3,
          },
        },
        input = {
          keymaps = {
            send = {
              modes = {
                n = "<C-s>",
                i = "<C-s>",
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("codecompanion").setup(opts)

      vim.keymap.set({ "n", "v" }, "<leader>cc", function()
        vim.cmd("CodeCompanionChat toggle")
      end, { desc = "CodeCompanion: abrir chat" })
      vim.keymap.set({ "n", "v" }, "<leader>cl", function()
        require("codecompanion").cli({ agent = "codex" })
      end, { desc = "CodeCompanion: abrir Codex" })
      vim.keymap.set("n", "<leader>ci", "V<cmd>CodeCompanion<CR>", {
        desc = "CodeCompanion: inline na linha atual",
      })
      vim.keymap.set("v", "<leader>ci", "<cmd>CodeCompanion<CR>", {
        desc = "CodeCompanion: inline na seleção",
      })
      vim.keymap.set({ "n", "v" }, "<leader>cr", "<cmd>CodeCompanionCodeReview<CR>", {
        desc = "CodeCompanion: revisar alterações",
      })
    end,
  },
}
