return {
  -- formatter
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  --treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require "configs.treesitter"
    end,
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup {
        git = {
          ignore = false,
        },
      }
    end,
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
          no_ignore_parent = true,
          file_ignore_patterns = {
            "node_modules",
            "build/",
            "%.git/*",
          },
        },
      },
    },
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },

  -- git
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gcommit", "Gdiffsplit", "Gvdiffsplit", "Gstatus", "Gblame" },
    keys = {
      { "<leader>gs", "<cmd>Git<CR>", desc = "Git Status" },
      { "<leader>gc", "<cmd>Git commit<CR>", desc = "Git Commit" },
      { "<leader>gp", "<cmd>Git push<CR>", desc = "Git Push" },
      { "<leader>gl", "<cmd>Git pull<CR>", desc = "Git Pull" },
      { "<leader>gb", "<cmd>Git blame<CR>", desc = "Git Blame" },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  --markdown renderer
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    config = function()
      require "configs.markdown"
    end,
  },

  -- vim-dadbod / db
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "psql" } },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" },
    keys = {
      { "<leader>Du", "<cmd>DBUIToggle<CR>", desc = "DB UI toogle" },
      { "<leader>Da", "<cmd>DBUIAddConnection<CR>", desc = "DB Add a db connection" },
      { "<leader>Df", "<cmd>DBUIFindBuffer<CR>", desc = "DB find a db buffer" },
      { "<leader>Dr", "<cmd>DBUIRenameBuffer<CR>", desc = "DB rename a db buffer" },
    },
    init = function()
      vim.g.db_ui_save_location = vim.fn.stdpath "config" .. "/db_ui"
    end,
  },

  -- linter
  {
    "mfussenegger/nvim-lint",
    ft = { "c", "cpp", "javascript", "typescript", "html" },
    config = function()
      require "configs.linter"
    end,
  },

  -- debugger
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
    },
    ft = { "go", "c", "cpp", "rust", "zig" },
    config = function()
      require "configs.debugger"
    end,
  },

  --java plugin
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    ft = { "java" },
    config = function()
      require "configs.jdtls"
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- language specific
      "fredrikaverpil/neotest-golang",
      "lawrence-laz/neotest-zig",
      "alfaix/neotest-gtest",
    },
    ft = { "go", "zig", "cpp" },
    config = function()
      require "configs.neotest"
    end,
  },
}
