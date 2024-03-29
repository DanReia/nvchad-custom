local plugins = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          -- defaults 
          "vim",
          "lua",

          -- web dev 
          "html",
          "css",
          "javascript",
          "typescript",
          "json",

          -- general
          "python",

          -- low level
          "c",
          "rust"
        },
      },
    },
  -- In order to modify the `lspconfig` configuration:
    {
      "neovim/nvim-lspconfig",
       config = function()
          require "plugins.configs.lspconfig"
          require "custom.configs.lspconfig"
       end,
    },
   {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "rust-analyzer",
                "pyright",
                "mypy",
                "ruff",
                "black",
                "debugpy"

      },
    },
  },
  {
  "neovim/nvim-lspconfig",

   dependencies = {
     "jose-elias-alvarez/null-ls.nvim",
     config = function()
       require "custom.configs.null-ls"
     end,
   },
   config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
   end,
}
    ,
    {
        "rust-lang/rust.vim",
        ft="rust",
        init=function()
            vim.g.rustfmt_autosave=1
        end
    },
    {
        "simrat39/rust-tools.nvim",
        ft="rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function()
        return require "custom.configs.rust-tools"
        end,
        config=function(_,opts)
        require('rust-tools').setup(opts)
        end
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
    },
    {
        "mfussenegger/nvim-dap-python",
        ft="python",
        dependencies={
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui"
        },
        config=function(_,opts)
            local path= "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
                  require("core.utils").load_mappings("dap_python")

        end,
    },
    {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
    {
             "jose-elias-alvarez/null-ls.nvim",
        ft={"python"},
        opts=function()
            return "custom.configs.null-ls"
        end,
    },
    {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("chatgpt").setup({
      })
    end,
  }

}
return plugins
