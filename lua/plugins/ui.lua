return {
  { "folke/snacks.nvim", opts = { dashboard = { enabled = false } } },
  -- logo
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
 █████╗ ██╗   ██╗██████╗  ██████╗ ██████╗  █████╗ 
██╔══██╗██║   ██║██╔══██╗██╔═══██╗██╔══██╗██╔══██╗
███████║██║   ██║██████╔╝██║   ██║██████╔╝███████║
██╔══██║██║   ██║██╔══██╗██║   ██║██╔══██╗██╔══██║
██║  ██║╚██████╔╝██║  ██║╚██████╔╝██║  ██║██║  ██║
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
                                                  
⋆꙳•̩̩͙❅*̩̩͙‧͙ ‧͙*̩̩͙❆ ͙͛ ˚₊⋆🌨️❄⟡❄️🌨️⋆꙳•̩̩͙❅*̩̩͙‧͙ ‧͙*̩̩͙❆ ͙͛ ˚₊⋆
 ]]

      opts.config.header = vim.split(logo, "\n")
      opts.config.vertical_center = true

      -- Gradient colors (Modify these to change the effect)
      local colors = {
        "#2f7ac8", -- **Ancient Ice** (Darker frost magic, sits at the top)
        "#4b9ade", -- **Frozen Depths** (Deep but balanced icy tone)
        "#3cb8f2", -- **Glacial Spirit** (Bright, magical ice)
        "#47d7ff", -- **Pure Frost Magic** (Luminous cold magic)
        "#6be4ff", -- **Runic Chill** (Soft cyan glow)
        "#8fd9ff", -- **Frozen Whisper** (Brightest icy highlight, now at the bottom)
      }

      -- Autocommand to apply gradient after dashboard is fully loaded
      vim.api.nvim_create_autocmd("User", {
        callback = function()
          local bufnr = vim.api.nvim_get_current_buf()
          local ns_id = vim.api.nvim_create_namespace("dashboard_gradient")

          -- Find the actual line numbers of the header
          local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
          local header_start = nil

          for i, line in ipairs(lines) do
            if line:find("█████╗") then -- Match the first line of the header
              header_start = i - 1 -- Convert to zero-based index
              break
            end
          end

          if not header_start then
            return
          end

          -- Create gradient highlight groups & apply them to the correct lines
          for i, _ in ipairs(opts.config.header) do
            local hl_group = "DashboardHeaderGradient" .. i
            local target_line = header_start + (i - 1)

            vim.api.nvim_set_hl(0, hl_group, { fg = colors[(i - 1) % #colors + 1] })
            vim.api.nvim_buf_add_highlight(bufnr, ns_id, hl_group, target_line, 0, -1)
          end

          -- Ensure DashboardHeader exists with a base color
          vim.api.nvim_set_hl(0, "DashboardHeader", { fg = colors[1] })
        end,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.theme = {
        normal = {
          a = { fg = "#0d1722", bg = "#4ea8ff", gui = "bold" }, -- Icy blue, dark text
          b = { fg = "#ffffff", bg = "#142033" }, -- Frosty steel blue
          c = { fg = "#b0c7d8", bg = "#0a0f1c" }, -- Subtle light blue on dark navy
        },
        insert = {
          a = { fg = "#0d1722", bg = "#86d3f8", gui = "bold" }, -- Slightly brighter ice blue
          b = { fg = "#ffffff", bg = "#1f3b5f" }, -- Deep steel blue
          c = { fg = "#b0c7d8", bg = "#0a0f1c" },
        },
        visual = {
          a = { fg = "#0d1722", bg = "#98e6ff", gui = "bold" }, -- Bright but not overwhelming
          b = { fg = "#ffffff", bg = "#1f3b5f" },
          c = { fg = "#b0c7d8", bg = "#0a0f1c" },
        },
        replace = {
          a = { fg = "#ffffff", bg = "#8a2be2", gui = "bold" }, -- Deep mystical purple
          b = { fg = "#ffffff", bg = "#1f3b5f" },
          c = { fg = "#b0c7d8", bg = "#0a0f1c" },
        },
        command = {
          a = { fg = "#0d1722", bg = "#57a3f3", gui = "bold" }, -- Cool frosty blue
          b = { fg = "#ffffff", bg = "#1f3b5f" },
          c = { fg = "#b0c7d8", bg = "#0a0f1c" },
        },
      }
    end,
  },
}
