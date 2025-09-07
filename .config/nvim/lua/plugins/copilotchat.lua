return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    --build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    keys = {
      { "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
      { "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain code" },
      { "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review code" },
      { "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix code issues" },
      { "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize code" },
      { "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate docs" },
      { "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate tests" },
      { "<leader>zm", ":CopilotChatCommit<CR>", mode = "n", desc = "Generate commit message" },
      { "<leader>zm", ":CopilotChatCommit<CR>", mode = "v", desc = "Generate commit message for selection" },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
