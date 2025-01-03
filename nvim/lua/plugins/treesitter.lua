-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
    indent = { enable = false },
    incremental_selection = {
      enable = true, -- Enable the feature
      keymaps = {
        init_selection = "gnn", -- Start selection
        node_incremental = "grn", -- Expand selection to the next node
        scope_incremental = "grc", -- Expand selection to the next scope
        node_decremental = "grm", -- Shrink selection
      },
    },
    -- Add this section for the Playground
    playground = {
      enable = true,
      updatetime = 25, -- Debounced time for highlighting nodes
      persist_queries = false, -- Whether queries persist across sessions
    },
  },
}
