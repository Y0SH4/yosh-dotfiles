return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 300,
    icons = {
      mappings = true,
      keys = {},
    },
    win = {
      border = "rounded",
      padding = { 1, 2 },
    },
    layout = {
      width = { min = 20, max = 50 },
      spacing = 3,
    },
    spec = {
      -- Buffer jump shortcuts (hidden from which-key)
      { "<leader>1", hidden = true },
      { "<leader>2", hidden = true },
      { "<leader>3", hidden = true },
      { "<leader>4", hidden = true },
      { "<leader>5", hidden = true },
      { "<leader>6", hidden = true },
      { "<leader>7", hidden = true },
      { "<leader>8", hidden = true },
      { "<leader>9", hidden = true },
      
      -- File operations
      { "<leader>f", group = "󰈞 Find/Format" },
      { "<leader>ff", desc = "Find Files" },
      { "<leader>fg", desc = "Live Grep" },
      { "<leader>fb", desc = "Find Buffers" },
      { "<leader>fh", desc = "Help Tags" },
      { "<leader>fr", desc = "Recent Files" },
      { "<leader>fc", desc = "Colorschemes" },
      { "<leader>fk", desc = "Keymaps" },
      { "<leader>fm", desc = "Marks" },
      { "<leader>fj", desc = "Jump List" },
      { "<leader>fs", desc = "Document Symbols" },
      { "<leader>fS", desc = "Workspace Symbols" },
      { "<leader>ft", desc = "Todo Comments" },
      
      -- Buffer operations
      { "<leader>b", group = "󰓩 Buffer" },
      { "<leader>bo", desc = "Close Others" },
      { "<leader>br", desc = "Close Right" },
      { "<leader>bl", desc = "Close Left" },
      { "<leader>c", desc = "Close Buffer" },
      
      -- LSP operations
      { "<leader>r", group = " Refactor" },
      { "<leader>rn", desc = "Rename" },
      { "<leader>ca", desc = "Code Action" },
      
      -- Diagnostics (conflicts with debug, but keeping for now)
      { "<leader>d", group = " Diagnostics" },
      { "<leader>dq", desc = "Set LocList" },
      
      -- Git operations
      { "<leader>g", group = " Git" },
      { "<leader>gs", desc = "Status" },
      { "<leader>gc", desc = "Commit" },
      { "<leader>gp", desc = "Push" },
      { "<leader>gP", desc = "Pull" },
      { "<leader>gb", desc = "Branches" },
      { "<leader>gd", desc = "Diff" },
      { "<leader>gh", desc = "Hunk" },
      
      -- TypeScript operations
      { "<leader>t", group = "󰛦 TypeScript" },
      { "<leader>to", desc = "Organize Imports" },
      { "<leader>ts", desc = "Sort Imports" },
      { "<leader>tu", desc = "Remove Unused" },
      { "<leader>td", desc = "Go to Source" },
      { "<leader>ti", desc = "Add Missing Imports" },
      { "<leader>tf", desc = "Fix All" },
      { "<leader>tr", desc = "Rename File" },
      { "<leader>tF", desc = "File References" },
      
      -- Terminal
      { "<leader>T", group = " Terminal" },
      { "<leader>Tf", desc = "Float Terminal" },
      { "<leader>Th", desc = "Horizontal Terminal" },
      { "<leader>Tv", desc = "Vertical Terminal" },
      
      -- Live Server & Web Dev
      { "<leader>l", group = "󰖟 Live Server" },
      { "<leader>ls", desc = "Start Server" },
      { "<leader>lx", desc = "Stop Server" },
      
      -- Markdown
      { "<leader>m", group = " Markdown" },
      { "<leader>mp", desc = "Preview" },
      { "<leader>ms", desc = "Stop Preview" },
      { "<leader>mt", desc = "Toggle Preview" },
      
      -- Package.json
      { "<leader>n", group = "󰏗 NPM/Package" },
      { "<leader>ns", desc = "Show Versions" },
      { "<leader>nc", desc = "Hide Versions" },
      { "<leader>nt", desc = "Toggle Versions" },
      { "<leader>nu", desc = "Update Package" },
      { "<leader>nd", desc = "Delete Package" },
      { "<leader>ni", desc = "Install Package" },
      { "<leader>np", desc = "Change Version" },
      
      -- Session (conflicts with search plugins, but keeping)
      { "<leader>s", group = " Session" },
      { "<leader>ss", desc = "Restore Session" },
      { "<leader>sl", desc = "Last Session" },
      { "<leader>sd", desc = "Don't Save" },
      
      -- JSON/JQ
      { "<leader>j", group = "󰘦 JSON" },
      { "<leader>jq", desc = "JQ Query" },
      { "<leader>jf", desc = "Format JSON" },
      
      -- Color Picker
      { "<leader>cp", desc = "Color Picker" },
      { "<leader>cc", desc = "Convert Color" },
      { "<leader>ch", desc = "Toggle Highlighter" },
      
      -- Emmet
      { "<leader>x", group = "󱘤 Emmet/Extras" },
      { "<leader>xe", desc = "Wrap with Abbreviation" },
      
      -- Auto Import
      { "<leader>i", group = " Import" },
      { "<leader>im", desc = "Auto Import" },
      
      -- Clipboard
      { "<leader>y", desc = "Copy to Clipboard" },
      { "<leader>Y", desc = "Copy Line to Clipboard" },
      { "<leader>p", desc = "Paste from Clipboard" },
      { "<leader>P", desc = "Paste Before" },
      
      -- Window/File operations
      { "<leader>w", desc = "Save File" },
      { "<leader>e", desc = "Toggle File Explorer" },
      
      -- LSP keybindings (without leader)
      { "g", group = " Go to" },
      { "gd", desc = "Definition" },
      { "gr", desc = "References" },
      { "gi", desc = "Implementation" },
      { "gb", desc = "Go Back" },
      { "gf", desc = "Go Forward" },
      { "K", desc = "Hover Documentation" },
      { "[d", desc = "Previous Diagnostic" },
      { "]d", desc = "Next Diagnostic" },
      { "[t", desc = "Previous Todo" },
      { "]t", desc = "Next Todo" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:[vV\\x16]*",
      callback = function()
        vim.b.which_key_block = true
      end,
    })
  end,
}
