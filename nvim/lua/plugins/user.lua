-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- Add plugins
  -- ============================================
  "nvim-treesitter/playground",
  "terryma/vim-multiple-cursors",
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded",
        },
      }
    end,
  },

  -- Configure default plugins
  -- ============================================
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      opts.winbar = nil -- Disable the winbar

      return opts
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,          -- Show hidden files by default
          hide_dotfiles = false,   -- Do not hide dotfiles
          hide_gitignored = false, -- Hide files ignored by Git
          -- Additional filter settings can be added here
        },
        -- Other filesystem settings can be added here
      },
      -- Other Neo-tree settings can be added here
    },
  },

  -- Disable default plugins
  -- ===========================================
  { "max397574/better-escape.nvim", enabled = false },
}
