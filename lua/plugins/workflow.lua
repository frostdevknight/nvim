return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = { eslint = {} },
  --     setup = {
  --       eslint = function()
  --         require("lazyvim.util").lsp.on_attach(function(client)
  --           if client.name == "eslint" then
  --             client.server_capabilities.documentFormattingProvider = true
  --           elseif client.name == "tsserver" then
  --             client.server_capabilities.documentFormattingProvider = false
  --           end
  --         end)
  --       end,
  --     },
  --   },
  -- },
  -- {
  --   "yaegassy/coc-volar",
  -- },
  -- {
  --   "github/copilot.vim",
  -- },
  -- Configure Flash to use <leader>s instead of s
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- other Flash options can go here
  --     -- default options are defined in the Flash plugin
  --   },
  --   keys = {
  --     {
  --       "ś",
  --       mode = { "n", "x", "o" },
  --       function()
  --         require("flash").jump()
  --       end,
  --       desc = "Flash",
  --     },
  --     {
  --       "Ś",
  --       mode = { "n", "o", "x" },
  --       function()
  --         require("flash").treesitter()
  --       end,
  --       desc = "Flash Treesitter",
  --     },
  --     { "s", mode = { "n", "x", "o" }, false },
  --     { "S", mode = { "n", "o", "x" }, false },
  --   },
  -- },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  -- Uncoment to enable autosave
  -- {
  -- "okuuva/auto-save.nvim",
  --cmd = "ASToggle", -- optional for lazy loading on command
  --event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  --opts = {
  -- your config goes here
  -- or just leave it empty :)
  --execution_message = { enabled = false },
  --},
  --},
}
