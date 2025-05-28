return {
  -- Tema
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.g.tokyonight_style = "night" -- "day" ou "night"
      vim.cmd[[colorscheme tokyonight]]
    end
  },
-- Buffer para Tabs
  {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup{}
    end
  },

  -- Nvim Tree (Explorador de arquivos)
  { 
    "nvim-tree/nvim-tree.lua", 
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        git = { enable = true },
      })
    end
  },

  -- Treesitter (para sintaxe)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = { "lua", "vim", "bash", "python", "rust", "java", "cpp", "typescript" }
      })
    end
  },

  -- Plenary (dependência comum para outros plugins)
  { "nvim-lua/plenary.nvim" },

  -- Telescope (busca de arquivos)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
    end
  },

  -- nvim-cmp (completar automaticamente)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",      -- Para completar via LSP
      "hrsh7th/cmp-buffer",        -- Para completar com palavras do buffer
      "saadparwaiz1/cmp_luasnip",  -- Para completar com snippets
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)  -- Expande snippets com LuaSnip
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),   -- Ativa a janela de sugestão
	  ['<Tab>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
		   cmp.select_next_item()
	        else
		  fallback()
		end
	       end, {'i', 's'}),
	  ['<S-Tab>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
		  cmp.select_prev_item()
	        else
		  fallback()
		end
	      end, {'i', 's'}),

          ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirma a sugestão
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },  -- Fonte de autocompletar do LSP
          { name = 'luasnip' },   -- Fonte de snippets
        }, {
          { name = 'buffer' },    -- Fonte de autocompletar do buffer
        })
      })
    end
  },

  -- Configuração do LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("mason").setup()  -- Inicializa o Mason
      require("mason-lspconfig").setup()  -- Configura o Mason com o LSP

      -- Configurações dos servidores LSP
      require("lspconfig")["rust_analyzer"].setup{}
      require("lspconfig")["ts_ls"].setup{}  -- Para TypeScript
      require("lspconfig")["clangd"].setup{}   -- Para C++
      require("lspconfig")["jdtls"].setup{}    -- Para Java
      require("lspconfig")["solidity"].setup{
        cmd = { "solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = require("lspconfig").util.root_pattern("truffle-config.js", "hardhat.config.js", ".git"),
      }

    end
  },

  -- LuaSnip (snippets)
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },  -- Snippets prontos
    config = function()
      local luasnip = require'luasnip'
      luasnip.config.set_config({
        history = true,  -- Mantém histórico de snippets
        updateevents = "TextChanged,TextChangedI",  -- Atualiza automaticamente
      })
    end
  },

  -- Harpoon (navegação rápida de arquivos)
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = true,
          enter_on_send = false,
          mark_branch = true,
        }
      })
    end
  },
  {
    "tpope/vim-fugitive",
    config = function()
    end
  }
    
}

