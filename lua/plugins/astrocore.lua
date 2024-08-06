-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = {
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        shiftwidth = 4, -- number of space inserted for indentation
        showtabline = 4, -- always display tabline
        tabstop = 4, -- number of space in a tab
        updatetime = 100,
        cursorline = false,
        background = "dark",
        -- background = "light",
      },

      g = {},
    },

    -- Mappings
    mappings = {

      n = {
        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- live server
        sl = { ":LiveServerStart<cr>", desc = "Run server ..." },
        st = { ":LiveServerStop<cr>", desc = "Stop server" },

        -- buffers
        ["<leader>x"] = { ":bdelete<cr>", desc = "Close current buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },

        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
      },

      -- Visual mode
      v = {
        --  Movement -> or <-
        ["<"] = { "<gv", desc = "Indent left" },
        [">"] = { ">gv", desc = "Indent right" },

        --  Move lines up or down
        J = { ":move '>+1<CR>gv-gv", desc = "Move selection line down" },
        K = { ":move '<-2<CR>gv-gv", desc = "Move selection line up" },
      },

      t = {},

      -- Insert mode
      i = {},
    },
  },
}
